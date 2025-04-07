SELECT TO_CHAR(l16.datreg, 'MM/DD/YYYY') "Closed Date",
       l16.partno Article,
       l16.partrev Supplier,
       l16.divcode CDC,
       TRIM(l16.partno)||'-'||TRIM(l16.partrev) artsup,
       CASE
           WHEN l16.logguser = 'L56STOSW' THEN 'Auto'
           ELSE 'Manual'
       END "Trigger",
       CASE
           WHEN l16.logguser != 'L56STOSW'
                AND l16.l16qty/dwpul.ulqty < .8 THEN 'Plock'
           ELSE 'Full'
       END "Pick Type",
       l16.ecarrno "Pallet ID",
       l16.l16qty "Qty",
       dwpul.ulqty "Pallet Qty",
       l16.l16qty/dwpul.ulqty "Pallets",
       SUBSTR(l16.ldct, 1, 1) "Pallet Class",
       (CASE
            WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
            ELSE dwpact.scnetvol
        END)/1000 "Article Volume",
       (l16.l16qty*(CASE
                        WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                        ELSE dwpact.scnetvol
                    END))/1000 "Received Volume"
FROM l16t3 l16
INNER JOIN l62t1 l62 ON (l16.shortl62 = l62.shortl62)
INNER JOIN g08t1 g08 ON (l16.carrno = g08.carrno)
INNER JOIN g08t90 g089 ON (g089.carrno = g08.carrno)
INNER JOIN dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
INNER JOIN dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                             AND dwpk.bucodsup = dwpact.bucodsup
                             AND dwpk.fpacdate = dwpact.fpacdate
                             AND dwpk.reqdwpno = dwpact.reqdwpno
                             AND dwpk.reqdwped = dwpact.reqdwped)
INNER JOIN dwpactul dwpul ON (dwpk.itemno = dwpul.itemno
                              AND dwpk.bucodsup = dwpul.bucodsup
                              AND dwpk.fpacdate = dwpul.fpacdate
                              AND dwpk.reqdwpno = dwpul.reqdwpno
                              AND dwpk.reqdwped = dwpul.reqdwped)
WHERE l16.l16lcode = 11
  AND l16.datreg BETWEEN
    (SELECT next_day(trunc(sysdate), 'Sunday') - 14 datstart
     FROM DUAL) AND
    (SELECT next_day(trunc(sysdate), 'Sunday') - 7 datend
     FROM DUAL)