/* user=Vibhavari Bharat Nandre reportPath= report= queryName=ITMReport REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=qq89ss2sv2h88w2hdsvsMjdCdMMhyqqjwM9qlqhj */
SELECT "Gemini"."CSM",
       "Gemini"."IN_STATUS"
FROM
  (SELECT DISTINCT "SQL1"."CSM" AS "CSM",
                   "SQL1"."CSM_STAT" AS "CSM_STAT",
                   "SQL1"."IN_STATUS" AS "IN_STATUS"
   FROM
     (SELECT DISTINCT AL1.BU_CODE_DT||'-'||AL1.CSM_NO csm,
                      AL1.CSM_STAT,
                      AL1.IN_STATUS
      FROM GEMINI.IN_CONSIGNMENT AL1
      WHERE AL1.BU_TYPE_DT='DT'
        AND AL1.IN_STATUS='70'
        AND AL1.CLOSED_DATE IS NOT NULL
        AND AL1.CLOSED_DATE >= (sysdate - .1)) "SQL1") "Gemini" /* user=Vibhavari Bharat Nandre reportPath= report= queryName=ITMReport REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=qq89ss2sv2h88w2hdsvsMjdCdMMhyqqjwM9qlqhj */
SELECT "ITM"."csm",
       "ITM"."Shipment_Creator_BU_Code",
       "ITM"."Shipment_Creator_BU_Type",
       "ITM"."Shipment_Number",
       "ITM"."Shipment_Id",
       "ITM"."First_Planned_Departure_Date_Time",
       "ITM"."First_Actual_Departure_Date_Time",
       "ITM"."Last_Planned_Arrival_Date_Time",
       "ITM"."First_Actual_Arrival_Date_Time",
       "ITM"."Consignee_BU_Code",
       "ITM"."Consignee_BU_Type",
       "ITM"."Item_Number",
       SYSDATE,
       CASE
           WHEN "C2" IS NULL
                OR "C3" IS NULL THEN NULL
           ELSE "C2" || "C3"
       END,
       "ITM"."First_Stop_Address_BU_Code",
       "ITM"."First_Stop_Address_BU_Type",
       "ITM"."Last_Stop_Address_BU_Code",
       "ITM"."Last_Stop_Address_BU_Type",
       CASE
           WHEN "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                      'CDC') THEN 'DC/CDC'
           ELSE "ITM"."Last_Stop_Address_BU_Type"
       END,
       CASE
           WHEN "ITM"."Equipment_ISO_Code" IS NULL THEN "ITM"."Equipment_Generic_Code"
           ELSE "ITM"."Equipment_ISO_Code"
       END,
       CASE
           WHEN "ITM"."Item_Number" IS NULL THEN NULL
           ELSE 'A' || "ITM"."Item_Number"
       END,
       CASE
           WHEN "ITM"."Consignee_BU_Code" IS NULL THEN NULL
           ELSE 'A' || "ITM"."Consignee_BU_Code"
       END,
       "ITM"."Supplier_BU_Code",
       CASE
           WHEN "ITM"."Item_Number" IS NULL
                OR "ITM"."Supplier_BU_Code" IS NULL
                OR "ITM"."Consignee_BU_Code" IS NULL THEN NULL
           ELSE "ITM"."Item_Number" || '-' || "ITM"."Supplier_BU_Code" || '-' || "ITM"."Consignee_BU_Code"
       END,
       "ITM"."First_Stop_Country_Code",
       "ITM"."Last_Stop_Country_Code",
       CASE
           WHEN NOT ("ITM"."First_Stop_Country_Code" IN ('CA',
                                                         'US',
                                                         'MX'))
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('IMT',
                                                          'PRT')
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'On the Water'
           WHEN NOT ("ITM"."First_Stop_Country_Code" IN ('CA',
                                                         'US',
                                                         'MX'))
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('IMT',
                                                          'PRT')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 'At the Port'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL THEN 'Booked: Port to DC/CDC'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL THEN 'Booked: Port to EQS/EQL'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'SUP')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Dispatching to EQS/EQL'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'SUP')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 'At EQS/EQL'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Dispatching From Port'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Booked: EQS/EQL to CD/CDC'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Dispatching From EQS/EQL'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 'On Site: Import'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('SUP')
                AND "ITM"."First_Stop_Country_Code" IN ('CA',
                                                        'US',
                                                        'MX')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Dispatching: Domestic'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('SUP')
                AND "ITM"."First_Stop_Country_Code" IN ('CA',
                                                        'US',
                                                        'MX')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 'On Site: Domestic'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('DT',
                                                       'CDC')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 'Dispatching from DC/CDC'
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('DT',
                                                       'CDC')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 'On Site: DC/CDC'
           ELSE 'Other'
       END,
       CASE
           WHEN NOT ("ITM"."First_Stop_Country_Code" IN ('CA',
                                                         'US',
                                                         'MX'))
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('IMT',
                                                          'PRT')
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 1
           WHEN NOT ("ITM"."First_Stop_Country_Code" IN ('CA',
                                                         'US',
                                                         'MX'))
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('IMT',
                                                          'PRT')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 2
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL THEN 3
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL THEN 4
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'SUP')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 5
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'SUP')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('EQS',
                                                          'EQL')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 6
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 7
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."First_Actual_Departure_Date_Time" IS NULL
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 8
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 9
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('IMT',
                                                       'PRT',
                                                       'EQS',
                                                       'EQL')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 10
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('SUP')
                AND "ITM"."First_Stop_Country_Code" IN ('CA',
                                                        'US',
                                                        'MX')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."First_Actual_Departure_Date_Time" IS NULL)
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 11
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('SUP')
                AND "ITM"."First_Stop_Country_Code" IN ('CA',
                                                        'US',
                                                        'MX')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 12
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('DT',
                                                       'CDC')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND "ITM"."Last_Actual_Arrival_Date_Time" IS NULL THEN 13
           WHEN "ITM"."First_Stop_Address_BU_Type" IN ('DT',
                                                       'CDC')
                AND "ITM"."Last_Stop_Address_BU_Type" IN ('DT',
                                                          'CDC')
                AND NOT ("ITM"."Last_Actual_Arrival_Date_Time" IS NULL) THEN 14
           ELSE 0
       END,
       "ITM"."Distribution_Order_End_Receiver_BU_Type",
       "ITM"."Distribution_Order_End_Receiver_BU_Code",
       "ITM"."Transit_Line",
       "ITM"."TransitCount",
       "ITM"."Last_Estimated_Arrival_Date_Time",
       "ITM"."Last_Actual_Arrival_Date_Time",
       "ITM"."First_Estimated_Arrival_Date_Time",
       "ITM"."Consignment_Number",
       CASE
           WHEN "ITM"."Shipment_Id" IS NULL
                OR "ITM"."Consignee_BU_Code" IS NULL THEN NULL
           ELSE "ITM"."Shipment_Id" || "ITM"."Consignee_BU_Code"
       END,
       "ITM"."Item_Quantity_Dispatched",
       "ITM"."Total_Net_Volume" / 1000,
       "ITM"."Total_Gross_Volume" / 1000,
       "ITM"."Total_Line_Dispatched_Gross_Volume" / 1000,
       "ITM"."Total_Line_Dispatched_Net_Volume" / 1000
