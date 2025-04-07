
SELECT "T0"."C0" "CsmLine_RcvCode",
       "T0"."C1" "Csm_ConsignorCode",
       "T0"."C2" "Csm_CnorName",
       "T0"."C3" "Shp_Id",
       "T0"."C4" "Csm_No",
       "T0"."C5" "CsmLine_PalQtyDsp",
       "T0"."C6" "CsmLine_VolGro",
       "T0"."C7" "CsmLine_WeiGro",
       "T0"."C8" "ArtSup_ItemPallLen",
       "T0"."C9" "PallType",
       "T0"."C10" "PM",
       "T0"."C11" "Type",
       "T0"."C12" "Calculated_Shp_Id_",
       "T0"."C13" "Calculated_Csm_No_",
       "T0"."C6" "Calculated_CsmLine_VolGro_",
       "T0"."C7" "Calculated_CsmLine_WeiGro_",
       "T0"."C5" "Calculated_CsmLine_PalQtyDsp_",
       "T0"."C14" "MAX_PalType",
       "T0"."C15" "MIN_PalType",
       "T0"."C16" "PALL_TYPE",
       "T0"."C7" "Calculated_CsmLine_WeiGro_1"
FROM
  (SELECT "CONSIGNMENT_LINE"."BU_CODE_RCV" "C0",
          "CONSIGNMENT"."BU_CODE_CNOR" "C1",
          "CONSIGNMENT"."BU_NAME_CNOR" "C2",
          concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO") "C3",
          "CONSIGNMENT"."CSM_NO" "C4",
          sum("CONSIGNMENT_LINE"."ITEM_QTY_DSP"/nullif("ART_SUP_DWP_BO"."ITEM_QTY_PALL", 0)) "C5",
          sum("CONSIGNMENT_LINE"."CSL_VOL_GRO") "C6",
          sum("CONSIGNMENT_LINE"."CSL_WEI_GRO") "C7",
          "ART_SUP_DWP_BO"."PALL_LEN_ITEM" "C8",
          CASE
              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
              ELSE 'EURO'
          END "C9",
          CASE
              WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"='275'
                   AND "CONSIGNMENT_LINE"."PM_CODE"='0' THEN '0'
              WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"='275'
                   AND "CONSIGNMENT_LINE"."PM_CODE"<>'0' THEN '1+2'
              WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"<>'275'
                   AND "CONSIGNMENT_LINE"."PM_CODE"='2' THEN '2'
              ELSE '0+1'
          END "C10",
          CASE
              WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV"='DT' THEN 'Lager'
              WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV" IN ('STO',
                                                        'CDC') THEN 'Transit'
              ELSE 'Paletten'
          END "C11",
          min(concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO")) "C12",
          min("CONSIGNMENT"."CSM_NO") "C13",
          max(CASE
                  WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                  WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                  ELSE 'EURO'
              END) "C14",
          min(CASE
                  WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                  WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                  ELSE 'EURO'
              END) "C15",
          CASE
              WHEN min(CASE
                           WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                           WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                           ELSE 'EURO'
                       END) IS NULL
                   OR max(CASE
                              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                              ELSE 'EURO'
                          END) IS NULL THEN NULL
              ELSE min(CASE
                           WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                           WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                           ELSE 'EURO'
                       END) || '+' || max(CASE
                                              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                                              WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                                              ELSE 'EURO'
                                          END)
          END "C16"
   FROM (((("SHIPMENT" "SHIPMENT"
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
   WHERE trunc("SHIPMENT_ROUTE"."PLD_END_DATE") BETWEEN DATE '2025-03-26' AND DATE '2025-03-26'
     AND "CONSIGNMENT"."BU_CODE_CNEE"='010'
     AND "SHIPMENT"."SHP_STAT" IN (20,
                                   30,
                                   40,
                                   50)
     AND "CONSIGNMENT"."CSM_STAT"<80
     AND "SHIPMENT_ROUTE"."BU_TYPE_END"='DT'
     AND CASE
             WHEN ("CONSIGNMENT_LINE"."BU_TYPE_RCV"='DT') THEN 'Lager'
             WHEN ("CONSIGNMENT_LINE"."BU_TYPE_RCV" IN ('STO',
                                                        'CDC')) THEN 'Transit'
             ELSE 'Paletten'
         END IN ('Transit')
   GROUP BY "CONSIGNMENT_LINE"."BU_CODE_RCV",
            "CONSIGNMENT"."BU_CODE_CNOR",
            "CONSIGNMENT"."BU_NAME_CNOR",
            concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO"),
            "CONSIGNMENT"."CSM_NO",
            "ART_SUP_DWP_BO"."PALL_LEN_ITEM",
            CASE
                WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM">=2000 THEN 'IKEA'
                WHEN "ART_SUP_DWP_BO"."PALL_LEN_ITEM"<1200 THEN 'HALF'
                ELSE 'EURO'
            END,
            CASE
                WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"='275'
                     AND "CONSIGNMENT_LINE"."PM_CODE"='0' THEN '0'
                WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"='275'
                     AND "CONSIGNMENT_LINE"."PM_CODE"<>'0' THEN '1+2'
                WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV"<>'275'
                     AND "CONSIGNMENT_LINE"."PM_CODE"='2' THEN '2'
                ELSE '0+1'
            END,
            CASE
                WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV"='DT' THEN 'Lager'
                WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV" IN ('STO',
                                                          'CDC') THEN 'Transit'
                ELSE 'Paletten'
            END) "T0"