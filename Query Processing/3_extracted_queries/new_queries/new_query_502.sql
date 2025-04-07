/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=wl88MC89vyds9yvy4wwjq8Chlld4wGdd2s2dwM4v */
SELECT "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
       "SHP"."SERV_PROV_NAME" AS "Service_Provider_Name",
       replace("SHP"."SHP_ID", '-') AS "Shipment_Id",
       "SHP"."EQUIP_ISO_CODE" AS "Equipment_ISO_Code",
       "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
       "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
       CASE
           WHEN "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" = 'DT' THEN 'STORE'
           ELSE 'TRANSIT'
       END AS "Distribution_Order_End_Receiver_BU_Type",
       SUM("CSM_LINE"."LINE_TOT_NUM_OF_PACK") AS "Total_Line_Number_Of_Packages",
       "SHP"."FIRST_STOP_BU_TYPE" AS "First_Stop_Address_BU_Type",
       "SHP"."EVENT_NAME" AS "Event_Name",
       SUM("CSM_LINE"."LINE_TOT_GROSS_VOL" / 1000) AS "Total_Line_Gross_Volume1",
       "SHP_LAST_BU_ADDRESS"."CLU_CODE" AS "Last_Stop_BU_Code",
       "SHP"."LAST_MEANS_OF_TRPT" AS "Last_Means_Of_Transport",
       SUM("CSM_LINE"."LINE_TOT_NUM_OF_PACK") AS "Total_Line_Number_Of_Packages1"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "SHP_LAST_BU_ADDRESS" ON "SHP_LAST_BU_ADDRESS"."CLUT_TYPE" = "SHP"."LAST_STOP_BU_TYPE"
AND "SHP_LAST_BU_ADDRESS"."CLU_CODE" = "SHP"."LAST_STOP_BU_CODE"
AND "SHP_LAST_BU_ADDRESS"."SEQ_NO" = "SHP"."LAST_STOP_BU_SEQ"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_LINE" "CSM_LINE" ON "CSM_LINE"."CSM_NO" = "CSM"."CSM_NO"
AND "CSM_LINE"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_LINE"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_LINE"."LATEST_UPDATE_TIMESTAMP" = "CSM"."LATEST_UPDATE_TIMESTAMP"
WHERE "SHP"."LAST_STOP_BU_CODE" IN ('MEE',
                                    'BEANR')
  AND "SHP"."FIRST_STOP_BU_TYPE" IN ('IMT',
                                     'PRT')
  AND TRUNC(cast("SHP"."LAST_ARR_EST_DTIME" AS DATE)) >= :p_from_date:
  AND TRUNC(cast("SHP"."LAST_ARR_EST_DTIME" AS DATE)) <= :p_to_date:
GROUP BY "SHP"."LAST_ARR_EST_DTIME",
         "SHP"."SERV_PROV_NAME",
         replace("SHP"."SHP_ID", '-'),
         "SHP"."EQUIP_ISO_CODE",
         "SHP"."LAST_STOP_BU_TYPE",
         "SHP"."LAST_STOP_BU_CODE",
         CASE
             WHEN "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" = 'DT' THEN 'STORE'
             ELSE 'TRANSIT'
         END,
         "SHP"."FIRST_STOP_BU_TYPE",
         "SHP"."EVENT_NAME",
         "SHP_LAST_BU_ADDRESS"."CLU_CODE",
         "SHP"."LAST_MEANS_OF_TRPT"