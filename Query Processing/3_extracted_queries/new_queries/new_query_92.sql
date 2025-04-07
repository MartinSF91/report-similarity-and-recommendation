
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."ZONE" "WhsLoc_Zone",
       CASE
           WHEN "L30T1"."LOCSTAT"=1 THEN 'Free'
           WHEN "L30T1"."LOCSTAT"=2 THEN 'Occupied'
       END "c3",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('51P1',
                                   '52P1',
                                   '52P2',
                                   '52P3',
                                   '52P4',
                                   '52P5',
                                   '56P3',
                                   'KN')
  AND CASE
          WHEN ("L30T1"."LOCSTAT"=1) THEN 'Free'
          WHEN ("L30T1"."LOCSTAT"=2) THEN 'Occupied'
      END IN ('Free',
              'Occupied')
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."ZONE",
         CASE
             WHEN "L30T1"."LOCSTAT"=1 THEN 'Free'
             WHEN "L30T1"."LOCSTAT"=2 THEN 'Occupied'
         END