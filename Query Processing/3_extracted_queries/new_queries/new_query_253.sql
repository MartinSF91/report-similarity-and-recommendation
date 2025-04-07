SELECT DISTINCT "T0"."C0" "ArtFea_SupNo",
                "T0"."C1" "ArtFea_ArticleName",
                "T0"."C2" "OrdLine_O08_ArtNo",
                "T0"."C3" "OrdLine_ReqQunat",
                "T0"."C4" "OrdLine_SubLineStat",
                "T0"."C5" "StoBal_TotBal",
                "T0"."C5" "StoBal_TotBal1",
                "T0"."C6" "ArtFea_RefKey_L62",
                "T0"."C7" "VICOrdLin_QtyPick",
                min("T0"."C3") OVER (PARTITION BY "T0"."C0", "T0"."C1", "T0"."C2", "T0"."C4", "T0"."C5", "T0"."C6", "T0"."C8", "T0"."C9", "T0"."C10", "T0"."C11", "T0"."C12", "T0"."C13", "T0"."C14", "T0"."C15", "T0"."C16") - "T0"."C7" "Datenelement1",
                "T0"."C8" "StoBal_PickBal",
                "T0"."C9" "ArtLoc_PickMha",
                "T0"."C10" "ArtLoc_Pickzone",
                "T0"."C11" "OrdLine_LineStat",
                "T0"."C12" "DspDet_DepDate",
                "T0"."C13" "StoBal_NearBufBal",
                "T0"."C14" "ArtLoc_BufStockArea",
                "T0"."C15" "ClassPallet",
                "T0"."C16" "ArtFea_DefPallQty",
                "T0"."C17" "Anzahl_ArtFea_DefPallQty_"
FROM
  (SELECT "T0"."C0" "C0",
          "T0"."C1" "C1",
          "T0"."C2" "C2",
          "T0"."C3" "C3",
          "T0"."C4" "C4",
          "T0"."C5" "C5",
          "T0"."C6" "C6",
          "T0"."C7" "C7",
          "T0"."C8" "C8",
          "T0"."C9" "C9",
          "T0"."C10" "C10",
          "T0"."C11" "C11",
          "T0"."C12" "C12",
          "T0"."C13" "C13",
          "T0"."C14" "C14",
          "T0"."C15" "C15",
          "T0"."C16" "C16",
          "T0"."C17" "C17",
          min("T0"."C3") OVER (PARTITION BY "T0"."C0", "T0"."C1", "T0"."C2", "T0"."C4", "T0"."C5", "T0"."C6", "T0"."C8", "T0"."C9", "T0"."C10", "T0"."C11", "T0"."C12", "T0"."C13", "T0"."C14", "T0"."C15", "T0"."C16") "C18"
   FROM
     (SELECT trim(BOTH
                  FROM "L62T15"."PARTREV") "C0",
             "L62T15"."PARTDSC1" "C1",
             "O08T16"."PARTNO" "C2",
             sum("O08T16"."REQQUANT") "C3",
             "O06T17"."ORDSTAT" "C4",
             "L62T15"."BALTOT" "C5",
             "L62T15"."SHORTL62" "C6",
             sum("O08T16"."DELQUANT") "C7",
             "L62T15"."BALPL" "C8",
             "L62T15"."PMHA" "C9",
             "L62T15"."PZONE" "C10",
             "O08T16"."LINESTAT" "C11",
             TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))) "C12",
             "L62T15"."BALBF" "C13",
             "L62T15"."WBUFMHA" "C14",
             "L62T15"."WLDCT" "C15",
             "L62T15"."CQUANT" "C16",
             min("L62T15"."CQUANT") "C17"
      FROM "L62T15",
           "O08T16",
           "O06T17",
           "R08T1" "R08T1"
      WHERE "O08T16"."LINESTAT" NOT IN (0,
                                        1)
        AND "L62T15"."PMHA" IN ('55P1 ')
        AND "L62T15"."BALTOT">0
        AND "O08T16"."SHORTL62"="L62T15"."SHORTL62"
        AND "O06T17"."SHORTO06"="O08T16"."SHORTO06"
        AND "O08T16"."SHORTR08"="R08T1"."SHORTR08"
      GROUP BY trim(BOTH
                    FROM "L62T15"."PARTREV"),
               "L62T15"."PARTDSC1",
               "O08T16"."PARTNO",
               "O06T17"."ORDSTAT",
               "L62T15"."BALTOT",
               "L62T15"."SHORTL62",
               "L62T15"."BALPL",
               "L62T15"."PMHA",
               "L62T15"."PZONE",
               "O08T16"."LINESTAT",
               TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))),
               "L62T15"."BALBF",
               "L62T15"."WBUFMHA",
               "L62T15"."WLDCT",
               "L62T15"."CQUANT") "T0") "T0"
WHERE "T0"."C18" - "T0"."C7" IN (0)
  OR "T0"."C18" - "T0"."C7" IS NULL