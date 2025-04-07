/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Combi REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=wl92lGy98vGddCv8hswCdqjMjhy8qvhhqqyCvvqv */
SELECT "GTS_Inb_Lines"."CSM",
       "GTS_Inb_Lines"."SYSDATE",
       "GTS_Inb_Lines"."RCTLIN_DATE_UNL",
       "GTS_Inb_Lines"."RCTLIN_DATE_COMPL",
       "GTS_Inb_Lines"."SHP",
       "GTS_Inb_Lines"."TRPT_ID",
       "GTS_Inb_Lines"."RCT_NO",
       "GTS_Inb_Lines"."ART_NO",
       "GTS_Inb_Lines"."SUP_NO",
       "GTS_Inb_Lines"."ART_QTY_PALL",
       "GTS_Inb_Lines"."ART_QTY_NOT",
       "GTS_Inb_Lines"."ART_QTY_DEL",
       "GTS_Inb_Lines"."ART_QTY_UNL",
       "GTS_Inb_Lines"."ART_QTY_COMPL",
       "GTS_Inb_Lines"."ART_QTY_DIF1",
       "GTS_Inb_Lines"."ART_QTY_DIF2",
       "GTS_Inb_Lines"."RCTLIN_CODE_DIF1",
       "GTS_Inb_Lines"."RCTLIN_CODE_DIF2",
       "GTS_Inb_Lines"."BU_CODE_RCV",
       "GTS_Inb_Lines"."BU_TYPE_RCV",
       "GTS_Inb_Lines"."LINE_TYPE",
       "GTS_Inb_Lines"."CTY_CODE_ORIG",
       "GTS_Inb_Lines"."ART_WEI_NET",
       "GTS_Inb_Lines"."ART_WEI_GRO",
       "GTS_Inb_Lines"."ART_VOL_GRO",
       "GTS_Inb_Lines"."PLT_TYPE"
