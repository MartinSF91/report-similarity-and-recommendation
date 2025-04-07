/* user=Piratla Manikanta reportPath= report= queryName=Query1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=4sv8894jj4M8MsvsGh22yGj8sljqhGj8984qhl8v */
SELECT TRUNC(cast("SHP"."CREATE_TIMESTAMP" AS DATE)) AS "Creation_Date_Time",
       "SHP"."EQUIP_ISO_CODE" AS "Equipment_ISO_Code",
       "SHP"."SHP_ID" AS "Shipment_Id",
       "SHP"."EQUIP_TYPE_CODE" AS "Equipment_Type_Code",
       "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
       "SHP"."FIRST_STOP_BU_CODE" AS "First_Stop_Address_BU_Code",
       "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
       "SHP"."LAST_MEANS_OF_TRPT" AS "Last_Means_Of_Transport",
       "SHP"."SERV_PROV_BU_CODE" AS "Service_Provider_BU_Code",
       "SHP"."SERV_PROV_NAME" AS "Service_Provider_Name",
       "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" AS "Distribution_Order_End_Receiver_BU_Type",
       "CSM"."CSM_ID" AS "Consignment_Id",
       "CSM"."CNEE" AS "Consignee",
       "CSM_LINE"."ITEM_NO" AS "Item_Number",
       "CSM_LINE"."ITEM_NAME" AS "Item_Name",
       CASE
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 900
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 600
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H1'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1000
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 600
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H2'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 900 THEN 'H3'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H4'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E8'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E0'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2200 THEN 'E1'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E4'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E2'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E3'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E5'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E6'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1300
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E7'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1600
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E9'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 25000 THEN 'E5'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2000
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I8'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I2'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I0'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2200 THEN 'I1'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I3'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'I5'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I4'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'I6'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1300
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I7'
           WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 3000
                AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1900
                AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 3000 THEN 'I9'
           ELSE '?'
       END AS "PalClass",
       MIN("SHP"."EQUIP_ISO_CODE") AS "Count_distinct_Equipment_ISO_Code_",
       "SHP"."LAST_MEANS_OF_TRPT" AS "Last_Means_Of_Transport1",
       "SHP_EV_68_3_H_MSG"."MSG_POSITION" AS "Message_Position",
       "SHP_EV_68_3_H_MSG"."MSG_TXT" AS "Message_Text",
       CASE
           WHEN "SHP"."SHP_TYPE" = 'TRANSPORT'
                AND "SHP_EV_68_3_H_MSG"."MSG_POSITION" = '1' THEN "SHP_EV_68_3_H_MSG"."MSG_TXT"
           ELSE NULL
       END AS "FreeText",
       CASE
           WHEN "SHP"."SHP_TYPE" = 'TRANSPORT'
                AND "SHP_EV_68_3_H_MSG"."MSG_POSITION" = '2' THEN "SHP_EV_68_3_H_MSG"."MSG_TXT"
           ELSE NULL
       END AS "ETA",
       "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" AS "Pallet_Width__mm_",
       "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" AS "Pallet_Height__mm_",
       "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" AS "Pallet_Length__mm_",
       "CSM"."TOT_DSP_PACK_NOF" AS "Total_Dispatched_Number_Of_Packages",
       "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type"
FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_LINE" "CSM_LINE" ON "CSM_LINE"."CSM_NO" = "CSM"."CSM_NO"
AND "CSM_LINE"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_LINE"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_LINE"."LATEST_UPDATE_TIMESTAMP" = "CSM"."LATEST_UPDATE_TIMESTAMP"
LEFT OUTER JOIN "ODR_COMMON_PUB"."ITEM_SUP_ATTRIBUTE" "ITEM_SUP_ATTRIBUTE" ON "ITEM_SUP_ATTRIBUTE"."ITEM_NO" = "CSM_LINE"."ITEM_NO"
AND "ITEM_SUP_ATTRIBUTE"."BU_CODE" = "CSM_LINE"."ITEM_SUP_BU_CODE"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP_EV_68_3_H_MSG" "SHP_EV_68_3_H_MSG"
INNER JOIN "ODR_DELIVERY_PUB"."SHP_EV" "SHP_EV" ON "SHP_EV_68_3_H_MSG"."SHP_CRE_BU_CODE" = "SHP_EV"."SHP_CRE_BU_CODE"
AND "SHP_EV_68_3_H_MSG"."SHP_CRE_BU_TYPE" = "SHP_EV"."SHP_CRE_BU_TYPE"
AND "SHP_EV_68_3_H_MSG"."SHP_NO" = "SHP_EV"."SHP_NO"
AND "SHP_EV_68_3_H_MSG"."LATEST_UPDATE_TIMESTAMP" = "SHP_EV"."LATEST_UPDATE_TIMESTAMP"
AND "SHP_EV_68_3_H_MSG"."TRANSACTION_NO" = "SHP_EV"."TRANSACTION_NO" ON "SHP_EV"."SHP_NO" = "SHP"."SHP_NO"
AND "SHP_EV"."LATEST_UPDATE_TIMESTAMP" = "SHP"."LATEST_UPDATE_TIMESTAMP"
AND "SHP_EV"."SHP_CRE_BU_CODE" = "SHP"."SHP_CRE_BU_CODE"
AND "SHP_EV"."SHP_CRE_BU_TYPE" = "SHP"."SHP_CRE_BU_TYPE"
WHERE TRUNC(cast("SHP"."CREATE_TIMESTAMP" AS DATE)) = :Prm_DateCreate:
  AND "CSM"."CNEE_BU_CODE" = :Prm_CneeCode:
  AND "SHP"."SHP_TYPE" = 'TRANSPORT'
  AND "SHP"."FIRST_STOP_BU_CODE" IN ('DEBRV',
                                     'DEHAM',
                                     'NLRTM',
                                     'DEWVN')
  AND NOT ("SHP"."LATEST_MAJOR_EV" IN ('100',
                                       '900'))
  AND "SHP"."LAST_STOP_BU_TYPE" IN ('IMT',
                                    'EQS')
  AND "SHP_EV_68_3_H_MSG"."MSG_POSITION" IN ('1',
                                             '2')
GROUP BY TRUNC(cast("SHP"."CREATE_TIMESTAMP" AS DATE)),
         "SHP"."EQUIP_ISO_CODE",
         "SHP"."SHP_ID",
         "SHP"."EQUIP_TYPE_CODE",
         "CSM"."CNEE_BU_CODE",
         "SHP"."FIRST_STOP_BU_CODE",
         "SHP"."LAST_STOP_BU_CODE",
         "SHP"."LAST_MEANS_OF_TRPT",
         "SHP"."SERV_PROV_BU_CODE",
         "SHP"."SERV_PROV_NAME",
         "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE",
         "CSM"."CSM_ID",
         "CSM"."CNEE",
         "CSM_LINE"."ITEM_NO",
         "CSM_LINE"."ITEM_NAME",
         CASE
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 600
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H1'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 600
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H2'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 900 THEN 'H3'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'H4'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E8'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E0'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2200 THEN 'E1'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1400
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E4'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E2'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E3'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E5'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E6'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1300
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'E7'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1600
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'E9'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 1450
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 25000 THEN 'E5'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I8'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 800
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I2'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I0'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2200 THEN 'I1'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I3'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 950
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'I5'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I4'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 2500 THEN 'I6'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 2200
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1300
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 1200 THEN 'I7'
             WHEN "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL" <= 3000
                  AND "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO" <= 1900
                  AND "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO" <= 3000 THEN 'I9'
             ELSE '?'
         END,
         "SHP_EV_68_3_H_MSG"."MSG_POSITION",
         "SHP_EV_68_3_H_MSG"."MSG_TXT",
         CASE
             WHEN "SHP"."SHP_TYPE" = 'TRANSPORT'
                  AND "SHP_EV_68_3_H_MSG"."MSG_POSITION" = '1' THEN "SHP_EV_68_3_H_MSG"."MSG_TXT"
             ELSE NULL
         END,
         CASE
             WHEN "SHP"."SHP_TYPE" = 'TRANSPORT'
                  AND "SHP_EV_68_3_H_MSG"."MSG_POSITION" = '2' THEN "SHP_EV_68_3_H_MSG"."MSG_TXT"
             ELSE NULL
         END,
         "ITEM_SUP_ATTRIBUTE"."UL_WID_GRO",
         "ITEM_SUP_ATTRIBUTE"."UL_HEI_GRO",
         "ITEM_SUP_ATTRIBUTE"."UL_LEN_PAL",
         "CSM"."TOT_DSP_PACK_NOF",
         "SHP"."LAST_STOP_BU_TYPE"