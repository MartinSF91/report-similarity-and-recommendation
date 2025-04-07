SELECT TO_CHAR(l16.datreg, 'MM/DD/YYYY') "Date",
       TRIM(l16.partno) "Article",
       TRIM(l16.partrev) "Supplier",
       TRIM(l16.divcode) "Division",
       l16.ecarrno "Pallet ID",
       l16.l16qty "Qty",
       dwpul.ulqty "FPQ",
       SUBSTR(l16.ldct, 1, 1) "Pallet Class",
       '1' "Replenishment Count",
           (CASE
                WHEN dwp.umcodqty = 'CMT' THEN (dwp.scnetvol/100)
                ELSE dwp.scnetvol
            END)/1000 "Unit Volume",
           ((CASE
                 WHEN dwp.umcodqty = 'CMT' THEN (dwp.scnetvol/100)
                 ELSE dwp.scnetvol
             END)/1000) * l16.l16qty "Volume"
FROM l16t3 l16,
     l62t1 l62,
     g08t1 g08,
     g08t90 g90,
     dwpkey dk,
     dwpact dwp,
     DWPACTUL dwpul
WHERE l16.shortl62 = l62.shortl62
  AND l16.divcode IN ('345',
                      '532',
                      '017',
                      '019',
                      '490',
                      '061',
                      '460',
                      '030',
                      '021')
  AND l16.l16lcode = 3
  AND l16.l54movet = 3
  AND l16.l16destc = 3
  AND l62.parttype = 1
  AND l16.datreg >=
    (SELECT next_day(trunc(sysdate), 1) - 14 datstart
     FROM DUAL)
  AND l16.datreg <
    (SELECT next_day(trunc(sysdate), 1) - 7 datend
     FROM DUAL)
  AND l62.partno != '00000001'
  AND l16.carrno = g08.carrno
  AND g08.carrno = g90.carrno
  AND dk.shortdwp = g90.shortdwp
  AND dk.itemno = dwp.itemno
  AND dk.reqdwpno = dwp.reqdwpno
  AND dk.reqdwped = dwp.reqdwped
  AND dk.bucodsup = dwp.bucodsup
  AND dk.fpacdate = dwp.fpacdate
  AND dk.itemno = dwpul.itemno
  AND dk.reqdwpno = dwpul.reqdwpno
  AND dk.reqdwped = dwpul.reqdwped
  AND dk.bucodsup = dwpul.bucodsup
  AND dk.fpacdate = dwpul.fpacdate