FROM
  (SELECT DISTINCT "SQL1"."SYSDATE" AS "SYSDATE",
                   "SQL1"."RCTLIN_DATE_UNL" AS "RCTLIN_DATE_UNL",
                   "SQL1"."RCTLIN_DATE_COMPL" AS "RCTLIN_DATE_COMPL",
                   "SQL1"."SHP" AS "SHP",
                   "SQL1"."CSM" AS "CSM",
                   "SQL1"."TRPT_ID" AS "TRPT_ID",
                   "SQL1"."RCT_NO" AS "RCT_NO",
                   "SQL1"."ART_NO" AS "ART_NO",
                   "SQL1"."SUP_NO" AS "SUP_NO",
                   "SQL1"."ART_QTY_PALL" AS "ART_QTY_PALL",
                   "SQL1"."ART_QTY_NOT" AS "ART_QTY_NOT",
                   "SQL1"."ART_QTY_DEL" AS "ART_QTY_DEL",
                   "SQL1"."ART_QTY_UNL" AS "ART_QTY_UNL",
                   "SQL1"."ART_QTY_COMPL" AS "ART_QTY_COMPL",
                   "SQL1"."ART_QTY_DIF1" AS "ART_QTY_DIF1",
                   "SQL1"."ART_QTY_DIF2" AS "ART_QTY_DIF2",
                   "SQL1"."RCTLIN_CODE_DIF1" AS "RCTLIN_CODE_DIF1",
                   "SQL1"."RCTLIN_CODE_DIF2" AS "RCTLIN_CODE_DIF2",
                   "SQL1"."BU_CODE_RCV" AS "BU_CODE_RCV",
                   "SQL1"."BU_TYPE_RCV" AS "BU_TYPE_RCV",
                   "SQL1"."LINE_TYPE" AS "LINE_TYPE",
                   "SQL1"."CTY_CODE_ORIG" AS "CTY_CODE_ORIG",
                   "SQL1"."ART_WEI_NET" AS "ART_WEI_NET",
                   "SQL1"."ART_WEI_GRO" AS "ART_WEI_GRO",
                   "SQL1"."ART_VOL_GRO" AS "ART_VOL_GRO",
                   "SQL1"."PLT_TYPE" AS "PLT_TYPE"
   FROM
     (SELECT sysdate,
             csmd.RCTLIN_DATE_UNL,
             csmd.RCTLIN_DATE_COMPL,
             CASE WHEN(TRIM(csm.BU_CODE_CRE_SHP) || TRIM(csm.BU_TYPE_CRE_SHP) || TRIM(csm.SHP_NO) IS NULL) THEN csm.TRPT_ID
                 ELSE (TRIM(csm.BU_CODE_CRE_SHP) || TRIM(csm.BU_TYPE_CRE_SHP) || TRIM(csm.SHP_NO))
             END shp,
             TRIM(csm.BU_CODE_CRE) || TRIM(csm.BU_TYPE_CRE) || TRIM(csm.CSM_NO) csm,
             CASE WHEN(TRIM(csm.TRPT_ID) IS NULL) THEN (TRIM(csm.BU_CODE_CRE_SHP) || TRIM(csm.BU_TYPE_CRE_SHP) || TRIM(csm.SHP_NO))
                 ELSE csm.TRPT_ID
             END TRPT_ID,
             csml.RCT_NO,
             csml.ART_NO,
             csml.SUP_NO,
             art.ART_QTY_PALL,
             csml.ART_QTY_NOT,
             csml.ART_QTY_DEL,
             csml.ART_QTY_UNL,
             csml.ART_QTY_COMPL,
             csml.ART_QTY_DIF1,
             csml.ART_QTY_DIF2,
             csml.RCTLIN_CODE_DIF1,
             csml.RCTLIN_CODE_DIF2,
             csml.BU_CODE_RCV,
             csml.BU_TYPE_RCV,
             csml.line_type,
             art.CTY_CODE_ORIG,
             art.ART_WEI_NET,
             art.ART_WEI_GRO,
             CASE WHEN(TRIM(art.ART_VOL_GRO) >= 0.000001) THEN (TRIM(art.ART_VOL_GRO)/1000)
                 ELSE 0
             END ART_VOL_GRO,
             CASE WHEN(TRIM(art.CARR_TYPE) = 'I') THEN 'Ikea' WHEN(TRIM(art.CARR_TYPE) = 'H') THEN 'Half' WHEN(TRIM(art.CARR_TYPE) = 'E') THEN 'Euro'
                 ELSE '0'
             END plt_type
      FROM
        (SELECT RCT_NO,
                ART_NO,
                SUP_NO,
                ART_QTY_PALL,
                SUM(ART_QTY_NOT) ART_QTY_NOT,
                SUM(ART_QTY_DEL) ART_QTY_DEL,
                SUM(ART_QTY_UNL) ART_QTY_UNL,
                SUM(ART_QTY_COMPL) ART_QTY_COMPL,
                SUM(ART_QTY_DIF1) ART_QTY_DIF1,
                SUM(ART_QTY_DIF2) ART_QTY_DIF2,
                RCTLIN_CODE_DIF1,
                RCTLIN_CODE_DIF2,
                BU_CODE_RCV,
                BU_TYPE_RCV,
                CASE WHEN(TRIM(BU_CODE_RCV) = '001') THEN 'TR' WHEN(TRIM(BU_CODE_RCV) = '002') THEN 'DC' WHEN(TRIM(BU_CODE_RCV) BETWEEN '003' AND '999') THEN 'TR'
                    ELSE NULL
                END line_type
         FROM RECEIPTLINE_DETAIL_ALL
         WHERE TRIM(RCTLIN_STAT) = '4' --(Rec Status Filterd)

         GROUP BY RCT_NO,
                  ART_NO,
                  SUP_NO,
                  ART_QTY_PALL,
                  RCTLIN_CODE_DIF1,
                  RCTLIN_CODE_DIF2,
                  BU_CODE_RCV,
                  BU_TYPE_RCV,
                  CASE WHEN(TRIM(BU_CODE_RCV) = '001') THEN 'TR' WHEN(TRIM(BU_CODE_RCV) = '002') THEN 'DC' WHEN(TRIM(BU_CODE_RCV) BETWEEN '003' AND '999') THEN 'TR'
                      ELSE NULL
                  END) csml
      LEFT JOIN
        (SELECT RCT_NO,
                RCTLIN_DATE_UNL,
                MIN(RCTLIN_DATE_COMPL) RCTLIN_DATE_COMPL
         FROM RECEIPTLINE_ALL
         WHERE TRIM(RCTLIN_STAT) = '4'
         GROUP BY RCT_NO,
                  RCTLIN_DATE_UNL) csmd ON TRIM(csml.RCT_NO) = TRIM(csmd.RCT_NO) --(Rec Status Filterd)

      LEFT JOIN RECEIPT_ALL csm ON TRIM(csm.RCT_NO) = TRIM(csml.RCT_NO)
      LEFT JOIN ART_SUP art ON TRIM(art.ART_NO) = TRIM(csml.ART_NO)
      AND TRIM(art.SUP_NO) = TRIM(csml.SUP_NO)
      WHERE csmd.RCTLIN_DATE_COMPL >= sysdate - 365) "SQL1") "GTS_Inb_Lines" /* user=Vibhavari Bharat Nandre reportPath= report= queryName=Combi REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=wl92lGy98vGddCv8hswCdqjMjhy8qvhhqqyCvvqv */
