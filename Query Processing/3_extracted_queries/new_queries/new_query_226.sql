
SELECT ("T0"."C0"/nullif("T0"."C1", 0))/12 "C0",
       "T0"."C0" "C1",
       "T0"."C2" "C2",
       "T0"."C3" "C3",
       "T0"."C4" "C4",
       "T0"."C5" "C5",
       "T0"."C6" "C6",
       "T0"."C7" "C7"
FROM
  (SELECT "T0"."C0" "C0",
          "T0"."C1" "C1",
          "T0"."C2" "C2",
          "T0"."C3" "C3",
          "T0"."C4" "C4",
          "T0"."C5" "C5",
          "T0"."C6" "C6",
          "T0"."C7" "C7",
          rank() OVER (
                       ORDER BY "T0"."C8" DESC NULLS LAST) "C8"
   FROM
     (SELECT sum("O08T15"."DELQUANT") "C0",
             min("L62T16"."CQUANT") "C1",
             "L62T16"."PARTDSC1" "C2",
             "O08T15"."PARTNO" "C3",
             "L62T16"."PMHA" "C4",
             "L62T16"."CQUANT" "C5",
             CASE
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=1 THEN '01 - Sofas'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=2 THEN '02 - Aufbewahrung'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=3 THEN '03 - Arbeitsplatze'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=4 THEN '04 - Schlafzimmermobel'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=5 THEN '05 - Matratzen'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=6 THEN '06 - Badezimmer'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=7 THEN '07 - Kuche'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=8 THEN '08 - Essplatze'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=9 THEN '09 - Kinderwelt'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=10 THEN '10 - Beleuchtung'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=11 THEN '11 - Betttextilien'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=12 THEN '12 - Heimtextilien'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=13 THEN '13 - Teppiche'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=14 THEN '14 - Kochen'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=15 THEN '15 - Essen'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=16 THEN '16 - Dekoration'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=17 THEN '17 - Außenbereich'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=18 THEN '18 - Verstauen und Ordnen'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=20 THEN '20 - Bodenbelage etc.'
                 WHEN SUBSTR("L62T997"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
                 ELSE 'ups'
             END "C6",
             "L62T16"."WLDCT" "C7",
             (sum("O08T15"."DELQUANT")/nullif(min("L62T16"."CQUANT"), 0))/12 "C8"
      FROM "O08T1" "O08T15",
           "L62T1" "L62T16",
           "L62T99" "L62T997"
      WHERE "O08T15"."SHORTL62"="L62T16"."SHORTL62"
        AND "L62T16"."PARTNO"="L62T997"."PARTNO"
        AND "L62T16"."PARTREV"="L62T997"."PARTREV"
        AND "L62T16"."DIVCODE"="L62T997"."DIVCODE"
        AND trim(BOTH
                 FROM "L62T997"."DIVCODE") NOT IN ('----')
        AND trim(BOTH
                 FROM "L62T16"."DIVCODE") NOT IN ('----')
        AND trim(BOTH
                 FROM "O08T15"."DIVCODE") NOT IN ('----')
      GROUP BY "L62T16"."PARTDSC1",
               "O08T15"."PARTNO",
               "L62T16"."PMHA",
               "L62T16"."CQUANT",
               CASE
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=1 THEN '01 - Sofas'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=2 THEN '02 - Aufbewahrung'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=3 THEN '03 - Arbeitsplatze'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=4 THEN '04 - Schlafzimmermobel'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=5 THEN '05 - Matratzen'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=6 THEN '06 - Badezimmer'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=7 THEN '07 - Kuche'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=8 THEN '08 - Essplatze'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=9 THEN '09 - Kinderwelt'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=10 THEN '10 - Beleuchtung'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=11 THEN '11 - Betttextilien'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=12 THEN '12 - Heimtextilien'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=13 THEN '13 - Teppiche'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=14 THEN '14 - Kochen'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=15 THEN '15 - Essen'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=16 THEN '16 - Dekoration'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=17 THEN '17 - Außenbereich'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=18 THEN '18 - Verstauen und Ordnen'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=20 THEN '20 - Bodenbelage etc.'
                   WHEN SUBSTR("L62T997"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
                   ELSE 'ups'
               END,
               "L62T16"."WLDCT") "T0") "T0"
WHERE "T0"."C8"<101