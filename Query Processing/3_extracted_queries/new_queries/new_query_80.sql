
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_L30_LocType",
       "T0"."C2" "WhsLoc_PlaceCount",
       "T0"."C3" "WhsLoc_Qty",
       "T0"."C2" "Summe_WhsLoc_PlaceCount_"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          CASE
              WHEN "L30T1"."LOCTYPE"='I11' THEN 'E11'
              WHEN "L30T1"."LOCTYPE"='I12' THEN 'E12'
              WHEN "L30T1"."LOCTYPE"='I31' THEN 'E31'
              WHEN "L30T1"."LOCTYPE"='I32' THEN 'E32'
          END "C1",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C2",
          "L30T1"."NOINLOC" "C3"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('54R1')
     AND CASE
             WHEN ("L30T1"."LOCTYPE"='I11') THEN 'E11'
             WHEN ("L30T1"."LOCTYPE"='I12') THEN 'E12'
             WHEN ("L30T1"."LOCTYPE"='I31') THEN 'E31'
             WHEN ("L30T1"."LOCTYPE"='I32') THEN 'E32'
         END NOT IN ('   ',
                     'DA ',
                     'DWZ',
                     'FM ',
                     'FS ',
                     'ITM',
                     'ISA',
                     'ITS',
                     'ML ',
                     'MLF',
                     'NA ',
                     'OTM',
                     'OTS')
     AND "L30T1"."NOINLOC" IN (1)
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            CASE
                WHEN "L30T1"."LOCTYPE"='I11' THEN 'E11'
                WHEN "L30T1"."LOCTYPE"='I12' THEN 'E12'
                WHEN "L30T1"."LOCTYPE"='I31' THEN 'E31'
                WHEN "L30T1"."LOCTYPE"='I32' THEN 'E32'
            END,
            "L30T1"."NOINLOC") "T0"