
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."RACK" "WhsLoc_Rack",
       "L30T1"."ZONE" "WhsLoc_Zone",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       "L30T1"."LOCSTAT" "WhsLoc_Status",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('54R1')
  AND "L30T1"."LOCTYPE" IN ('I11',
                            'I12',
                            'I31',
                            'I32')
  AND "L30T1"."ZONE" NOT IN ('  ')
  AND "L30T1"."LOCSTAT" IN (1,
                            2)
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."RACK",
         "L30T1"."ZONE",
         "L30T1"."LOCTYPE",
         "L30T1"."LOCSTAT"