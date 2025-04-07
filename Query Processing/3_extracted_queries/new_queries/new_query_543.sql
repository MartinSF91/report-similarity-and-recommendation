/* user=Piratla Manikanta reportPath= report= queryName=Запрос1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=Cvjjjl884wy2lqsql4M8v4wGCCjwyGhGMqyMh4h8 */
SELECT DISTINCT "SHP"."SHP_ID" AS "Shipment_Id",
                "CSM"."CSM_ID" AS "Consignment_Id",
                "SHP"."FIRST_ARR_PLAN_DTIME" AS "First_Planned_Arrival_Date_Time",
                "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
                "SHP"."LAST_DEP_ACT_DTIME" AS "Last_Actual_Departure_Date_Time",
                "SHP"."LAST_ARR_ACT_DTIME" AS "Last_Actual_Arrival_Date_Time",
                "SHP"."FIRST_STOP_CTY" AS "First_Stop_Country_Code",
                "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
                "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
                "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
                "CSM"."CNEE_BU_TYPE" AS "Consignee_BU_Type",
                "CSM"."CNOR_BU_CODE" AS "Consignor_BU_Code",
                "CSM"."CNOR_BU_TYPE" AS "Consignor_BU_Type",
                "SHP"."LAST_STOP_CTY" AS "Last_Stop_Country_Code",
                CASE
                    WHEN "SHP"."LAST_ARR_EST_DTIME" IS NULL THEN 0
                    WHEN trunc("SHP"."LAST_ARR_EST_DTIME", 'month') >= add_months(trunc(CURRENT_TIMESTAMP, 'month'), -3)
                         AND trunc("SHP"."LAST_ARR_EST_DTIME", 'month') <= trunc(CURRENT_TIMESTAMP, 'month') THEN 1
                    ELSE 0
                END AS "FILTER_LAST_3_MONTHS",
                "CSM"."CNEE_CTY" AS "Consignee_Country_Code"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
WHERE "CSM"."CNEE_BU_TYPE" IN ('DT',
                               'STO',
                               'CDC')
  AND "CSM"."CNOR_BU_TYPE" IN ('SUP',
                               'DT')
  AND "SHP"."LAST_STOP_CTY" IN ('RU')
  AND CASE
          WHEN "SHP"."LAST_ARR_EST_DTIME" IS NULL THEN 0
          WHEN trunc("SHP"."LAST_ARR_EST_DTIME", 'month') >= add_months(trunc(CURRENT_TIMESTAMP, 'month'), -3)
               AND trunc("SHP"."LAST_ARR_EST_DTIME", 'month') <= trunc(CURRENT_TIMESTAMP, 'month') THEN 1
          ELSE 0
      END = 1
  AND "CSM"."CNEE_CTY" IN ('RU')