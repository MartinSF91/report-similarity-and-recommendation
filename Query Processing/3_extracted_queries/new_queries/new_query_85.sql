
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_Status",
       "T0"."C2" "WhsLoc_PlaceCount",
       "T0"."C2" "Summe_WhsLoc_PlaceCount_",
       "T0"."C3" "WhsLoc_L30_LocType"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          "L30T1"."LOCSTAT" "C1",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C2",
          "L30T1"."LOCTYPE" "C3"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('52R1',
                                      '54R1',
                                      '56R1',
                                      '56R2',
                                      '53R1')
     AND "L30T1"."LOCSTAT" NOT IN (12)
     AND "L30T1"."LOCTYPE" NOT IN ('   ',
                                   'DA ',
                                   'DWZ',
                                   'FM ',
                                   'FS ',
                                   'ITM',
                                   'ITS',
                                   'NA ',
                                   'OTM',
                                   'OTS')
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCSTAT",
            "L30T1"."LOCTYPE") "T0"