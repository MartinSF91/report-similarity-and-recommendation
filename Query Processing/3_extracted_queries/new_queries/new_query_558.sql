SELECT C2.startdate "Start Date",
       C1.closedate "Closed Date",
       TO_CHAR(C1.closedate+1, 'IW') "Close Week",
       CASE
           WHEN C1.closedate IS NULL THEN (sysdate - C2.startdate)*24
           ELSE (C1.closedate - C2.startdate)*24
       END "Elapsed Hours",
       CASE
           WHEN C1.closedate IS NULL THEN ROUND((sysdate - C2.startdate)*24, 0)
           ELSE ROUND((C1.closedate - C2.startdate)*24, 0)
       END "Elapsed Hours Rounded",
       CASE
           WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)*1440
           ELSE ROUND(C1.closedate - C2.startdate, 2)*1440
       END "Elapsed Minutes Rounded",
       CASE
           WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)
           ELSE ROUND(C1.closedate - C2.startdate, 2)
       END "Elapsed Days Rounded",
       g30.notedate "Advised Date",
       CASE
           WHEN TRUNC(C1.closedate) > TRUNC(g30.notedate+2) THEN 'Late'
           ELSE 'On Time'
       END "Receiving Status",
       TO_CHAR(l16.shortg30) "Short G30",
       CASE
           WHEN LENGTH(TRIM(SUBSTR(l16.l16delid, 1, instr(l16.l16delid, ' ', 1, 1)))) > 8 THEN SUBSTR(l16.l16delid, 1, 12)
           ELSE TRIM(SUBSTR(l16.l16delid, 1, instr(l16.l16delid, ' ', 1, 1)))
       END "Shipment #",
       l16.l16delid delid,
       TO_CHAR(l16.shortg36) "Short G36",
       CASE
           WHEN l16.g08stort IN (22,
                                 25,
                                 28) THEN 'Transit'
           ELSE 'Normal'
       END SLType,
       TRIM(l16.partno) Article,
       l16.partrev Supplier,
       TRIM(l16.divcode) CDC,
       TRIM(l16.partno)||'-'||TRIM(l16.partrev) artsup,
       TRIM(TO_CHAR(l16.ecarrno)) "Pallet ID",
       l62.wmha "Buffer MHA",
       CASE
           WHEN l62.wmha IN 'CONV' THEN 'Conventional'
           WHEN l62.wmha IN 'AUTO' THEN 'Auto'
           ELSE 'UNDEF'
       END "Buff MHA",
       l16.l16delid "Transport ID",
       l16.l16qty "Qty",
       l62.cquant "Pallet Qty",
       g04.butypecr,
       SUM(l16.l16qty)/l62.cquant "Pallets",
       l16.ldct "LdCT",
       SUBSTR(l16.ldct, 1, 1) "Pallet Class",
       (CASE
            WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
            ELSE dwpact.scnetvol
        END)/1000 "Article Volume",
       (l16.l16qty*(CASE
                        WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                        ELSE dwpact.scnetvol
                    END))/1000 "Received Volume",
       1/COUNT (*) OVER(PARTITION BY l16.shortg30
                        ORDER BY l16.shortg30) shpmentsum
FROM ast019.l16t3 l16
INNER JOIN ast019.l62t1 l62 ON (l16.shortl62 = l62.shortl62)
INNER JOIN ast019.g08t1 g08 ON (l16.carrno = g08.carrno)
INNER JOIN ast019.g08t90 g089 ON (g089.carrno = g08.carrno)
INNER JOIN ast019.dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
INNER JOIN ast019.dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                    AND dwpk.bucodsup = dwpact.bucodsup
                                    AND dwpk.fpacdate = dwpact.fpacdate
                                    AND dwpk.reqdwpno = dwpact.reqdwpno
                                    AND dwpk.reqdwped = dwpact.reqdwped)
INNER JOIN ast019.g04t90 g04 ON (g04.shortg04 = l16.shortg04)
INNER JOIN ast019.g30t1 g30 ON (l16.shortg30 = g30.shortg30)
INNER JOIN
  (SELECT l16.shortg30,
          min(l16.datreg) closedate
   FROM ast019.l16t3 l16
   INNER JOIN ast019.l62t1 l62 ON (l16.shortl62 = l62.shortl62)
   WHERE l16lcode = 245
     AND l16.logguser != 'STKSWTUN'
     AND l16.divcode NOT IN ('017',
                             '061',
                             '019',
                             '345',
                             '460',
                             '490')
     AND l62.parttype = 1
     AND l62.partno != '00000001'
     AND l16.datreg >=
       (SELECT next_day(trunc(sysdate), 'Sunday') - 7 datstart
        FROM DUAL)
     AND l16.datreg <
       (SELECT next_day(trunc(sysdate), 'Sunday') - 0 datend
        FROM DUAL)
   GROUP BY l16.shortg30) C1 ON (l16.shortg30 = C1.shortg30)
