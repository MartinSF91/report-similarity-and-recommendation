
SELECT "T0"."C0" "RCTShpNo",
       "T0"."C1" "RCTCsmNo",
       "T0"."C2" "RCTTrpId",
       "T0"."C3" "RCTDateAct",
       "T0"."C4" "RCTLineArtNo",
       "T0"."C5" "RCTLineDiscCode1",
       "T0"."C6" "RCTArtQtyCompl",
       "T0"."C7" "RCTBuCodeCreShp",
       "T0"."C8" "RCTBuTypeCreShp",
       "T0"."C9" "Completion_Date",
       "T0"."C10" "RCTArtQtyUnl",
       "T0"."C3" "RCTDateAct1",
       "T0"."C11" "RCTType",
       "T0"."C12" "RCTBuCodeCreCsm",
       "T0"."C13" "RCTBuTypeCreCsm",
       "T0"."C14" "ARTName",
       "T0"."C15" "RCTArtQtyNoti",
       "T0"."C12" "RCTBuCodeCreCsm1",
       "T0"."C16" "RCTBuCodeRcv",
       "T0"."C17" "RCTArtQtyUnl___RCTArtQtyNoti"
FROM
  (SELECT "BO_RECEIPT_V"."SHP_NO" "C0",
          "BO_RECEIPT_V"."CSM_NO" "C1",
          "BO_RECEIPT_V"."TRPT_ID" "C2",
          TRUNC(cast("BO_RECEIPT_V"."RCT_DATE_ACT" AS TIMESTAMP(9))) "C3",
          "BO_RECEIPTLINE_V"."ART_NO" "C4",
          decode("BO_RECEIPTLINE_D_V"."RCTLIN_CODE_DIF1", NULL, "BO_RECEIPTLINE_D_V"."RCTLIN_CODE_DIF1", "BO_RECEIPTLINE_V"."RCTLIN_CODE_DIF1") "C5",
          "BO_RECEIPTLINE_V"."ART_QTY_COMPL" "C6",
          "BO_RECEIPT_V"."BU_CODE_CRE_SHP" "C7",
          "BO_RECEIPT_V"."BU_TYPE_CRE_SHP" "C8",
          "BO_RECEIPTLINE_V"."RCTLIN_DATE_COMPL" "C9",
          "BO_RECEIPTLINE_V"."ART_QTY_UNL" "C10",
          "BO_RECEIPT_V"."RCT_TYPE" "C11",
          "BO_RECEIPT_V"."BU_CODE_CRE" "C12",
          "BO_RECEIPT_V"."BU_TYPE_CRE" "C13",
          "ARTICLE"."ART_NAME" "C14",
          "BO_RECEIPTLINE_V"."ART_QTY_NOT" "C15",
          "BO_RECEIPT_V"."BU_CODE_RCV" "C16",
          min("BO_RECEIPTLINE_V"."ART_QTY_UNL") - min("BO_RECEIPTLINE_V"."ART_QTY_NOT") "C17"
   FROM ((("ART_SUP" "ART_SUP"
           INNER JOIN "BO_RECEIPTLINE_V" "BO_RECEIPTLINE_V" ON "ART_SUP"."ART_NO"="BO_RECEIPTLINE_V"."ART_NO"
           AND "ART_SUP"."SUP_NO"="BO_RECEIPTLINE_V"."SUP_NO")
          INNER JOIN "BO_RECEIPT_V" "BO_RECEIPT_V" ON "BO_RECEIPTLINE_V"."RCT_NO"="BO_RECEIPT_V"."RCT_NO")
         INNER JOIN "ARTICLE" "ARTICLE" ON "ARTICLE"."ART_NO"="ART_SUP"."ART_NO")
   LEFT OUTER JOIN "BO_RECEIPTLINE_D_V" "BO_RECEIPTLINE_D_V" ON "BO_RECEIPTLINE_V"."RCTLIN_NO"="BO_RECEIPTLINE_D_V"."RCTLIN_NO"
   AND "BO_RECEIPTLINE_V"."RCT_NO"="BO_RECEIPTLINE_D_V"."RCT_NO"
   GROUP BY "BO_RECEIPT_V"."SHP_NO",
            "BO_RECEIPT_V"."CSM_NO",
            "BO_RECEIPT_V"."TRPT_ID",
            TRUNC(cast("BO_RECEIPT_V"."RCT_DATE_ACT" AS TIMESTAMP(9))),
            "BO_RECEIPTLINE_V"."ART_NO",
            decode("BO_RECEIPTLINE_D_V"."RCTLIN_CODE_DIF1", NULL, "BO_RECEIPTLINE_D_V"."RCTLIN_CODE_DIF1", "BO_RECEIPTLINE_V"."RCTLIN_CODE_DIF1"),
            "BO_RECEIPTLINE_V"."ART_QTY_COMPL",
            "BO_RECEIPT_V"."BU_CODE_CRE_SHP",
            "BO_RECEIPT_V"."BU_TYPE_CRE_SHP",
            "BO_RECEIPTLINE_V"."RCTLIN_DATE_COMPL",
            "BO_RECEIPTLINE_V"."ART_QTY_UNL",
            "BO_RECEIPT_V"."RCT_TYPE",
            "BO_RECEIPT_V"."BU_CODE_CRE",
            "BO_RECEIPT_V"."BU_TYPE_CRE",
            "ARTICLE"."ART_NAME",
            "BO_RECEIPTLINE_V"."ART_QTY_NOT",
            "BO_RECEIPT_V"."BU_CODE_RCV") "T0"