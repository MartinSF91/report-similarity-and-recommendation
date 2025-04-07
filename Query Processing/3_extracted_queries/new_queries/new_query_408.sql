SELECT DISTINCT "SQL1"."LSC" "LSC",
                "SQL1"."ORDER_ID" "ORDER_ID",
                "SQL1"."ORDERSTATUS" "ORDERSTATUS",
                "SQL1"."REQ_DSP_DATE" "REQ_DSP_DATE",
                "SQL1"."CDC_DSP_DATE" "CDC_DSP_DATE",
                "SQL1"."TOURSTATUS" "TOURSTATUS",
                "SQL1"."TOURSTAT_DATE" "TOURSTAT_DATE",
                "SQL1"."CSM_NO" "CSM_NO",
                "SQL1"."SHIP_ID" "SHIP_ID"
FROM "SQL1"
WHERE "SQL1"."ORDER_ID"=CAST(:PQ1 AS VARCHAR(25 CHAR))