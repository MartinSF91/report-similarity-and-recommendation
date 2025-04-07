/* user=Piratla Manikanta reportPath= report= queryName=Requete3 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=GqGwds84h428ywClvlqddshjCwhwqyyy28q2jjhl */
SELECT DISTINCT "SHP"."SERV_PROV_NAME" AS "Shp_CarName",
                "SHP"."EQUIP_ISO_CODE" AS "LuTr_Luid",
                "SHP"."LAST_MEANS_OF_TRPT" AS "LuTrL_TrpUnitId",
                "CSM"."CSM_NO" AS "Consignment_Number",
                "CSM"."CNOR_BU_CODE" AS "Consignor_BU_Code",
                trunc("CSM"."ARR_EST_DTIME") AS "Estimated_Arrival_Date_Time",
                "SHP"."PLANNER_USER" AS "Planner_User",
                "SHP"."LAST_ARR_EST_DTIME" AS "ShpRou_RecPldArrDate",
                "CSM"."CNOR_CTY" AS "ShpRou_StartCty",
                "CSM_SHP"."BOL_NO" AS "Bill_Of_Lading_Number",
                "SHP"."EQUIP_TYPE_CODE" AS "LuTr_LutCode",
                "SHP"."POD_BU_CODE" AS "Port_Of_Discharge_BU_Code",
                replace("SHP"."SHP_ID", '-', '') AS "Shipment_Id",
                "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
                "SHP"."POL_BU_CODE" AS "Port_Of_Loading_BU_Code"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
WHERE "CSM"."CNEE_CTY" IN ('FR')
  AND "SHP"."POD_BU_TYPE" IN ('PRT',
                              'IMT')
  AND "CSM"."CNEE_BU_CODE" IN ('027',
                               '247',
                               '005',
                               '043',
                               '418')
  AND NOT ("SHP"."EQUIP_ISO_CODE" IS NULL)
  AND "SHP"."LAST_ARR_EST_DTIME" >= TRUNC(CURRENT_DATE) - 45
  AND "SHP"."LAST_ARR_EST_DTIME" <= TRUNC(CURRENT_DATE) + 45