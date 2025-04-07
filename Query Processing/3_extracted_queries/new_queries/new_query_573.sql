SELECT TRIM(partno) article,
       TRIM(partrev) supplier,
       TRIM(partno)||'-'||TRIM(partrev) artsup,
       wldct "Pallet Type",
       SUBSTR(wldct, 1, 1) "Pallet Class"
FROM l62t1
WHERE divcode IN ('345',
                  '532',
                  '017',
                  '019',
                  '490',
                  '061',
                  '460',
                  '030')