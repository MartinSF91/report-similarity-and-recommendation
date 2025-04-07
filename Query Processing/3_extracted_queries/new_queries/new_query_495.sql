SELECT C1.closedate "Closed Date",
       g30.notedate "Advised Date",
       CASE
           WHEN TRUNC(C1.closedate) > TRUNC(g30.notedate+2) THEN 'Late'
           ELSE 'On Time'
       END "Receiving Status",
       l16.shortg30,
       CASE
           WHEN LENGTH(TRIM(SUBSTR(l16.delid, 1, instr(l16.delid, ' ', 1, 1)))) > 8 THEN SUBSTR(l16.delid, 1, 12)
           ELSE TRIM(SUBSTR(l16.delid, 1, instr(l16.delid, ' ', 1, 1)))
       END "Shipment #",
       l16.delid,
       l16.shortg36,
       CASE
           WHEN l16.g08stort IN (22,
                                 25,
                                 28) THEN 'Transit'
           ELSE 'Normal'
       END SLType,
       l16.partno Article,
       l16.partrev Supplier,
       l16.divcode DC,
       TRIM(l16.partno)||'-'||TRIM(l16.partrev) artsup,
       l16.ecarrno "Pallet ID",
       l16.delid "Transport ID",
       l16.l16qty "Qty",
       l62.cquant "Pallet Qty",
       g04.butypecr,
       SUM(l16.l16qty)/l62.cquant "Pallets",
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
FROM astro.l16t3 l16
INNER JOIN astro.l62t1 l62 ON (l16.shortl62 = l62.shortl62)
INNER JOIN astro.g08t1 g08 ON (l16.carrno = g08.carrno)
INNER JOIN astro.g08t90 g089 ON (g089.carrno = g08.carrno)
INNER JOIN astro.dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
INNER JOIN astro.dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                   AND dwpk.bucodsup = dwpact.bucodsup
                                   AND dwpk.fpacdate = dwpact.fpacdate
                                   AND dwpk.reqdwpno = dwpact.reqdwpno
                                   AND dwpk.reqdwped = dwpact.reqdwped)
INNER JOIN astro.g04t90 g04 ON (g04.shortg04 = l16.shortg04)
INNER JOIN astro.g30t1 g30 ON (l16.shortg30 = g30.shortg30)
INNER JOIN
  (SELECT l16.shortg30,
          min(l16.datreg) closedate
   FROM astro.l16t3 l16
   INNER JOIN astro.l62t1 l62 ON (l16.shortl62 = l62.shortl62)
   WHERE l16lcode = 245
     AND l16.logguser != 'STKSWTUN'
     AND l16.divcode NOT IN ('017',
                             '061',
                             '019',
                             '345',
                             '460',
                             '490',
                             '021',
                             '030')
     AND l62.parttype = 1
     AND l62.partno != '00000001'
     AND l16.datreg >=
       (SELECT next_day(trunc(sysdate), 'Sunday') - 14 datstart
        FROM DUAL)
     AND l16.datreg <
       (SELECT next_day(trunc(sysdate), 'Sunday') - 7 datend
        FROM DUAL)
   GROUP BY l16.shortg30) C1 ON (l16.shortg30 = C1.shortg30)
WHERE l16.divcode NOT IN ('017',
                          '061',
                          '019',
                          '345',
                          '460',
                          '490',
                          '021',
                          '030')
  AND l16.l16lcode = 1
  AND l62.parttype = 1
  AND l62.partno != '00000001'
  AND logguser != 'STKSWTUN'
  AND g04.butypecr != 'LSC'
GROUP BY C1.closedate,
         g30.notedate,
         CASE
             WHEN TRUNC(C1.closedate) > TRUNC(g30.notedate+2) THEN 'Late'
             ELSE 'On Time'
         END,
         l16.shortg30,
         CASE
             WHEN LENGTH(TRIM(SUBSTR(l16.delid, 1, instr(l16.delid, ' ', 1, 1)))) > 8 THEN SUBSTR(l16.delid, 1, 12)
             ELSE TRIM(SUBSTR(l16.delid, 1, instr(l16.delid, ' ', 1, 1)))
         END,
         l16.delid,
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
         l16.delid,
         l16.l16qty,
         l62.cquant,
         g04.butypecr,
         SUBSTR(l16.ldct, 1, 1),
         (CASE
              WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
              ELSE dwpact.scnetvol
          END)/1000,
         (l16.l16qty*(CASE
                          WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                          ELSE dwpact.scnetvol
                      END))/1000