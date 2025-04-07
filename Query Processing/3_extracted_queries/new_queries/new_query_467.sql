SELECT "T0"."C0" "DspDet_TripStat",
       "T0"."C1" "DspDet_PickDateTime",
       "T0"."C2" "DspDet_DepDate",
       "T0"."C3" "OrdLine_LineStat",
       "T0"."C4" "ARTName",
       "T0"."C5" "VICOrdLin_ArtNo",
       "T0"."C6" "VICOrdLin_QtyReq",
       "T0"."C7" "VICOrdLin_QtyPick",
       "T0"."C8" "ViCO_CusOrd_ID",
       "T0"."C9" "StoBal_PickBal",
       "T0"."C10" "Datenelement2",
       "T0"."C11" "ArtLoc_PickMha",
       "T0"."C12" "ArtFea_DefPallQty",
       "T0"."C13" "ArtLoc_Pickzone",
       "T0"."C6" "Auswertung_VICOrdLin_QtyReq_",
       "T0"."C7" "Auswertung_VICOrdLin_QtyPick_",
       "T0"."C10" "Auswertung_Datenelement2_",
       "T0"."C14" "Qty_auf_PP",
       "T0"."C15" "DspDet_RefKeyR08T1",
       "T0"."C16" "ORDNO",
       "T0"."C17" "DspDet_NofOrdlin",
       "T0"."C18" "DspDet_NofRelOrdlin",
       "T0"."C19" "DspDet_NofPickOrdlin",
       "T0"."C20" "Datenelement3",
       "T0"."C21" "DspDet_LSC_No",
       "T0"."C22" "DspDet_ViCoLoadSpec",
       "T0"."C23" "DspDet_ItsDspNo",
       "T0"."C24" "DspDet_RouteNo",
       "T0"."C25" "c29"
FROM
  (SELECT CASE
              WHEN "R08T1"."TRIPSTAT"=2 THEN 'Released'
          END "C0",
          "R08T1"."PICKDATE" "C1",
          TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))) "C2",
          CASE
              WHEN "O08T16"."LINESTAT"=4 THEN 'being Picked'
              WHEN "O08T16"."LINESTAT"=22 THEN '22 - Planned'
          END "C3",
          "L62T17"."PARTDSC1" "C4",
          trim(BOTH
               FROM "O08T16"."PARTNO") "C5",
          sum("O08T16"."REQQUANT") "C6",
          sum("O08T16"."DELQUANT") "C7",
          "O04T18"."EORDERID" "C8",
          "L62T17"."BALPL" "C9",
          sum("O08T16"."REQQUANT") - sum("O08T16"."DELQUANT") "C10",
          "L62T17"."PMHA" "C11",
          "L62T17"."CQUANT" "C12",
          "L62T17"."PZONE" "C13",
          min("L62T17"."BALPL") - (sum("O08T16"."REQQUANT") - sum("O08T16"."DELQUANT")) "C14",
          "R08T1"."SHORTR08" "C15",
          "O06T19"."ORDNO" "C16",
          "R08T1"."NOORDL" "C17",
          "R08T1"."NORORDL" "C18",
          "R08T1"."NOPORDL" "C19",
          (100*"R08T1"."NOPORDL")/nullif("R08T1"."NOORDL", 0) "C20",
          substr("R08T1"."ETRIPID", 1, 3) "C21",
          CASE
              WHEN to_char("R08T1"."OPPDATE", 'DDMMYYYY') IS NULL
                   OR trim(BOTH
                           FROM "R08T1"."ROUTENO") IS NULL
                   OR trim(BOTH
                           FROM "R08T1"."TRIPNO") IS NULL THEN NULL
              ELSE to_char("R08T1"."OPPDATE", 'DDMMYYYY') || '-' || trim(BOTH
                                                                         FROM "R08T1"."ROUTENO") || '-' || trim(BOTH
                                                                                                                FROM "R08T1"."TRIPNO")
          END "C22",
          CASE
              WHEN substr("R08T1"."ROUTENO", 1, 3) IS NULL
                   OR lpad(to_char("R08T1"."SHORTR08"), 3, 0) IS NULL THEN NULL
              ELSE substr("R08T1"."ROUTENO", 1, 3) || '-' || lpad(to_char("R08T1"."SHORTR08"), 3, 0)
          END "C23",
          "R08T1"."ROUTENO" "C24",
          sum("O08T16"."SHORTL62") "C25"
   FROM "R08T1" "R08T1",
        "O08T16",
        "L62T17",
        "O04T18",
        "O06T19"
   WHERE CASE
             WHEN ("O08T16"."LINESTAT"=4) THEN 'being Picked'
             WHEN ("O08T16"."LINESTAT"=22) THEN '22 - Planned'
         END IN ('being Picked')
     AND "O08T16"."SHORTR08"="R08T1"."SHORTR08"
     AND "O08T16"."SHORTL62"="L62T17"."SHORTL62"
     AND "O08T16"."SHORTO04"="O04T18"."SHORTO04"
     AND "O06T19"."SHORTO06"="O08T16"."SHORTO06"
   GROUP BY CASE
                WHEN "R08T1"."TRIPSTAT"=2 THEN 'Released'
            END,
            "R08T1"."PICKDATE",
            TRUNC(cast("R08T1"."DEPDATE" AS TIMESTAMP(9))),
            CASE
                WHEN "O08T16"."LINESTAT"=4 THEN 'being Picked'
                WHEN "O08T16"."LINESTAT"=22 THEN '22 - Planned'
            END,
            "L62T17"."PARTDSC1",
            trim(BOTH
                 FROM "O08T16"."PARTNO"),
            "O04T18"."EORDERID",
            "L62T17"."BALPL",
            "L62T17"."PMHA",
            "L62T17"."CQUANT",
            "L62T17"."PZONE",
            "R08T1"."SHORTR08",
            "O06T19"."ORDNO",
            "R08T1"."NOORDL",
            "R08T1"."NORORDL",
            "R08T1"."NOPORDL",
            (100*"R08T1"."NOPORDL")/nullif("R08T1"."NOORDL", 0),
            substr("R08T1"."ETRIPID", 1, 3),
            CASE
                WHEN to_char("R08T1"."OPPDATE", 'DDMMYYYY') IS NULL
                     OR trim(BOTH
                             FROM "R08T1"."ROUTENO") IS NULL
                     OR trim(BOTH
                             FROM "R08T1"."TRIPNO") IS NULL THEN NULL
                ELSE to_char("R08T1"."OPPDATE", 'DDMMYYYY') || '-' || trim(BOTH
                                                                           FROM "R08T1"."ROUTENO") || '-' || trim(BOTH
                                                                                                                  FROM "R08T1"."TRIPNO")
            END,
            CASE
                WHEN substr("R08T1"."ROUTENO", 1, 3) IS NULL
                     OR lpad(to_char("R08T1"."SHORTR08"), 3, 0) IS NULL THEN NULL
                ELSE substr("R08T1"."ROUTENO", 1, 3) || '-' || lpad(to_char("R08T1"."SHORTR08"), 3, 0)
            END,
            "R08T1"."ROUTENO") "T0"