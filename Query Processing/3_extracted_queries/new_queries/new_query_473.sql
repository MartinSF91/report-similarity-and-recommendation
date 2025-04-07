
SELECT "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
       "SHP"."SHP_ID" AS "Shipment_Id",
       "CSM"."CSM_ID" AS "Consignment_Id",
       "SHP"."SERV_PROV_NAME" AS "Service_Provider_Name",
       "SHP"."EQUIP_ISO_CODE" AS "Equipment_ISO_Code",
       "SHP"."EQUIP_TYPE_CODE" AS "Equipment_Type_Code",
       CASE
           WHEN "SHP"."FIRST_STOP_BU_CODE" IS NULL
                OR "SHP"."FIRST_STOP_BU_TYPE" IS NULL
                OR "SHP"."FIRST_STOP_BU_SEQ" IS NULL THEN NULL
           ELSE "SHP"."FIRST_STOP_BU_CODE" || '-' || "SHP"."FIRST_STOP_BU_TYPE" || '-' || "SHP"."FIRST_STOP_BU_SEQ"
       END AS "First_Stop_Address_BU",
       CASE
           WHEN "SHP"."LAST_STOP_BU_CODE" IS NULL
                OR "SHP"."LAST_STOP_BU_TYPE" IS NULL THEN NULL
           ELSE "SHP"."LAST_STOP_BU_CODE" || '-' || "SHP"."LAST_STOP_BU_TYPE"
       END AS "Last_Stop_Address_BU",
       "SHP"."LATEST_MAJOR_REC24_CODE" AS "Shipment_Latest_Major_Event_Code",
       "SHP"."EVENT_NAME" AS "Event_Name",
       SUM("SHP"."TOT_PLANNED_NET_VOL" / 1000) AS "Total_Planned_Net_Volume"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
WHERE CASE
          WHEN "SHP"."LAST_STOP_BU_CODE" IS NULL
               OR "SHP"."LAST_STOP_BU_TYPE" IS NULL THEN NULL
          ELSE "SHP"."LAST_STOP_BU_CODE" || '-' || "SHP"."LAST_STOP_BU_TYPE"
      END IN ('001-DT')
  AND "SHP"."LAST_ARR_EST_DTIME" >= trunc(sysdate)
GROUP BY "SHP"."LAST_ARR_EST_DTIME",
         "SHP"."SHP_ID",
         "CSM"."CSM_ID",
         "SHP"."SERV_PROV_NAME",
         "SHP"."EQUIP_ISO_CODE",
         "SHP"."EQUIP_TYPE_CODE",
         CASE
             WHEN "SHP"."FIRST_STOP_BU_CODE" IS NULL
                  OR "SHP"."FIRST_STOP_BU_TYPE" IS NULL
                  OR "SHP"."FIRST_STOP_BU_SEQ" IS NULL THEN NULL
             ELSE "SHP"."FIRST_STOP_BU_CODE" || '-' || "SHP"."FIRST_STOP_BU_TYPE" || '-' || "SHP"."FIRST_STOP_BU_SEQ"
         END,
         CASE
             WHEN "SHP"."LAST_STOP_BU_CODE" IS NULL
                  OR "SHP"."LAST_STOP_BU_TYPE" IS NULL THEN NULL
             ELSE "SHP"."LAST_STOP_BU_CODE" || '-' || "SHP"."LAST_STOP_BU_TYPE"
         END,
         "SHP"."LATEST_MAJOR_REC24_CODE",
         "SHP"."EVENT_NAME"