SELECT DISTINCT "SUP_Ship"."Consignment_Number" AS "Consignment_Number",
                "SUP_Ship"."First_Stop_BU_Code" AS "First_Stop_BU_Code",
                "SUP_Ship"."Shipment_Id" AS "Shipment_Id",
                "CP_Ship"."First_Stop_BU_Code" AS "First_Stop_BU_Code1",
                "CP_Ship"."Shipment_Id" AS "Shipment_Id1"
FROM
  (SELECT DISTINCT CASE
                       WHEN TRIM(BOTH
                                 FROM "CSM"."CSM_CRE_BU_CODE") IS NULL
                            OR TRIM(BOTH
                                    FROM "CSM"."CSM_CRE_BU_TYPE") IS NULL
                            OR TRIM(BOTH
                                    FROM "CSM"."CSM_NO") IS NULL THEN NULL
                       ELSE TRIM(BOTH
                                 FROM "CSM"."CSM_CRE_BU_CODE") || TRIM(BOTH
                                                                       FROM "CSM"."CSM_CRE_BU_TYPE") || TRIM(BOTH
                                                                                                             FROM "CSM"."CSM_NO")
                   END AS "Consignment_Number",
                   "SHP"."SHP_ID" AS "Shipment_Id",
                   CASE
                       WHEN "SHP_FIRST_BU_ADDRESS"."CLU_CODE" IS NULL
                            OR "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" IS NULL
                            OR "SHP"."FIRST_STOP_BU_SEQ" IS NULL THEN NULL
                       ELSE "SHP_FIRST_BU_ADDRESS"."CLU_CODE" || '-' || "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" || '-' || "SHP"."FIRST_STOP_BU_SEQ"
                   END AS "First_Stop_BU_Code",
                   "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
                   "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
                   "SHP_FIRST_BU_ADDRESS"."SEQ_NO" AS "Last_Stop_BU_Sequence"
   FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
   LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
   AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
   AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
   LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
   AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
   AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
   LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "SHP_FIRST_BU_ADDRESS" ON "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" = "SHP"."FIRST_STOP_BU_TYPE"
   AND "SHP_FIRST_BU_ADDRESS"."CLU_CODE" = "SHP"."FIRST_STOP_BU_CODE"
   AND "SHP_FIRST_BU_ADDRESS"."SEQ_NO" = "SHP"."FIRST_STOP_BU_SEQ"
   WHERE TRIM(BOTH
              FROM "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE") = 'CP'
     AND "CSM"."ARR_ACT_DTIME" >= (TRUNC(CURRENT_DATE) + (INTERVAL '1' DAY * (-365)))) "CP_Ship"
