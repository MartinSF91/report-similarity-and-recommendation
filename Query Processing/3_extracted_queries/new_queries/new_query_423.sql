SELECT "T0"."C0" "ArtFea_SupNo",
       "T0"."C1" "ArtFea_ArticleName",
       "T0"."C2" "OrdLine_O08_ArtNo",
       "T0"."C3" "VICOrdLin_QtyPick",
       "T0"."C4" "ArtLoc_PickMha",
       "T0"."C5" "ArtLoc_Pickzone",
       "T0"."C6" "DspDet_DepDate",
       "T0"."C7" "StoBal_PickBal",
       "T0"."C8" "StoBal_TotBal",
       "T0"."C9" "ArtFea_DefPallQty",
       "T0"."C10" "Datenelement1",
       "T0"."C11" "ARTPaNo",
       "T0"."C12" "Datenelement2",
       "T0"."C10" "Auswertung_Datenelement1_",
       "T0"."C13" "ArtLoc_PickLocType",
       "T0"."C14" "ArtFea_ClassPallet",
       "T0"."C10" "Auswertung_Datenelement1_2",
       "T0"."C15" "ArtFea_DefMLPQty",
       "T0"."C3" "Auswertung_VICOrdLin_QtyPick_",
       "T0"."C10" "Auswertung_Datenelement1_1",
       "T0"."C12" "Auswertung_Datenelement2_",
       "T0"."C16" "ArtFea_RefKey_L63",
       "T0"."C17" "ArtFea_StoUnitLen",
       "T0"."C18" "ArtFea_StoUnitWid",
       "T0"."C19" "ArtFea_StoUnitHei",
       "T0"."C20" "ARTItemPerArt"
FROM
  (SELECT trim(BOTH
               FROM "L62T15"."PARTREV") "C0",
          "L62T15"."PARTDSC1" "C1",
          "O08T16"."PARTNO" "C2",
          sum("O08T16"."DELQUANT") "C3",
          "L62T15"."PMHA" "C4",
          "L62T15"."PZONE" "C5",
          TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))) "C6",
          "L62T15"."BALPL" "C7",
          "L62T15"."BALTOT" "C8",
          "L62T15"."CQUANT" "C9",
          sum("O08T16"."DELQUANT")/nullif(min("L62T15"."CQUANT"), 0) "C10",
          "L62T997"."PANUM" "C11",
          ((sum("O08T16"."DELQUANT")/nullif(min("L62T15"."CQUANT"), 0))/14)/3 "C12",
          CASE
              WHEN "L62T15"."PICKLOC"=0 THEN 'Dynamisch'
              WHEN "L62T15"."PICKLOC"=2 THEN 'Fix'
              WHEN "L62T15"."PICKLOC"=1 THEN 'Fix PL, rflilable StUnitsFix'
          END "C13",
          "L62T15"."WLDCT" "C14",
          "L62T15"."HUQTY" "C15",
          "L62T15"."SHORTL62" "C16",
          "L62T15"."SULENGTH" "C17",
          "L62T15"."SUWIDTH" "C18",
          "L62T15"."SUHEIGHT" "C19",
          "L62T15"."NOINPACK" "C20"
   FROM "L62T15",
        "O08T16",
        "R08T1" "R08T1",
        "L62T997"
   WHERE "L62T15"."PMHA" IN ('11P3 ')
     AND TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9)))>=TRUNC(cast(:PQ1 AS TIMESTAMP(9)))
     AND "L62T15"."PARTNO"="L62T997"."PARTNO"
     AND "L62T15"."PARTREV"="L62T997"."PARTREV"
     AND "L62T15"."DIVCODE"="L62T997"."DIVCODE"
     AND "O08T16"."SHORTL62"="L62T15"."SHORTL62"
     AND "O08T16"."SHORTR08"="R08T1"."SHORTR08"
   GROUP BY trim(BOTH
                 FROM "L62T15"."PARTREV"),
            "L62T15"."PARTDSC1",
            "O08T16"."PARTNO",
            "L62T15"."PMHA",
            "L62T15"."PZONE",
            TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))),
            "L62T15"."BALPL",
            "L62T15"."BALTOT",
            "L62T15"."CQUANT",
            "L62T997"."PANUM",
            CASE
                WHEN "L62T15"."PICKLOC"=0 THEN 'Dynamisch'
                WHEN "L62T15"."PICKLOC"=2 THEN 'Fix'
                WHEN "L62T15"."PICKLOC"=1 THEN 'Fix PL, rflilable StUnitsFix'
            END,
            "L62T15"."WLDCT",
            "L62T15"."HUQTY",
            "L62T15"."SHORTL62",
            "L62T15"."SULENGTH",
            "L62T15"."SUWIDTH",
            "L62T15"."SUHEIGHT",
            "L62T15"."NOINPACK") "T0"