FROM
  (SELECT "SHP"."SHP_CRE_BU_CODE" AS "Shipment_Creator_BU_Code",
          "SHP"."SHP_CRE_BU_TYPE" AS "Shipment_Creator_BU_Type",
          "SHP"."SHP_ID" AS "Shipment_Id",
          "SHP"."SHP_NO" AS "Shipment_Number",
          "SHP"."FIRST_DEP_PLAN_DTIME" AS "First_Planned_Departure_Date_Time",
          "SHP"."FIRST_DEP_ACT_DTIME" AS "First_Actual_Departure_Date_Time",
          "SHP"."FIRST_ARR_ACT_DTIME" AS "First_Actual_Arrival_Date_Time",
          "SHP"."LAST_ARR_PLAN_DTIME" AS "Last_Planned_Arrival_Date_Time",
          "SHP"."EQUIP_ISO_CODE" AS "Equipment_ISO_Code",
          "SHP"."EQUIP_GEN_CODE" AS "Equipment_Generic_Code",
          "CSM"."CNEE_BU_CODE" AS "Consignee_BU_Code",
          "CSM"."CNEE_BU_TYPE" AS "Consignee_BU_Type",
          "CSM"."LATEST_MAJOR_REC24_CODE" AS "Consignment_Latest_Major_Event_Code",
          nvl("SHP"."EQUIP_ISO_CODE", "SHP"."EQUIP_GEN_CODE") AS "Equipment_Code",
          "CSM"."CSM_NO" AS "Consignment_Number",
          "CSM_LINE"."ITEM_NO" AS "Item_Number",
          SUM("CSM_EV_48_1_L"."LOAD_QTY") AS "Item_Quantity_Dispatched",
          CASE
              WHEN "CSM"."CNEE_BU_CODE" IS NULL
                   OR "CSM"."CSM_NO" IS NULL THEN NULL
              ELSE "CSM"."CNEE_BU_CODE" || '-' || "CSM"."CSM_NO"
          END AS "csm",
          "SHP"."FIRST_STOP_BU_CODE" AS "First_Stop_Address_BU_Code",
          "SHP"."FIRST_STOP_BU_TYPE" AS "First_Stop_Address_BU_Type",
          "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
          "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
          SUM("CSM"."TOT_NET_VOL" / 1000) AS "Total_Net_Volume",
          SUM("CSM"."TOT_GROSS_VOL" / 1000) AS "Total_Gross_Volume",
          SUM("CSM_LINE"."LINE_TOT_DSP_GROSS_VOL") AS "Total_Line_Dispatched_Gross_Volume",
          SUM("CSM_LINE"."LINE_TOT_DSP_NET_VOL") AS "Total_Line_Dispatched_Net_Volume",
          "ITEM_SUP_ATTRIBUTE"."BU_CODE" AS "Supplier_BU_Code",
          "SHP"."FIRST_STOP_CTY" AS "First_Stop_Country_Code",
          "SHP"."LAST_STOP_CTY" AS "Last_Stop_Country_Code",
          "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE" AS "Distribution_Order_End_Receiver_BU_Type",
          "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" AS "Distribution_Order_End_Receiver_BU_Code",
          CASE
              WHEN "CSM"."CNEE_BU_CODE" = "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" THEN 'N'
              ELSE 'Y'
          END AS "Transit_Line",
          CASE
              WHEN "CSM"."CNEE_BU_CODE" = "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" THEN 0
              ELSE 1
          END AS "TransitCount",
          "SHP"."LAST_ARR_EST_DTIME" AS "Last_Estimated_Arrival_Date_Time",
          "SHP"."LAST_ARR_ACT_DTIME" AS "Last_Actual_Arrival_Date_Time",
          "SHP"."FIRST_ARR_EST_DTIME" AS "First_Estimated_Arrival_Date_Time",
          TO_CHAR(SYSDATE, 'YYYY') AS "C2",
          TO_CHAR(SYSDATE + 1, 'IW') AS "C3"
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
   LEFT OUTER JOIN "ODR_COMMON_PUB"."ITEM_SUP_ATTRIBUTE" "ITEM_SUP_ATTRIBUTE" ON "ITEM_SUP_ATTRIBUTE"."ITEM_NO" = "CSM_LINE"."ITEM_NO"
   AND "ITEM_SUP_ATTRIBUTE"."BU_CODE" = "CSM_LINE"."ITEM_SUP_BU_CODE"
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
   WHERE "CSM"."CNEE_BU_TYPE" = 'CDC'
     AND "SHP_EV"."IS_LATEST_EVENT" = 1
     AND "SHP"."LAST_STOP_CTY" IN ('US',
                                   'CA')
     AND "CSM"."CNOR_BU_TYPE" IN ('DT',
                                  'SUP')
     AND "CSM"."LATEST_MAJOR_REC24_CODE" <> '72'
     AND "SHP"."LATEST_MAJOR_EV" <> '111'
     AND "CSM_LINE"."ITEM_TYPE" = 'ART'
     AND NOT ("CSM_EV_48_1_L"."LOAD_QTY" IS NULL)
     AND ("SHP"."FIRST_STOP_BU_TYPE" <> 'SUP'
          OR NOT ("SHP"."FIRST_DEP_ACT_DTIME" IS NULL))
     AND (NOT ("SHP"."LAST_STOP_BU_TYPE" IN ('PRT',
                                             'IMT'))
          OR NOT ("SHP"."FIRST_DEP_ACT_DTIME" IS NULL))
   GROUP BY "SHP"."SHP_CRE_BU_CODE",
            "SHP"."SHP_CRE_BU_TYPE",
            "SHP"."SHP_ID",
            "SHP"."SHP_NO",
            "SHP"."FIRST_DEP_PLAN_DTIME",
            "SHP"."FIRST_DEP_ACT_DTIME",
            "SHP"."FIRST_ARR_ACT_DTIME",
            "SHP"."LAST_ARR_PLAN_DTIME",
            "SHP"."EQUIP_ISO_CODE",
            "SHP"."EQUIP_GEN_CODE",
            "CSM"."CNEE_BU_CODE",
            "CSM"."CNEE_BU_TYPE",
            "CSM"."LATEST_MAJOR_REC24_CODE",
            nvl("SHP"."EQUIP_ISO_CODE", "SHP"."EQUIP_GEN_CODE"),
            "CSM"."CSM_NO",
            "CSM_LINE"."ITEM_NO",
            CASE
                WHEN "CSM"."CNEE_BU_CODE" IS NULL
                     OR "CSM"."CSM_NO" IS NULL THEN NULL
                ELSE "CSM"."CNEE_BU_CODE" || '-' || "CSM"."CSM_NO"
            END,
            "SHP"."FIRST_STOP_BU_CODE",
            "SHP"."FIRST_STOP_BU_TYPE",
            "SHP"."LAST_STOP_BU_CODE",
            "SHP"."LAST_STOP_BU_TYPE",
            "ITEM_SUP_ATTRIBUTE"."BU_CODE",
            "SHP"."FIRST_STOP_CTY",
            "SHP"."LAST_STOP_CTY",
            "CSM_LINE"."DIST_ORD_END_REC_BU_TYPE",
            "CSM_LINE"."DIST_ORD_END_REC_BU_CODE",
            CASE
                WHEN "CSM"."CNEE_BU_CODE" = "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" THEN 'N'
                ELSE 'Y'
            END,
            CASE
                WHEN "CSM"."CNEE_BU_CODE" = "CSM_LINE"."DIST_ORD_END_REC_BU_CODE" THEN 0
                ELSE 1
            END,
            "SHP"."LAST_ARR_EST_DTIME",
            "SHP"."LAST_ARR_ACT_DTIME",
            "SHP"."FIRST_ARR_EST_DTIME") "ITM"