
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
          CASE "L30T1"."LOCSTAT"
              WHEN 1 THEN 'Free'
              WHEN 2 THEN 'Occupied'
          END "C2",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C3"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('53R1')
     AND "L30T1"."LOCTYPE" IN ('ML ')
     AND CASE "L30T1"."LOCSTAT"
             WHEN 1 THEN 'Free'
             WHEN 2 THEN 'Occupied'
         END IN ('Free',
                 'Occupied')
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCTYPE",
            CASE "L30T1"."LOCSTAT"
                WHEN 1 THEN 'Free'
                WHEN 2 THEN 'Occupied'
            END) "T0"