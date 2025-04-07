
SELECT "qryCNS5"."Csm_ConsigneeCode" "c0",
       "qryCNS5"."LuTr_LuId" "c1",
       "qryCNS5"."LuTr_LutCode" "c2",
       "qryCNS5"."Csm_No" "c3",
       "qryCNS5"."Csm_Id" "c4",
       "qryCNS5"."Csm_ConsignorCode" "c5",
       "qryCNS5"."Csm_StatDesc" "c6",
       "qryCNS5"."Shp_No" "c7",
       "qryCNS5"."Shp_Id" "c8",
       "qryCNS5"."ShpRou_RecPldArrDate" "c9",
       "qryCNS5"."CsmLine_ArtNo" "c10",
       "qryCNS5"."CsmLine_ArtQtyDsp" "c11",
       "qryCNS5"."CsmLine_OrderRef" "c12",
       "qryCNS5"."CsmLine_RcvCode" "c13",
       "qryCNS5"."ArtSup_BuCode" "c14"
FROM
  (SELECT DISTINCT "CONSIGNMENT"."CSM_NO" "Csm_No",
                   concat(concat("CONSIGNMENT"."BU_CODE_CRE", "CONSIGNMENT"."BU_TYPE_CRE"), "CONSIGNMENT"."CSM_NO") "Csm_Id",
                   "ART_SUP_DWP_BO"."BU_CODE" "ArtSup_BuCode",
                   "CONSIGNMENT"."BU_CODE_CNOR" "Csm_ConsignorCode",
                   "CONSIGNMENT"."CSM_STAT_TXT" "Csm_StatDesc",
                   "CONSIGNMENT_LINE"."ITEM_ID" "CsmLine_ArtNo",
                   "CONSIGNMENT_LINE"."ITEM_NAME_MAIN" "CsmLine_ArtName",
                   "SHIPMENT"."SHP_NO" "Shp_No",
                   concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO") "Shp_Id",
                   TRUNC(cast("SHIPMENT_ROUTE"."PLD_END_DATE" AS TIMESTAMP(9))) "ShpRou_RecPldArrDate",
                   "LOADING_UNIT_TRIP"."LU_ID" "LuTr_LuId",
                   "LOADING_UNIT_TRIP"."LUT_CODE" "LuTr_LutCode",
                   "CONSIGNMENT_LINE"."ITEM_QTY_DSP" "CsmLine_ArtQtyDsp",
                   "CONSIGNMENT_LINE"."ORDER_REFERENCE" "CsmLine_OrderRef",
                   "CONSIGNMENT_LINE"."BU_CODE_RCV" "CsmLine_RcvCode",
                   "CONSIGNMENT"."BU_CODE_CNEE" "Csm_ConsigneeCode"
   FROM ((((("SHIPMENT" "SHIPMENT"
             INNER JOIN "LOADING_UNIT_TRIP" "LOADING_UNIT_TRIP" ON "SHIPMENT"."BU_CODE_CRE"="LOADING_UNIT_TRIP"."BU_CODE_CRE_SHP"
             AND "SHIPMENT"."BU_TYPE_CRE"="LOADING_UNIT_TRIP"."BU_TYPE_CRE_SHP"
             AND "SHIPMENT"."SHP_NO"="LOADING_UNIT_TRIP"."SHP_NO")
            INNER JOIN "SHIPMENT_ROUTE" "SHIPMENT_ROUTE" ON "SHIPMENT"."BU_CODE_CRE"="SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"
            AND "SHIPMENT"."BU_TYPE_CRE"="SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"
            AND "SHIPMENT"."SHP_NO"="SHIPMENT_ROUTE"."SHP_NO")
           INNER JOIN "CONNECTED_CSM" "CONNECTED_CSM" ON "SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"="CONNECTED_CSM"."BU_CODE_CRE_SHP"
           AND "SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"="CONNECTED_CSM"."BU_TYPE_CRE_SHP"
           AND "SHIPMENT_ROUTE"."SHP_NO"="CONNECTED_CSM"."SHP_NO"
           AND "SHIPMENT_ROUTE"."SHPR_NO"="CONNECTED_CSM"."SHPR_NO")
          INNER JOIN "CONSIGNMENT" "CONSIGNMENT" ON "CONNECTED_CSM"."BU_CODE_CRE_CSM"="CONSIGNMENT"."BU_CODE_CRE"
          AND "CONNECTED_CSM"."BU_TYPE_CRE_CSM"="CONSIGNMENT"."BU_TYPE_CRE"
          AND "CONNECTED_CSM"."CSM_NO"="CONSIGNMENT"."CSM_NO")
         INNER JOIN "CONSIGNMENT_LINE" "CONSIGNMENT_LINE" ON "CONSIGNMENT"."BU_CODE_CRE"="CONSIGNMENT_LINE"."BU_CODE_CRE_CSM"
         AND "CONSIGNMENT"."BU_TYPE_CRE"="CONSIGNMENT_LINE"."BU_TYPE_CRE_CSM"
         AND "CONSIGNMENT"."CSM_NO"="CONSIGNMENT_LINE"."CSM_NO")
   LEFT OUTER JOIN "ART_SUP_DWP_BO" "ART_SUP_DWP_BO" ON "CONSIGNMENT_LINE"."ITEM_ID"="ART_SUP_DWP_BO"."ITEM_ID"
   AND "CONSIGNMENT_LINE"."BU_CODE_SUP"="ART_SUP_DWP_BO"."BU_CODE"
   WHERE "CONSIGNMENT"."BU_CODE_CNEE" IN ('015',
                                          '017')
     AND "CONSIGNMENT"."CSM_STAT_TXT" IN ('IN TRANSIT',
                                          'AT TRANSIT LOCATION',
                                          'ARRIVED')
     AND "CONSIGNMENT_LINE"."ITEM_TYPE"='ART'
     AND "SHIPMENT"."SHP_STAT_DESC" NOT IN ('CANCELLED',
                                            'UNLOADED')
     AND "SHIPMENT_ROUTE"."BU_CODE_END"='AUSYD'
     AND "CONSIGNMENT"."BU_CODE_CNEE"='017') "qryCNS5"