INNER JOIN
  (SELECT DISTINCT CASE
                       WHEN TRIM(BOTH
                                 FROM "CSM"."CSM_CRE_BU_CODE") IS NULL
                            OR TRIM(BOTH
                                    FROM "CSM"."CSM_CRE_BU_TYPE") IS NULL
                            OR TRIM(BOTH
                                    FROM "CSM"."CSM_NO") IS NULL THEN NULL
                       ELSE TRIM(BOTH
                                 FROM "CSM"."CSM_CRE_BU_CODE") || TRIM(BOTH
                                                                       FROM "CSM"."CSM_CRE_BU_TYPE") || TRIM(BOTH
                                                                                                             FROM "CSM"."CSM_NO")
                   END AS "Consignment_Number",
                   "SHP"."SHP_ID" AS "Shipment_Id",
                   CASE
                       WHEN "SHP_FIRST_BU_ADDRESS"."CLU_CODE" IS NULL
                            OR "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" IS NULL
                            OR "SHP"."FIRST_STOP_BU_SEQ" IS NULL THEN NULL
                       ELSE "SHP_FIRST_BU_ADDRESS"."CLU_CODE" || '-' || "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" || '-' || "SHP"."FIRST_STOP_BU_SEQ"
                   END AS "First_Stop_BU_Code",
                   "SHP"."LAST_STOP_BU_CODE" AS "Last_Stop_Address_BU_Code",
                   "SHP"."LAST_STOP_BU_TYPE" AS "Last_Stop_Address_BU_Type",
                   "SHP_FIRST_BU_ADDRESS"."SEQ_NO" AS "Last_Stop_BU_Sequence"
   FROM "ODR_DELIVERY_PUB"."CSM" "CSM"
   LEFT OUTER JOIN "ODR_DELIVERY_PUB"."CSM_SHP" "CSM_SHP" ON "CSM_SHP"."CSM_CRE_BU_CODE" = "CSM"."CSM_CRE_BU_CODE"
   AND "CSM_SHP"."CSM_CRE_BU_TYPE" = "CSM"."CSM_CRE_BU_TYPE"
   AND "CSM_SHP"."CSM_NO" = "CSM"."CSM_NO"
   LEFT OUTER JOIN "ODR_DELIVERY_PUB"."SHP" "SHP" ON "SHP"."SHP_NO" = "CSM_SHP"."SHP_NO"
   AND "SHP"."SHP_CRE_BU_CODE" = "CSM_SHP"."SHP_CRE_BU_CODE"
   AND "SHP"."SHP_CRE_BU_TYPE" = "CSM_SHP"."SHP_CRE_BU_TYPE"
   LEFT OUTER JOIN "ODR_COMMON_PUB"."BU_ADDRESS_ITM_VW" "SHP_FIRST_BU_ADDRESS" ON "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE" = "SHP"."FIRST_STOP_BU_TYPE"
   AND "SHP_FIRST_BU_ADDRESS"."CLU_CODE" = "SHP"."FIRST_STOP_BU_CODE"
   AND "SHP_FIRST_BU_ADDRESS"."SEQ_NO" = "SHP"."FIRST_STOP_BU_SEQ"
   WHERE TRIM(BOTH
              FROM "SHP_FIRST_BU_ADDRESS"."CLUT_TYPE") = 'SUP'
     AND "CSM"."ARR_ACT_DTIME" >= (TRUNC(CURRENT_DATE) + (INTERVAL '1' DAY * (-365)))) "SUP_Ship" ON "CP_Ship"."Consignment_Number" = "SUP_Ship"."Consignment_Number"