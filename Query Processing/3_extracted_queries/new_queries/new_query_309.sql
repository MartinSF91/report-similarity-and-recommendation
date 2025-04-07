/* user=Jhanvi Nandani reportPath= report= queryName=ITM REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=4w8sGCy42sysyqCsyG9Gdyvsjy9vM2MGG8hs9vy2 */
SELECT "SHP"."SHP_ID" AS "Shipment_Id",
       "SHP"."SHP_NO" AS "Shipment_Number",
       "SHP"."FIRST_DEP_PLAN_DTIME" AS "Planned_Dispatch_Date",
       "SHP"."FIRST_DEP_ACT_DTIME" AS "First_Actual_Departure_Date_Time",
       "SHP"."LAST_ARR_PLAN_DTIME" AS "Last_Planned_Arrival_Date_Time",
       "SHP"."EQUIP_GEN_CODE" AS "Equipment_Generic_Code",
       "CSM"."LATEST_MAJOR_REC24_CODE" AS "Consignment_Latest_Major_Event_Code",
       "CSM"."CSM_NO" AS "Consignment_Number",
       SUM("CSM_EV_48_1_L"."LOAD_QTY") AS "Item_Quantity_Dispatched",
       "SHP"."FIRST_STOP_BU_CODE" AS "First_Stop_Address_BU_Code",
       "SHP"."FIRST_STOP_BU_TYPE" AS "First_Stop_Address_BU_Type",
       "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
       "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
       SUM("CSM"."TOT_NET_VOL" / 1000) AS "Total_Net_Volume",
       SUM("CSM"."TOT_GROSS_VOL" / 1000) AS "Total_Gross_Volume",
       SUM("CSM_LINE"."LINE_TOT_DSP_GROSS_VOL") AS "Total_Line_Dispatched_Gross_Volume",
       SUM("CSM_LINE"."LINE_TOT_DSP_NET_VOL") AS "Total_Line_Dispatched_Net_Volume",
       "SHP"."FIRST_STOP_CTY" AS "First_Stop_Country_Code",
       "SHP"."LAST_STOP_CTY" AS "Last_Stop_Country_Code",
       "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
       "SHP"."LAST_ARR_ACT_DTIME" AS "Last_Actual_Arrival_Date_Time",
       "SHP"."EVENT_NAME" AS "Event_Name",
       "CSM"."EVENT_NAME" AS "CSM_Status"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_LINE" "CSM_LINE" ON "CSM_LINE"."CSM_NO" = "CSM"."CSM_NO"
AND "CSM_LINE"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_LINE"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_LINE"."LATEST_UPDATE_TIMESTAMP" = "CSM"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_EV_48_1_L" "CSM_EV_48_1_L" ON "CSM_EV_48_1_L"."CSM_CRE_BU_CODE" = "CSM_LINE"."CSM_CRE_BU_CODE"
AND "CSM_EV_48_1_L"."CSM_CRE_BU_TYPE" = "CSM_LINE"."CSM_CRE_BU_TYPE"
AND "CSM_EV_48_1_L"."CSM_NO" = "CSM_LINE"."CSM_NO"
AND "CSM_EV_48_1_L"."SEQ" = "CSM_LINE"."SEQ"
AND "CSM_EV_48_1_L"."ITEM_NO" = "CSM_LINE"."ITEM_NO"
AND "CSM_EV_48_1_L"."LATEST_UPDATE_TIMESTAMP" = "CSM_LINE"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP_EV" "SHP_EV" ON "SHP_EV"."SHP_NO" = "SHP"."SHP_NO"
AND "SHP_EV"."LATEST_UPDATE_TIMESTAMP" = "SHP"."LATEST_UPDATE_TIMESTAMP"
AND "SHP_EV"."SHP_CRE_BU_CODE" = "SHP"."SHP_CRE_BU_CODE"
AND "SHP_EV"."SHP_CRE_BU_TYPE" = "SHP"."SHP_CRE_BU_TYPE"
WHERE "SHP"."LATEST_MAJOR_REC24_CODE" = 1
  AND "SHP"."FIRST_DEP_ACT_DTIME" >= TRUNC(CURRENT_DATE) - 90
  AND "CSM"."CNEE_BU_TYPE" = 'STO'
  AND "SHP_EV"."IS_LATEST_EVENT" = 1
  AND "SHP"."LAST_STOP_CTY" = 'US'
  AND "CSM"."CNOR_BU_TYPE" IN ('DT')
  AND "CSM_LINE"."ITEM_TYPE" = 'ART'
  AND NOT ("CSM_EV_48_1_L"."LOAD_QTY" IS NULL)
GROUP BY "SHP"."SHP_ID",
         "SHP"."SHP_NO",
         "SHP"."FIRST_DEP_PLAN_DTIME",
         "SHP"."FIRST_DEP_ACT_DTIME",
         "SHP"."LAST_ARR_PLAN_DTIME",
         "SHP"."EQUIP_GEN_CODE",
         "CSM"."LATEST_MAJOR_REC24_CODE",
         "CSM"."CSM_NO",
         "SHP"."FIRST_STOP_BU_CODE",
         "SHP"."FIRST_STOP_BU_TYPE",
         "SHP"."LAST_STOP_BU_CODE",
         "SHP"."LAST_STOP_BU_TYPE",
         "SHP"."FIRST_STOP_CTY",
         "SHP"."LAST_STOP_CTY",
         "SHP"."LAST_ARR_EST_DTIME",
         "SHP"."LAST_ARR_ACT_DTIME",
         "SHP"."EVENT_NAME",
         "CSM"."EVENT_NAME"