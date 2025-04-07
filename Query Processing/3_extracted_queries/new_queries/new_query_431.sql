
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_L30_LocType",
       "T0"."C2" "WhsLoc_Status",
       "T0"."C3" "WhsLoc_Qty",
       "T0"."C4" "WhsLoc_PlaceCount",
       "T0"."C4" "Auswertung_WhsLoc_PlaceCount_"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          "L30T1"."LOCTYPE" "C1",
          CASE
              WHEN "L30T1"."LOCSTAT"=2 THEN 'Free'
          END "C2",
          "L30T1"."NOINLOC" "C3",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C4"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('53R1')
     AND "L30T1"."LOCTYPE" IN ('ML ')
     AND "L30T1"."NOINLOC" IN (1)
     AND CASE
             WHEN ("L30T1"."LOCSTAT"=2) THEN 'Free'
         END IN ('Free')
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCTYPE",
            CASE
                WHEN "L30T1"."LOCSTAT"=2 THEN 'Free'
            END,
            "L30T1"."NOINLOC") "T0"