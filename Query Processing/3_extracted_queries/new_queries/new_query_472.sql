
SELECT "L30T1"."ZONE" "WhsLoc_Zone",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount",
       "L30T1"."RACK" "WhsLoc_Rack",
       trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('54R1')
GROUP BY "L30T1"."ZONE",
         "L30T1"."RACK",
         trim(BOTH
              FROM "L30T1"."MHA")