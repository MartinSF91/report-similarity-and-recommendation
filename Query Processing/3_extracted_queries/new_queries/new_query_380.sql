/* user=Piratla Manikanta reportPath= report= queryName=Abfrage1 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=vvvdq2My4hvMl4ddw2sq9vv8ldshwvsvvv42w9Gv */ SELECT "TQ0_Abfrage1"."Consignment_Creator_BU_Type" AS "Consignment_Creator_BU_Type",
       "TQ0_Abfrage1"."Consignee_Country_Code" AS "Consignee_Country_Code",
       "TQ0_Abfrage1"."Consignee_Name" AS "Consignee_Name",
       "TQ0_Abfrage1"."Shipment_Number" AS "Shipment_Number",
       "TQ0_Abfrage1"."Unit_Load_SSCC" AS "Unit_Load_SSCC",
       "TQ0_Abfrage1"."Consignment_Id" AS "Consignment_Id",
       "TQ0_Abfrage1"."Item_Type" AS "Item_Type",
       SUM("TQ0_Abfrage1"."LINE_TOT_DSP_NUM_OF_PACK") AS "Total_Line_Dispatched_Number_Of_Packages1",
       "TQ0_Abfrage1"."Stop_BU_Code" AS "Stop_BU_Code",
       CASE
           WHEN COUNT(DISTINCT CASE
                                   WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                        OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                        OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                   ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                               END) = '1'
                AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART' THEN 'Full Pallet'
           WHEN COUNT(DISTINCT CASE
                                   WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                        OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                        OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                   ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                               END) >= '1'
                AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                AND MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL THEN 'Full Pallet'
           WHEN COUNT(DISTINCT CASE
                                   WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                        OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                        OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                   ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                               END) > '1'
                AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                AND NOT (MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL) THEN 'Mix Pallet'
           ELSE 'Undefined'
       END AS "Type",
       CASE
           WHEN CASE
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) = '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART' THEN 'Full Pallet'
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) >= '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                         AND MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL THEN 'Full Pallet'
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) > '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                         AND NOT (MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL) THEN 'Mix Pallet'
                    ELSE 'Undefined'
                END = 'Full Pallet' THEN 1
           ELSE 0
       END AS "Full0",
       CASE
           WHEN CASE
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) = '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART' THEN 'Full Pallet'
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) >= '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                         AND MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL THEN 'Full Pallet'
                    WHEN COUNT(DISTINCT CASE
                                            WHEN "TQ0_Abfrage1"."ITEM_NO" IS NULL
                                                 OR "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" IS NULL
                                                 OR "TQ0_Abfrage1"."PROD_WEEK" IS NULL THEN NULL
                                            ELSE "TQ0_Abfrage1"."ITEM_NO" || "TQ0_Abfrage1"."ITEM_SUP_BU_CODE" || "TQ0_Abfrage1"."PROD_WEEK"
                                        END) > '1'
                         AND MIN("TQ0_Abfrage1"."ITEM_TYPE22") = 'ART'
                         AND NOT (MIN("TQ0_Abfrage1"."Unit_Load_SSCC") IS NULL) THEN 'Mix Pallet'
                    ELSE 'Undefined'
                END = 'Mix Pallet' THEN 1
           ELSE 0
       END AS "Mix",
       SUM("TQ0_Abfrage1"."Full_Pallet") AS "Full_Pallet",
       SUM("TQ0_Abfrage1"."Mix_Pallet") AS "Mix_Pallet",
       "TQ0_Abfrage1"."Consignee_BU_Code" AS "Consignee_BU_Code",
       "TQ0_Abfrage1"."Consignee_BU_Type" AS "Consignee_BU_Type",
       "TQ0_Abfrage1"."Consignor_BU_Code" AS "Consignor_BU_Code",
       "TQ0_Abfrage1"."Stop_BU_Code" AS "BU_Code",
       "TQ0_Abfrage1"."Consignment_Latest_Major_Event" AS "Consignment_Latest_Major_Event",
       "TQ0_Abfrage1"."Event_Name" AS "Event_Name",
       "TQ0_Abfrage1"."Actual_Arrival_Date_Time" AS "Actual_Arrival_Date_Time",
       "TQ0_Abfrage1"."Last_Planned_Arrival_Date_Time" AS "Last_Planned_Arrival_Date_Time"
FROM "TQ0_Abfrage1"
GROUP BY "TQ0_Abfrage1"."Consignment_Creator_BU_Type",
         "TQ0_Abfrage1"."Consignee_Country_Code",
         "TQ0_Abfrage1"."Consignee_Name",
         "TQ0_Abfrage1"."Shipment_Number",
         "TQ0_Abfrage1"."Unit_Load_SSCC",
         "TQ0_Abfrage1"."Consignment_Id",
         "TQ0_Abfrage1"."Item_Type",
         "TQ0_Abfrage1"."Stop_BU_Code",
         "TQ0_Abfrage1"."Consignee_BU_Code",
         "TQ0_Abfrage1"."Consignee_BU_Type",
         "TQ0_Abfrage1"."Consignor_BU_Code",
         "TQ0_Abfrage1"."Consignment_Latest_Major_Event",
         "TQ0_Abfrage1"."Event_Name",
         "TQ0_Abfrage1"."Actual_Arrival_Date_Time",
         "TQ0_Abfrage1"."Last_Planned_Arrival_Date_Time"