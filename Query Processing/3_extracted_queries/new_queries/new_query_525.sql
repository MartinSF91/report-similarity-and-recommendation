SELECT "G08T1"."RACK" "StoPal_Rack",
       "L62T14"."PMHA" "ArtLoc_PickMha",
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
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=50 THEN '50 - Verbindung & Steuerung'
           WHEN SUBSTR("L62T995"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
       END "ARTBaNo",
       count(DISTINCT trim(BOTH
                           FROM "L62T14"."PARTNO")) "ARTNo"
FROM "G08T1" "G08T1",
     "L62T14",
     "L62T995"
WHERE "L62T14"."PMHA" IN ('54P1 ')
  AND "G08T1"."RACK" IN ('001',
                         '002',
                         '003',
                         '004',
                         '005',
                         '006',
                         '007',
                         '008',
                         '009',
                         '010',
                         '011',
                         '012',
                         '013',
                         '014',
                         '015',
                         '016',
                         '017',
                         '018',
                         '019',
                         '020',
                         '021',
                         '022',
                         '023',
                         '024',
                         '025',
                         '026',
                         '027',
                         '028',
                         '029',
                         '030',
                         '031',
                         '032')
  AND "L62T14"."SHORTL62"="G08T1"."SHORTL62"
  AND "L62T14"."PARTNO"="L62T995"."PARTNO"
  AND "L62T14"."PARTREV"="L62T995"."PARTREV"
  AND "L62T14"."DIVCODE"="L62T995"."DIVCODE"
GROUP BY "G08T1"."RACK",
         "L62T14"."PMHA",
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
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=50 THEN '50 - Verbindung & Steuerung'
             WHEN SUBSTR("L62T995"."PANUM", 1, 2)=70 THEN '70 - Elektrogerate'
         END