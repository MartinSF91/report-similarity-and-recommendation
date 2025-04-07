
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_Status",
       "T0"."C2" "WhsLoc_L30_LocType",
       "T0"."C3" "WhsLoc_PlaceCount",
       "T0"."C0" "WhsLoc_MhaName1",
       "T0"."C3" "Auswertung_WhsLoc_PlaceCount_"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          "L30T1"."LOCSTAT" "C1",
          "L30T1"."LOCTYPE" "C2",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C3"
   FROM "L30T1" "L30T1"
   WHERE "L30T1"."LOCSTAT" IN (1)
     AND "L30T1"."LOCTYPE" NOT IN ('   ',
                                   'DA ',
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
              FROM "L30T1"."MHA") IN ('57R1')
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCSTAT",
            "L30T1"."LOCTYPE") "T0"