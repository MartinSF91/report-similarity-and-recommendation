/* user=Jhanvi Nandani reportPath= report= queryName=Abfrage8 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=GvqCMlj9Cylqq2jdv4CCj29CMhlqC8l4G2hhGqM8 */
SELECT "SHP"."EQUIP_GEN_CODE",
       "SHP"."EQUIP_ISO_CODE",
       "CSM"."CSM_ID",
       "SHP"."SHP_ID",
       "SHP_STOP"."ARR_EST_DTIME",
       "SHP"."SERV_PROV_NAME",
       "SHP_STOP"."STOP_TYPE",
       TRUNC(cast("SHP_STOP"."ARR_EST_DTIME" AS DATE)),
       "SHP"."EVENT_NAME",
       "SHP"."LATEST_MAJOR_PRIO",
       CASE
           WHEN length("SHP"."EQUIP_GEN_CODE") > 0 THEN "SHP"."EQUIP_GEN_CODE"
           ELSE "SHP"."EQUIP_ISO_CODE"
       END,
       "SHP"."MOT_FCL_LCL",
       "SHP"."FLOW_TYPE",
       "CSM"."LATEST_MAJOR_EV",
       "CSM"."CNEE",
       "SHP"."EQUIP_TYPE_CODE",
       SUBSTR("SHP"."EQUIP_TYPE_CODE", 1, 1),
       "SHP_STOP_BU_ADDRESS"."CLUT_TYPE",
       "SHP_STOP_BU_ADDRESS"."CLU_CODE",
       replace("SHP"."SHP_ID", '-', ''),
       replace("CSM"."CSM_ID", '-', ''),
       substr("CSM"."CNEE", 1, 3),
       "CSM"."FLOW_TYPE",
       "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE",
       "SHP_FIRST_BU_ADDRESS"."CLU_CODE",
       "SHP_FIRST_BU_ADDRESS"."SEQ_NO",
       "CSM"."ARR_EST_DTIME",
       "CSM_LINE"."ITEM_NAME",
       "CSM_LINE"."SEQ",
       "CSM_LINE"."DIST_ORD_END_REC_BU_CODE",
       "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE",
       "CSM_LINE"."DIST_ORD_END_REC_BU_SEQ",
       CASE
           WHEN "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" IS NULL
                OR "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" IS NULL
                OR "CSM_LINE"."DIST_ORD_END_REC_BU_SEQ" IS NULL THEN NULL
           ELSE "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" || '-' || "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" || '-' || "CSM_LINE"."DIST_ORD_END_REC_BU_SEQ"
       END,
       "CSM"."CNOR_CTY",
       "CSM"."CNEE_CTY",
       "CSM_LINE"."LINE_QTY"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP_STOP_ITM_VW" "SHP_STOP" ON "SHP_STOP"."SHP_CRE_BU_CODE" = "SHP"."SHP_CRE_BU_CODE"
AND "SHP_STOP"."SHP_CRE_BU_TYPE" = "SHP"."SHP_CRE_BU_TYPE"
AND "SHP_STOP"."SHP_NO" = "SHP"."SHP_NO"
AND "SHP_STOP"."LATEST_UPDATE_TIMESTAMP" = "SHP"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "SHP_STOP_BU_ADDRESS" ON "SHP_STOP_BU_ADDRESS"."CLU_CODE" = "SHP_STOP"."STOP_BU_CODE"
AND "SHP_STOP_BU_ADDRESS"."CLUT_TYPE" = "SHP_STOP"."STOP_BU_TYPE"
AND "SHP_STOP_BU_ADDRESS"."SEQ_NO" = "SHP_STOP"."STOP_BU_SEQ"
LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "SHP_FIRST_BU_ADDRESS" ON "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" = "SHP"."FIRST_STOP_BU_TYPE"
AND "SHP_FIRST_BU_ADDRESS"."CLU_CODE" = "SHP"."FIRST_STOP_BU_CODE"
AND "SHP_FIRST_BU_ADDRESS"."SEQ_NO" = "SHP"."FIRST_STOP_BU_SEQ"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_LINE" "CSM_LINE" ON "CSM_LINE"."CSM_NO" = "CSM"."CSM_NO"
AND "CSM_LINE"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_LINE"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_LINE"."LATEST_UPDATE_TIMESTAMP" = "CSM"."LATEST_UPDATE_TIMESTAMP"
WHERE TRUNC(cast("SHP_STOP"."ARR_EST_DTIME" AS DATE)) BETWEEN trunc(CASE
                                                                        WHEN (MOD(MOD(TO_NUMBER(TO_CHAR(sysdate, 'D')) - TO_NUMBER(TO_CHAR(TO_DATE('2003-01-06', 'YYYY-MM-DD'), 'D')) + 7, 7) + 1 - 1 + 7, 7) + 1) < 5 THEN sysdate + 1
                                                                        ELSE (sysdate + 1) + (7 - (MOD(MOD(TO_NUMBER(TO_CHAR(sysdate, 'D')) - TO_NUMBER(TO_CHAR(TO_DATE('2003-01-06', 'YYYY-MM-DD'), 'D')) + 7, 7) + 1 - 1 + 7, 7) + 1))
                                                                    END) AND trunc(CASE
                                                                                       WHEN (MOD(MOD(TO_NUMBER(TO_CHAR(sysdate, 'D')) - TO_NUMBER(TO_CHAR(TO_DATE('2003-01-06', 'YYYY-MM-DD'), 'D')) + 7, 7) + 1 - 1 + 7, 7) + 1) < 5 THEN sysdate + 1
                                                                                       ELSE (sysdate + 1) + (7 - (MOD(MOD(TO_NUMBER(TO_CHAR(sysdate, 'D')) - TO_NUMBER(TO_CHAR(TO_DATE('2003-01-06', 'YYYY-MM-DD'), 'D')) + 7, 7) + 1 - 1 + 7, 7) + 1))
                                                                                   END + 1)
  AND "SHP_STOP_BU_ADDRESS"."CLU_CODE" IN (:'Stop BU Code':)
  AND "CSM"."CNEE" IN (:'Consignee':)
  AND NOT ("SHP"."LATEST_MAJOR_PRIO" IN ('100',
                                         '900'))
  AND "CSM"."LATEST_MAJOR_EV" <> '324'