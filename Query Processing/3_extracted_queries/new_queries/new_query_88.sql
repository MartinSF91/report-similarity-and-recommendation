
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       trim(BOTH
            FROM "L30T1"."VERCOOR") "WhsLoc_Y",
       "L30T1"."LOCSTAT" "WhsLoc_Status",
       "L30T1"."ZONE" "WhsLoc_Zone",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('54R1')
  AND "L30T1"."LOCTYPE" NOT IN ('DA ',
                                '   ',
                                'DWZ',
                                'FM ',
                                'FS ',
                                'ISA',
                                'ITM',
                                'ITS',
                                'ML ',
                                'MLF',
                                'NA ',
                                'OTM',
                                'OTS')
  AND trim(BOTH
           FROM "L30T1"."VERCOOR") NOT IN ('12',
                                           '13')
  AND "L30T1"."LOCSTAT" IN (1)
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."LOCTYPE",
         trim(BOTH
              FROM "L30T1"."VERCOOR"),
         "L30T1"."LOCSTAT",
         "L30T1"."ZONE"