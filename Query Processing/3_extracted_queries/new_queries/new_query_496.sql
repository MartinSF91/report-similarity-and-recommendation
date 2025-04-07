SELECT trim(l62.partno) Article,
       trim(l62.partrev) Supplier,
       trim(l62.divcode) CDC,
       TRIM(l62.partno)||'-'||TRIM(l62.partrev) artsup,
       g08.ecarrno "Pallet ID",
       l62.cquant "Pallet Qty",
       SUBSTR(l62.wldct, 1, 1) "Pallet Class",
       g08.amooncr "Qty",
       l62.cquant/l62.cquant "Pallets",
       l62.partunit,
       (CASE
            WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
            ELSE dwpact.scnetvol
        END)/1000 "Article Volume",
       (g08.amooncr*(CASE
                         WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                         ELSE dwpact.scnetvol
                     END))/1000 "Pallet Volume"
FROM g08t1 g08
INNER JOIN l62t1 l62 ON (g08.shortl62 = l62.shortl62)
INNER JOIN g08t90 g089 ON (g089.carrno = g08.carrno)
INNER JOIN dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
INNER JOIN dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                             AND dwpk.bucodsup = dwpact.bucodsup
                             AND dwpk.fpacdate = dwpact.fpacdate
                             AND dwpk.reqdwpno = dwpact.reqdwpno
                             AND dwpk.reqdwped = dwpact.reqdwped)
WHERE l62.divcode NOT IN ('017',
                          '061',
                          '019',
                          '345',
                          '460',
                          '490',
                          '021',
                          '030')
  AND l62.parttype = 1
  AND l62.partno != '00000001'
  AND g08.carrstat = 6
  AND g08.carrtype = 0