/* user=Piratla Manikanta reportPath= report= queryName=Query1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=wMqyCh29llqCjs2ldCGyh8sj4GGy98dGqGGdsdCC */
SELECT replace("SHP"."SHP_ID", '-', '') AS "SHP_WITHOUT",
       "SHP"."SHP_ID" AS "Shipment_Id",
       "SHP"."POL" AS "Port_Of_Loading",
       "SHP"."POD" AS "Port_Of_Discharge",
       CASE
           WHEN "SHP"."LAST_STOP_BU_CODE" IS NULL
                OR "SHP"."LAST_STOP_BU_TYPE" IS NULL
                OR "SHP"."LAST_STOP_BU_SEQ" IS NULL THEN NULL
           ELSE "SHP"."LAST_STOP_BU_CODE" || '-' || "SHP"."LAST_STOP_BU_TYPE" || '-' || "SHP"."LAST_STOP_BU_SEQ"
       END AS "Last_Stop",
       "CSM"."CNEE" AS "Consignee",
       "CSM_SHP"."BOL_NO" AS "Bill_Of_Lading_Number",
       "SHP"."EQUIP_TYPE_CODE" AS "Equipment_Type_Code",
       "SHP"."EQUIP_ISO_CODE" AS "Equipment_ISO_Code",
       "SHP"."SERV_PROV_BU_CODE" AS "Service_Provider_BU_Code",
       "SHP"."SERV_PROV_NAME" AS "Service_Provider_Name",
       "SHP"."MOT_MOVE_TYPE" AS "Mode_Of_Transport_Movement_Type",
       "SHP"."LAST_MEANS_OF_TRPT" AS "Last_Means_Of_Transport",
       CASE
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 361 THEN 'Created'
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 84
                AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Booked'
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 83 THEN 'Sealed'
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 24
                AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Started'
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 1
                AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Ended'
           WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 111 THEN 'Terminated'
           ELSE NULL
       END AS "Shp_State",
       CASE
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 15 THEN 'Created'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 242
                AND "CSM"."LATEST_MAJOR_SUB_CODE" = 8 THEN 'Delivery arranged'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 27 THEN 'In transit'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 29
                AND "CSM"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'In transit'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 48
                AND "CSM"."LATEST_MAJOR_SUB_CODE" = 2 THEN 'At transit location'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 1
                AND "CSM"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Arrived'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 72 THEN 'Unloaded'
           WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 324 THEN 'Cancelled'
           ELSE NULL
       END AS "Csm_State",
       TRUNC(cast("CSM"."ARR_EST_DTIME" AS DATE)) AS "Estimated_Arrival_Date_Time",
       "SHP"."LATEST_MAJOR_EV" AS "Shipment_Latest_Major_Event",
       "CSM"."LATEST_MAJOR_EV" AS "Consignment_Latest_Major_Event",
       "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
       "SHP"."SERV_PROV_BU_TYPE" AS "Service_Provider_BU_Type",
       "SHP_TSHP_SPROV_SHP"."SERV_PROV_SHP_ID" AS "Service_Provider_RefId",
       "SHP_STOP"."ARR_EST_DTIME" AS "Estimated_Arrival_Date_Time1",
       "CSM"."ARR_EST_DTIME" AS "Estimated_Arrival_Date_Time2",
       "SHP"."FIRST_ARR_EST_DTIME" AS "First_Estimated_Arrival_Date_Time",
       "CSM"."CNEE_BU_TYPE" AS "Consignee_BU_Type",
       SUM("CSM"."TOT_GROSS_WEI") AS "Total_Gross_Weight",
       "CSM"."CNEE_CTY" AS "Consignee_Country_Code",
       SUM("CSM_LINE"."LINE_TOT_NUM_OF_PACK") AS "Total_Line_Number_Of_Packages",
       SUM("SHP"."TOT_PLANNED_PACK_NOF") AS "Total_Planned_Number_Of_Packages",
       "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
       "CNEE_BU_ADDRESS"."CITY" AS "Consignee_City_Code",
       "CSM"."ARR_ACT_DTIME" AS "Actual_Arrival_Date_Time",
       "SHP_TSHP_SPROV_SHP"."SERV_PROV_SHP_ID" AS "Service_Provider_RefId1",
       "SHP"."SERV_PROV_NAME" AS "Service_Provider_Name1",
       "SHP"."SERV_PROV_BU_CODE" AS "Service_Provider_BU_Code1",
       "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
       "SHP_STOP"."ARR_EST_DTIME" AS "Estimated_Arrival_Date_Time3",
       "CSM"."CSM_ID" AS "Consignment_Id"
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
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP_TSHP_SPROV_SHP" "SHP_TSHP_SPROV_SHP" ON "SHP_TSHP_SPROV_SHP"."SHP_CRE_BU_CODE" = "SHP"."SHP_CRE_BU_CODE"
AND "SHP_TSHP_SPROV_SHP"."SHP_CRE_BU_TYPE" = "SHP"."SHP_CRE_BU_TYPE"
AND "SHP_TSHP_SPROV_SHP"."SHP_NO" = "SHP"."SHP_NO"
AND "SHP_TSHP_SPROV_SHP"."LATEST_UPDATE_TIMESTAMP" = "SHP"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_LINE" "CSM_LINE" ON "CSM_LINE"."CSM_NO" = "CSM"."CSM_NO"
AND "CSM_LINE"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_LINE"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_LINE"."LATEST_UPDATE_TIMESTAMP" = "CSM"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "CNEE_BU_ADDRESS" ON "CNEE_BU_ADDRESS"."SEQ_NO" = "CSM"."CNEE_BU_SEQ"
AND "CNEE_BU_ADDRESS"."CLUT_TYPE" = "CSM"."CNEE_BU_TYPE"
AND "CNEE_BU_ADDRESS"."CLU_CODE" = "CSM"."CNEE_BU_CODE"
WHERE "CSM"."CNEE_BU_TYPE" IN (:Prm_CneeType:)
  AND "CSM"."CNEE_CTY" IN (:Prm_CneeCty:)
  AND "SHP"."MOT_MOVE_TYPE" = 'O'
