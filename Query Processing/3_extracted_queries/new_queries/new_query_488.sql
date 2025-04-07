
SELECT "T0"."C0" "RCTDateTimePlnd",
       "T0"."C1" "RCTShpNo",
       "T0"."C2" "RCTStat",
       "T0"."C3" "RCTTrpId",
       "T0"."C4" "RCTLineArtNo",
       "T0"."C5" "RCTLinePallClass",
       "T0"."C6" "RCTLineSubType",
       "T0"."C7" "RCTLinePallCode_decode",
       "T0"."C8" "RCTBuCodeCreShp",
       "T0"."C9" "RCTBuTypeCreShp",
       "T0"."C10" "Advised_Pallets",
       "T0"."C11" "Round_up__Advised_Pallets_",
       "T0"."C11" "c13",
       "T0"."C12" "Data_Item1",
       "T0"."C13" "Data_Item2"
FROM
  (SELECT "BO_RECEIPT_V"."RCT_DATE_PLND" "C0",
          "BO_RECEIPT_V"."SHP_NO" "C1",
          "BO_RECEIPT_V"."RCT_STAT" "C2",
          "BO_RECEIPT_V"."TRPT_ID" "C3",
          "BO_RECEIPTLINE_V"."ART_NO" "C4",
          concat("BO_RECEIPTLINE_V"."CARR_TYPE", "BO_RECEIPTLINE_V"."CARR_CODE") "C5",
          nvl("BO_RECEIPTLINE_V"."RCTLIN_SUB_TYPE", ' ') "C6",
          decode("BO_RECEIPTLINE_V"."RCTLIN_CODE_PALL", 0, 'Unpalletised', 1, 'Palletised', 2, 'L.Ledges') "C7",
          "BO_RECEIPT_V"."BU_CODE_CRE_SHP" "C8",
          "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" "C9",
          "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0) "C10",
          CEIL(min("BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0))) "C11",
          CASE
              WHEN "BO_RECEIPT_V"."SHP_NO" IS NULL
                   OR "BO_RECEIPTLINE_V"."ART_NO" IS NULL
                   OR "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0) IS NULL THEN NULL
              ELSE "BO_RECEIPT_V"."SHP_NO" || "BO_RECEIPTLINE_V"."ART_NO" || "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0)
          END "C12",
          CASE
              WHEN "BO_RECEIPT_V"."BU_CODE_CRE_SHP" IS NULL
                   OR "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" IS NULL
                   OR "BO_RECEIPT_V"."SHP_NO" IS NULL THEN NULL
              ELSE "BO_RECEIPT_V"."BU_CODE_CRE_SHP" || "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" || "BO_RECEIPT_V"."SHP_NO"
          END "C13"
   FROM "BO_RECEIPT_V" "BO_RECEIPT_V",
        "BO_RECEIPTLINE_V" "BO_RECEIPTLINE_V"
   WHERE "BO_RECEIPT_V"."RCT_STAT" IN ('0',
                                       '1',
                                       '3')
     AND NOT "BO_RECEIPT_V"."SHP_NO" IS NULL
     AND NOT "BO_RECEIPT_V"."TRPT_ID" IS NULL
     AND "BO_RECEIPTLINE_V"."RCT_NO"="BO_RECEIPT_V"."RCT_NO"
   GROUP BY "BO_RECEIPT_V"."RCT_DATE_PLND",
            "BO_RECEIPT_V"."SHP_NO",
            "BO_RECEIPT_V"."RCT_STAT",
            "BO_RECEIPT_V"."TRPT_ID",
            "BO_RECEIPTLINE_V"."ART_NO",
            concat("BO_RECEIPTLINE_V"."CARR_TYPE", "BO_RECEIPTLINE_V"."CARR_CODE"),
            nvl("BO_RECEIPTLINE_V"."RCTLIN_SUB_TYPE", ' '),
            decode("BO_RECEIPTLINE_V"."RCTLIN_CODE_PALL", 0, 'Unpalletised', 1, 'Palletised', 2, 'L.Ledges'),
            "BO_RECEIPT_V"."BU_CODE_CRE_SHP",
            "BO_RECEIPT_V"."BU_TYPE_CRE_SHP",
            "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0),
            CASE
                WHEN "BO_RECEIPT_V"."SHP_NO" IS NULL
                     OR "BO_RECEIPTLINE_V"."ART_NO" IS NULL
                     OR "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0) IS NULL THEN NULL
                ELSE "BO_RECEIPT_V"."SHP_NO" || "BO_RECEIPTLINE_V"."ART_NO" || "BO_RECEIPTLINE_V"."ART_QTY_NOT"/nullif("BO_RECEIPTLINE_V"."ART_QTY_PALL", 0)
            END,
            CASE
                WHEN "BO_RECEIPT_V"."BU_CODE_CRE_SHP" IS NULL
                     OR "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" IS NULL
                     OR "BO_RECEIPT_V"."SHP_NO" IS NULL THEN NULL
                ELSE "BO_RECEIPT_V"."BU_CODE_CRE_SHP" || "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" || "BO_RECEIPT_V"."SHP_NO"
            END) "T0"