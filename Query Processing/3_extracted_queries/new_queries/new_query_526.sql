SELECT "T0"."C0" "ArtFea_ArticleNo",
       "T0"."C1" "ArtFea_SupNo",
       "T0"."C2" "ArtFea_ArticleName",
       "T0"."C3" "ArtLoc_PickMha",
       "T0"."C4" "StoPal_PallQty",
       "T0"."C5" "StoPal_PallStat",
       "T0"."C6" "StoPal_CountPall",
       "T0"."C7" "ArtFea_DefPallQty",
       "T0"."C6" "Auswertung_StoPal_CountPall_",
       "T0"."C6" "Summe_StoPal_CountPall_"
FROM
  (SELECT substr("L62T13"."PARTNO", 1, 8) "C0",
          trim(BOTH
               FROM "L62T13"."PARTREV") "C1",
          "L62T13"."PARTDSC1" "C2",
          "L62T13"."PMHA" "C3",
          "G08T1"."AMOONCR" "C4",
          "G08T1"."CARRSTAT" "C5",
          count("G08T1"."CARRNO") "C6",
          "L62T13"."CQUANT" "C7"
   FROM "L62T13",
        "G08T1" "G08T1"
   WHERE "G08T1"."AMOONCR" IN (2)
     AND "G08T1"."CARRSTAT" IN (6)
     AND "L62T13"."CQUANT" BETWEEN 1 AND 1
     AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
   GROUP BY substr("L62T13"."PARTNO", 1, 8),
            trim(BOTH
                 FROM "L62T13"."PARTREV"),
            "L62T13"."PARTDSC1",
            "L62T13"."PMHA",
            "G08T1"."AMOONCR",
            "G08T1"."CARRSTAT",
            "L62T13"."CQUANT") "T0"SELECT "T0"."C0" "ArtFea_ArticleNo",
       "T0"."C1" "ArtFea_SupNo",
       "T0"."C2" "ArtFea_ArticleName",
       "T0"."C3" "ArtLoc_PickMha",
       "T0"."C4" "StoPal_PallQty",
       "T0"."C5" "StoPal_PallStat",
       "T0"."C6" "StoPal_CountPall",
       "T0"."C7" "ArtFea_DefPallQty",
       "T0"."C6" "Auswertung_StoPal_CountPall_",
       "T0"."C6" "Summe_StoPal_CountPall_"
FROM
  (SELECT substr("L62T13"."PARTNO", 1, 8) "C0",
          trim(BOTH
               FROM "L62T13"."PARTREV") "C1",
          "L62T13"."PARTDSC1" "C2",
          "L62T13"."PMHA" "C3",
          "G08T1"."AMOONCR" "C4",
          "G08T1"."CARRSTAT" "C5",
          count("G08T1"."CARRNO") "C6",
          "L62T13"."CQUANT" "C7"
   FROM "L62T13",
        "G08T1" "G08T1"
   WHERE "G08T1"."AMOONCR" IN (2)
     AND "G08T1"."CARRSTAT" IN (6)
     AND "L62T13"."CQUANT" BETWEEN 1 AND 1
     AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
   GROUP BY substr("L62T13"."PARTNO", 1, 8),
            trim(BOTH
                 FROM "L62T13"."PARTREV"),
            "L62T13"."PARTDSC1",
            "L62T13"."PMHA",
            "G08T1"."AMOONCR",
            "G08T1"."CARRSTAT",
            "L62T13"."CQUANT") "T0"