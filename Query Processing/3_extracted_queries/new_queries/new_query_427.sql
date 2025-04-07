
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_L30_LocType",
       "T0"."C2" "WhsLoc_Status",
       "T0"."C3" "WhsLoc_PlaceCount",
       "T0"."C3"/nullif(sum("T0"."C3") OVER (), 0) "c5",
       "T0"."C3" "Auswertung_WhsLoc_PlaceCount_",
       "T0"."C3"/nullif(sum("T0"."C3") OVER (), 0) "c7"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          "L30T1"."LOCTYPE" "C1",
          CASE
              WHEN "L30T1"."LOCSTAT"=1 THEN 'Frei'
              WHEN "L30T1"."LOCSTAT"=2 THEN 'Belegt'
              WHEN "L30T1"."LOCSTAT"=4 THEN 'Blocked in'
              WHEN "L30T1"."LOCSTAT"=6 THEN 'Occupied Blocked in'
              WHEN "L30T1"."LOCSTAT"=8 THEN 'Blocked out'
              WHEN "L30T1"."LOCSTAT"=10 THEN 'Occupied Blocked out'
              WHEN "L30T1"."LOCSTAT"=12 THEN 'Blocked for both in and out'
              WHEN "L30T1"."LOCSTAT"=14 THEN 'Occupied Blocked for both in and out'
          END "C2",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C3"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('54R1')
     AND "L30T1"."LOCTYPE" NOT IN ('   ',
                                   'DA ',
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
     AND CASE
             WHEN ("L30T1"."LOCSTAT"=1) THEN 'Frei'
             WHEN ("L30T1"."LOCSTAT"=2) THEN 'Belegt'
             WHEN ("L30T1"."LOCSTAT"=4) THEN 'Blocked in'
             WHEN ("L30T1"."LOCSTAT"=6) THEN 'Occupied Blocked in'
             WHEN ("L30T1"."LOCSTAT"=8) THEN 'Blocked out'
             WHEN ("L30T1"."LOCSTAT"=10) THEN 'Occupied Blocked out'
             WHEN ("L30T1"."LOCSTAT"=12) THEN 'Blocked for both in and out'
             WHEN ("L30T1"."LOCSTAT"=14) THEN 'Occupied Blocked for both in and out'
         END IN ('Free',
                 'Occupied')
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCTYPE",
            CASE
                WHEN "L30T1"."LOCSTAT"=1 THEN 'Frei'
                WHEN "L30T1"."LOCSTAT"=2 THEN 'Belegt'
                WHEN "L30T1"."LOCSTAT"=4 THEN 'Blocked in'
                WHEN "L30T1"."LOCSTAT"=6 THEN 'Occupied Blocked in'
                WHEN "L30T1"."LOCSTAT"=8 THEN 'Blocked out'
                WHEN "L30T1"."LOCSTAT"=10 THEN 'Occupied Blocked out'
                WHEN "L30T1"."LOCSTAT"=12 THEN 'Blocked for both in and out'
                WHEN "L30T1"."LOCSTAT"=14 THEN 'Occupied Blocked for both in and out'
            END) "T0"