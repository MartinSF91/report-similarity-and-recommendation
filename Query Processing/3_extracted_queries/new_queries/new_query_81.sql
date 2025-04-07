
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       "L30T1"."LOCSTAT" "WhsLoc_Status",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('52R1',
                                   '56R1',
                                   '56R2')
  AND "L30T1"."LOCSTAT" IN (1)
  AND "L30T1"."LOCTYPE" IN ('E41',
                            'E42',
                            'E43',
                            'I41',
                            'I42')
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."LOCTYPE",
         "L30T1"."LOCSTAT"