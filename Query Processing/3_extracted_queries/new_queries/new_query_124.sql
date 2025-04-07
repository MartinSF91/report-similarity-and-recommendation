/* user=Piratla Manikanta reportPath= report= queryName=Query1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=4dMjhl288C9s4jMMC9yGyGsl4hdh4sqvjw2dhCq2 */
SELECT "CSM"."CNOR_BU_CODE" AS "Consignor_BU_Code",
       "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
       "SHP"."SHP_ID" AS "Shipment_Id",
       "CSM"."CNEE_BU_TYPE" AS "Consignee_BU_Type",
       SUM("CSM"."TOT_NET_VOL" / 1000) AS "Total_Net_Volume",
       "SHP"."FIRST_DEP_EST_DTIME" AS "First_Estimated_Departure_Date_Time",
       "SHP"."FIRST_DEP_ACT_DTIME" AS "First_Actual_Departure_Date_Time",
       SUM("CSM"."TOT_ORDERED_VOL") AS "Total_Ordered_Volume",
       SUM("CSM"."TOT_ORDERED_VOL") AS "Total_Ordered_Volume1"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
WHERE "CSM"."CNOR_BU_CODE" IN ('390')
  AND "CSM"."CNEE_BU_TYPE" IN ('STO',
                               'CDC')
  AND "SHP"."FIRST_DEP_EST_DTIME" BETWEEN TIMESTAMP '2025-03-24 00:00:00+00:00' AND TIMESTAMP '2025-03-24 23:59:59.999000000+00:00'
GROUP BY "CSM"."CNOR_BU_CODE",
         "CSM"."CNEE_BU_CODE",
         "SHP"."SHP_ID",
         "CSM"."CNEE_BU_TYPE",
         "SHP"."FIRST_DEP_EST_DTIME",
         "SHP"."FIRST_DEP_ACT_DTIME"