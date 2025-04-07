
SELECT CASE
           WHEN "L30T1"."LOCSTAT"=1 THEN '1 Free'
           WHEN "L30T1"."LOCSTAT"=2 THEN '2 Occupied'
           WHEN "L30T1"."LOCSTAT"=4 THEN '4 Blocked in'
           WHEN "L30T1"."LOCSTAT"=6 THEN '6 Occupied Blocked in'
           WHEN "L30T1"."LOCSTAT"=8 THEN '8 Blocked out'
           WHEN "L30T1"."LOCSTAT"=10 THEN '10 Occupied Blocked out'
           WHEN "L30T1"."LOCSTAT"=12 THEN '12 Blocked for both in and out'
           WHEN "L30T1"."LOCSTAT"=14 THEN '14 Occupied Blocked for both in and out'
       END "c1",
       trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('52R1',
                                   '56R1',
                                   '56R2')
  AND CASE
          WHEN ("L30T1"."LOCSTAT"=1) THEN '1 Free'
          WHEN ("L30T1"."LOCSTAT"=2) THEN '2 Occupied'
          WHEN ("L30T1"."LOCSTAT"=4) THEN '4 Blocked in'
          WHEN ("L30T1"."LOCSTAT"=6) THEN '6 Occupied Blocked in'
          WHEN ("L30T1"."LOCSTAT"=8) THEN '8 Blocked out'
          WHEN ("L30T1"."LOCSTAT"=10) THEN '10 Occupied Blocked out'
          WHEN ("L30T1"."LOCSTAT"=12) THEN '12 Blocked for both in and out'
          WHEN ("L30T1"."LOCSTAT"=14) THEN '14 Occupied Blocked for both in and out'
      END IN ('1 Free',
              '2 Occupied')
  AND "L30T1"."LOCTYPE" NOT IN ('NA ')
GROUP BY CASE
             WHEN "L30T1"."LOCSTAT"=1 THEN '1 Free'
             WHEN "L30T1"."LOCSTAT"=2 THEN '2 Occupied'
             WHEN "L30T1"."LOCSTAT"=4 THEN '4 Blocked in'
             WHEN "L30T1"."LOCSTAT"=6 THEN '6 Occupied Blocked in'
             WHEN "L30T1"."LOCSTAT"=8 THEN '8 Blocked out'
             WHEN "L30T1"."LOCSTAT"=10 THEN '10 Occupied Blocked out'
             WHEN "L30T1"."LOCSTAT"=12 THEN '12 Blocked for both in and out'
             WHEN "L30T1"."LOCSTAT"=14 THEN '14 Occupied Blocked for both in and out'
         END,
         trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."LOCTYPE"