ORDER BY "c10" ASC NULLS LAST,
         "c14" ASC NULLS LAST,
         "c0" ASC NULLS LAST
SELECT "Articles6"."Supplier" "c0",
       "Articles6"."PA" "c1",
       "Articles6"."Descr1" "c2",
       "Articles6"."Pref_LdCT" "c3",
       "Articles6"."BufferMHA" "c4",
       "Articles6"."FP_Qty" "c5",
       "Articles6"."SHORTL62" "c6",
       "Articles6"."DIVCODE" "c7",
       "Articles6"."Article" "c8"
FROM
  (SELECT DISTINCT "SQL2"."Article" "Article",
                   "SQL2"."Supplier" "Supplier",
                   "SQL2"."PA" "PA",
                   "SQL2"."Descr1" "Descr1",
                   "SQL2"."Pref LdCT" "Pref_LdCT",
                   "SQL2"."FP Qty" "FP_Qty",
                   "SQL2"."BufferMHA" "BufferMHA",
                   "SQL2"."SHORTL62" "SHORTL62",
                   "SQL2"."DIVCODE" "DIVCODE"
   FROM
     (SELECT rtrim(L62T1.partno) "Article",
             RTRIM(L62T1.partrev) "Supplier",
             L62T99.PANUM "PA",
             L62T1.partdsc1 "Descr1",
             L62T1.wldct "Pref LdCT",
             L62T1.cquant "FP Qty",
             L62T1.wmha "BufferMHA",
             L62T1.shortl62,
             rtrim(L62t1.divcode) divcode
      FROM L62T1,
           L62T99
      WHERE (L62T1.DIVCODE = L62T99.DIVCODE
             AND L62T1.PARTNO = L62T99.PARTNO
             AND L62T1.PARTREV = L62T99.PARTREV)) "SQL2") "Articles6"
ORDER BY "c8" ASC NULLS LAST,
         "c0" ASC NULLS LAST,
         "c7" ASC NULLS LAST