INNER JOIN
  (SELECT l16.shortg30,
          min(l16.datreg) startdate
   FROM ast019.l16t3 l16
   INNER JOIN ast019.l62t1 l62 ON (l16.shortl62 = l62.shortl62)
   WHERE l16lcode = 1
     AND l16.logguser != 'STKSWTUN'
     AND l16.divcode NOT IN ('017',
                             '061',
                             '345',
                             '460',
                             '490')
     AND l62.parttype = 1
     AND l62.partno != '00000001'
     AND l16.datreg >=
       (SELECT next_day(trunc(sysdate), 'Sunday') - 7 datstart
        FROM DUAL)
     AND l16.datreg <
       (SELECT next_day(trunc(sysdate), 'Sunday') - 0 datend
        FROM DUAL)
   GROUP BY l16.shortg30) C2 ON (l16.shortg30 = C2.shortg30)
WHERE l16.divcode NOT IN ('017',
                          '061',
                          '019',
                          '345',
                          '460',
                          '490')
  AND l16.l16lcode = 1
  AND l62.parttype = 1
  AND l62.partno != '00000001'
  AND logguser != 'STKSWTUN'
  AND g04.butypecr != 'LSC'
GROUP BY C2.startdate,
         C1.closedate,
         TO_CHAR(C1.closedate, 'IW'),
         CASE
             WHEN C1.closedate IS NULL THEN (sysdate - C2.startdate)*24
             ELSE (C1.closedate - C2.startdate)*24
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND((sysdate - C2.startdate)*24, 0)
             ELSE ROUND((C1.closedate - C2.startdate)*24, 0)
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)*1440
             ELSE ROUND(C1.closedate - C2.startdate, 2)*1440
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)
             ELSE ROUND(C1.closedate - C2.startdate, 2)
         END,
         CASE
             WHEN C1.closedate IS NULL THEN (sysdate - C2.startdate)*24
             ELSE (C1.closedate - C2.startdate)*24
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND((sysdate - C2.startdate)*24, 0)
             ELSE ROUND((C1.closedate - C2.startdate)*24, 0)
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)*1440
             ELSE ROUND(C1.closedate - C2.startdate, 2)*1440
         END,
         CASE
             WHEN C1.closedate IS NULL THEN ROUND(sysdate - C2.startdate, 2)
             ELSE ROUND(C1.closedate - C2.startdate, 2)
         END,
         g30.notedate,
         CASE
             WHEN TRUNC(C1.closedate) > TRUNC(g30.notedate+2) THEN 'Late'
             ELSE 'On Time'
         END,
         l16.shortg30,
         CASE
             WHEN LENGTH(TRIM(SUBSTR(l16.l16delid, 1, instr(l16.l16delid, ' ', 1, 1)))) > 8 THEN SUBSTR(l16.l16delid, 1, 12)
             ELSE TRIM(SUBSTR(l16.l16delid, 1, instr(l16.l16delid, ' ', 1, 1)))
         END,
         l16.l16delid,
         l16.shortg36,
         CASE
             WHEN l16.g08stort IN (22,
                                   25,
                                   28) THEN 'Transit'
             ELSE 'Normal'
         END,
         l16.partno,
         l16.partrev,
         l16.divcode,
         TRIM(l16.partno)||'-'||TRIM(l16.partrev),
         l16.ecarrno,
         l62.wmha,
         CASE
             WHEN l62.wmha IN 'CONV' THEN 'Conventional'
             WHEN l62.wmha IN 'AUTO' THEN 'Auto'
             ELSE 'UNDEF'
         END,
         l16.l16delid,
         l16.l16qty,
         l62.cquant,
         g04.butypecr,
         l16.ldct,
         SUBSTR(l16.ldct, 1, 1),
         (CASE
              WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
              ELSE dwpact.scnetvol
          END)/1000,
         (l16.l16qty*(CASE
                          WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                          ELSE dwpact.scnetvol
                      END))/1000