GROUP BY replace("SHP"."SHP_ID", '-', ''),
         "SHP"."SHP_ID",
         "SHP"."POL",
         "SHP"."POD",
         CASE
             WHEN "SHP"."LAST_STOP_BU_CODE" IS NULL
                  OR "SHP"."LAST_STOP_BU_TYPE" IS NULL
                  OR "SHP"."LAST_STOP_BU_SEQ" IS NULL THEN NULL
             ELSE "SHP"."LAST_STOP_BU_CODE" || '-' || "SHP"."LAST_STOP_BU_TYPE" || '-' || "SHP"."LAST_STOP_BU_SEQ"
         END,
         "CSM"."CNEE",
         "CSM_SHP"."BOL_NO",
         "SHP"."EQUIP_TYPE_CODE",
         "SHP"."EQUIP_ISO_CODE",
         "SHP"."SERV_PROV_BU_CODE",
         "SHP"."SERV_PROV_NAME",
         "SHP"."MOT_MOVE_TYPE",
         "SHP"."LAST_MEANS_OF_TRPT",
         CASE
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 361 THEN 'Created'
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 84
                  AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Booked'
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 83 THEN 'Sealed'
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 24
                  AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Started'
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 1
                  AND "SHP"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Ended'
             WHEN "SHP"."LATEST_MAJOR_REC24_CODE" = 111 THEN 'Terminated'
             ELSE NULL
         END,
         CASE
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 15 THEN 'Created'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 242
                  AND "CSM"."LATEST_MAJOR_SUB_CODE" = 8 THEN 'Delivery arranged'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 27 THEN 'In transit'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 29
                  AND "CSM"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'In transit'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 48
                  AND "CSM"."LATEST_MAJOR_SUB_CODE" = 2 THEN 'At transit location'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 1
                  AND "CSM"."LATEST_MAJOR_SUB_CODE" = 1 THEN 'Arrived'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 72 THEN 'Unloaded'
             WHEN "CSM"."LATEST_MAJOR_REC24_CODE" = 324 THEN 'Cancelled'
             ELSE NULL
         END,
         TRUNC(cast("CSM"."ARR_EST_DTIME" AS DATE)),
         "SHP"."LATEST_MAJOR_EV",
         "CSM"."LATEST_MAJOR_EV",
         "SHP"."LAST_STOP_BU_CODE",
         "SHP"."SERV_PROV_BU_TYPE",
         "SHP_TSHP_SPROV_SHP"."SERV_PROV_SHP_ID",
         "SHP_STOP"."ARR_EST_DTIME",
         "CSM"."ARR_EST_DTIME",
         "SHP"."FIRST_ARR_EST_DTIME",
         "CSM"."CNEE_BU_TYPE",
         "CSM"."CNEE_CTY",
         "SHP"."LAST_ARR_EST_DTIME",
         "CNEE_BU_ADDRESS"."CITY",
         "CSM"."ARR_ACT_DTIME",
         "CSM"."CNEE_BU_CODE",
         "CSM"."CSM_ID"