SELECT "T0"."C0" "VICOrdLin_ArtNo",
       "T0"."C1" "ARTName",
       "T0"."C2" "VICOrdLin_SupNo",
       "T0"."C3" "VICOrdLin_QtyReq",
       "T0"."C4" "Datenelement1",
       "T0"."C5" "ArtFea_RefKey_L62",
       "T0"."C6" "VICOrdLin_Status",
       "T0"."C7" - "T0"."C3" "Datenelement2",
       "T0"."C8" "ArtLoc_PickMha"
FROM
  (SELECT trim(BOTH
               FROM "O08T14"."PARTNO") "C0",
          "L62T15"."PARTDSC1" "C1",
          trim(BOTH
               FROM "O08T14"."PARTREV") "C2",
          sum("O08T14"."REQQUANT") "C3",
          "L62T15"."BALTOT" "C4",
          "L62T15"."SHORTL62" "C5",
          CASE
              WHEN "O08T14"."LINESTAT"=1 THEN 10
              WHEN "O08T14"."LINESTAT"=22 THEN 20
              WHEN "O08T14"."LINESTAT"=2 THEN 30
              WHEN "O08T14"."LINESTAT"=7 THEN 50
              WHEN "O08T14"."LINESTAT"=0 THEN 99
              ELSE NULL
          END "C6",
          min("L62T15"."BALTOT") "C7",
          "L62T15"."PMHA" "C8"
   FROM "O08T14",
        "L62T15"
   WHERE CASE
             WHEN ("O08T14"."LINESTAT"=1) THEN 10
             WHEN ("O08T14"."LINESTAT"=22) THEN 20
             WHEN ("O08T14"."LINESTAT"=2) THEN 30
             WHEN ("O08T14"."LINESTAT"=7) THEN 50
             WHEN ("O08T14"."LINESTAT"=0) THEN 99
             ELSE NULL
         END IN (20,
                 30)
     AND "O08T14"."SHORTL62"="L62T15"."SHORTL62"
   GROUP BY trim(BOTH
                 FROM "O08T14"."PARTNO"),
            "L62T15"."PARTDSC1",
            trim(BOTH
                 FROM "O08T14"."PARTREV"),
            "L62T15"."BALTOT",
            "L62T15"."SHORTL62",
            CASE
                WHEN "O08T14"."LINESTAT"=1 THEN 10
                WHEN "O08T14"."LINESTAT"=22 THEN 20
                WHEN "O08T14"."LINESTAT"=2 THEN 30
                WHEN "O08T14"."LINESTAT"=7 THEN 50
                WHEN "O08T14"."LINESTAT"=0 THEN 99
                ELSE NULL
            END,
            "L62T15"."PMHA"
   HAVING sum("O08T14"."REQQUANT")>0
   AND min("L62T15"."BALTOT") - sum("O08T14"."REQQUANT")<0) "T0"