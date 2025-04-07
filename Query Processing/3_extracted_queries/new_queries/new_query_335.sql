
SELECT "T0"."C0" "Summe_WhsLoc_PlaceCount_",
       "T0"."C1" "WhsLoc_MhaName",
       "T0"."C2" "WhsLoc_L30_LocType",
       "T0"."C3" "WhsLoc_Status",
       "T0"."C0" "WhsLoc_PlaceCount",
       "T0"."C4" "WhsLoc_Qty"
FROM
  (SELECT count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C0",
          trim(BOTH
               FROM "L30T1"."MHA") "C1",
          "L30T1"."LOCTYPE" "C2",
          "L30T1"."LOCSTAT" "C3",
          CASE
              WHEN "L30T1"."NOINLOC"=0 THEN 'Doppeltiefe Frei'
              WHEN "L30T1"."NOINLOC"=1 THEN 'Einzeltiefe Frei'
          END "C4"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('53R1')
     AND "L30T1"."LOCTYPE" IN ('ML ')
     AND CASE
             WHEN ("L30T1"."NOINLOC"=0) THEN 'Doppeltiefe Frei'
             WHEN ("L30T1"."NOINLOC"=1) THEN 'Einzeltiefe Frei'
         END IN ('Doppeltiefe Frei',
                 'Einzeltiefe Frei')
     AND "L30T1"."LOCSTAT" IN (1,
                               2)
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCTYPE",
            "L30T1"."LOCSTAT",
            CASE
                WHEN "L30T1"."NOINLOC"=0 THEN 'Doppeltiefe Frei'
                WHEN "L30T1"."NOINLOC"=1 THEN 'Einzeltiefe Frei'
            END) "T0"