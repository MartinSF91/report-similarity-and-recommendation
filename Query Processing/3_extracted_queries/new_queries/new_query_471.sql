
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."RACK" "WhsLoc_Rack",
       CASE
           WHEN "L30T1"."ZONE"='E' THEN 'Euro'
           WHEN "L30T1"."ZONE"='UB' THEN 'Uberbreit'
           WHEN "L30T1"."ZONE"='I' THEN 'IKEA'
           ELSE 'keine BZ eingetragen'
       END "c3",
       CASE
           WHEN "L30T1"."LOCSTAT"=1 THEN '1 Free'
           WHEN "L30T1"."LOCSTAT"=2 THEN '2 Occupied'
           WHEN "L30T1"."LOCSTAT"=4 THEN '4 Blocked in'
           WHEN "L30T1"."LOCSTAT"=6 THEN '6 Occupied Blocked in'
           WHEN "L30T1"."LOCSTAT"=8 THEN '8 Blocked out'
           WHEN "L30T1"."LOCSTAT"=10 THEN '10 Occupied Blocked out'
           WHEN "L30T1"."LOCSTAT"=12 THEN '12 Blocked for both in and out'
           WHEN "L30T1"."LOCSTAT"=14 THEN '14 Occupied Blocked for both in and out'
       END "c4",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('57R1')
  AND "L30T1"."RACK" IN ('510',
                         '511',
                         '512',
                         '513',
                         '514',
                         '515',
                         '516',
                         '517',
                         '518',
                         '519',
                         '520',
                         '521',
                         '522',
                         '523',
                         '524',
                         '525',
                         '526',
                         '527',
                         '528',
                         '529')
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."RACK",
         CASE
             WHEN "L30T1"."ZONE"='E' THEN 'Euro'
             WHEN "L30T1"."ZONE"='UB' THEN 'Uberbreit'
             WHEN "L30T1"."ZONE"='I' THEN 'IKEA'
             ELSE 'keine BZ eingetragen'
         END,
         CASE
             WHEN "L30T1"."LOCSTAT"=1 THEN '1 Free'
             WHEN "L30T1"."LOCSTAT"=2 THEN '2 Occupied'
             WHEN "L30T1"."LOCSTAT"=4 THEN '4 Blocked in'
             WHEN "L30T1"."LOCSTAT"=6 THEN '6 Occupied Blocked in'
             WHEN "L30T1"."LOCSTAT"=8 THEN '8 Blocked out'
             WHEN "L30T1"."LOCSTAT"=10 THEN '10 Occupied Blocked out'
             WHEN "L30T1"."LOCSTAT"=12 THEN '12 Blocked for both in and out'
             WHEN "L30T1"."LOCSTAT"=14 THEN '14 Occupied Blocked for both in and out'
         END