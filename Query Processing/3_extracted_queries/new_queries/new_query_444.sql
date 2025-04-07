
SELECT DISTINCT TRUNC(cast("BO_PALL_CHG_LOG_V"."CHG_DATE" AS TIMESTAMP(9))) "STOChgDate",
                "BO_PALL_CHG_LOG_V"."ART_NO" "STOChgArtNo",
                "BO_PALL_CHG_LOG_V"."SUP_NO" "STOChgSupNo",
                "BO_PALL_CHG_LOG_V"."PALL_ID" "STOChgPallid",
                "BO_PALL_CHG_LOG_V"."CHG_TYPE" "STOChgTyp",
                "BO_PALL_CHG_LOG_V"."ART_QTY" "STOChgQty"
FROM "BO_PALL_CHG_LOG_V" "BO_PALL_CHG_LOG_V"
WHERE "BO_PALL_CHG_LOG_V"."CHG_TYPE" IN ('437',
                                         '457')
  AND TRUNC(cast("BO_PALL_CHG_LOG_V"."CHG_DATE" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-25' AND DATE '2025-03-25'