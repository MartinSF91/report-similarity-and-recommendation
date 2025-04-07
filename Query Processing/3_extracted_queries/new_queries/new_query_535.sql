SELECT "L16T3"."L16LCODE" "IMH_LoggCode",
       "L16T3"."LOGGUSER" "IMH_LoggUser",
       "L16T3"."DATREG" "IMH_RegDateTime",
       "L16T3"."FMHA" "IMH_FromMHA",
       "L16T3"."PICKRNO" "IMH_PickRound",
       CASE
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=1 THEN '01 - Sofas'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=2 THEN '02 - Aufbewahrung'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=3 THEN '03 - Arbeitsplatze'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=4 THEN '04 - Schlafzimmermobel'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=5 THEN '05 - Matratzen'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=6 THEN '06 - Badezimmer'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=7 THEN '07 - Kuche'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=8 THEN '08 - Essplatze'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=9 THEN '09 - Kinderwelt'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=10 THEN '10 - Beleuchtung'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=11 THEN '11 - Betttextilien'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=12 THEN '12 - Heimtextilien'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=13 THEN '13 - Teppiche'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=14 THEN '14 - Kochen'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=15 THEN '15 - Essen'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=16 THEN '16 - Dekoration'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=17 THEN '17 - Außenbereich'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=18 THEN '18 - Verstauen und Ordnen'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=20 THEN '20 - Bodenbelage etc.'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
           ELSE 'ups'
       END "ARTBaNo",
       "L16T3"."ORDNO" "IMH_L16_OrdNo",
       "L16T3"."ADMUNIT" "IMH_Queue",
       count("L62T16"."SHORTL62") "ArtFea_RefKey_L62"
FROM (("L62T16"
       INNER JOIN "L62T995" ON "L62T16"."PARTNO"="L62T995"."PARTNO"
       AND "L62T16"."PARTREV"="L62T995"."PARTREV"
       AND "L62T16"."DIVCODE"="L62T995"."DIVCODE")
      INNER JOIN "O08T17" ON "O08T17"."SHORTL62"="L62T16"."SHORTL62")
LEFT OUTER JOIN "L16T3" "L16T3" ON "O08T17"."SHORTO08"="L16T3"."SHORTO08"
WHERE "L16T3"."L16LCODE" IN (4,
                             93)
  AND "L16T3"."DATREG">CAST((:PQ1) AS TIMESTAMP)
  AND "L16T3"."PICKRNO">0
GROUP BY "L16T3"."L16LCODE",
         "L16T3"."LOGGUSER",
         "L16T3"."DATREG",
         "L16T3"."FMHA",
         "L16T3"."PICKRNO",
         CASE
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=1 THEN '01 - Sofas'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=2 THEN '02 - Aufbewahrung'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=3 THEN '03 - Arbeitsplatze'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=4 THEN '04 - Schlafzimmermobel'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=5 THEN '05 - Matratzen'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=6 THEN '06 - Badezimmer'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=7 THEN '07 - Kuche'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=8 THEN '08 - Essplatze'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=9 THEN '09 - Kinderwelt'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=10 THEN '10 - Beleuchtung'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=11 THEN '11 - Betttextilien'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=12 THEN '12 - Heimtextilien'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=13 THEN '13 - Teppiche'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=14 THEN '14 - Kochen'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=15 THEN '15 - Essen'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=16 THEN '16 - Dekoration'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=17 THEN '17 - Außenbereich'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=18 THEN '18 - Verstauen und Ordnen'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=20 THEN '20 - Bodenbelage etc.'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
             ELSE 'ups'
         END,
         "L16T3"."ORDNO",
         "L16T3"."ADMUNIT"