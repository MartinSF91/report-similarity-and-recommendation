
SELECT concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO") "Shp_Id",
       to_char("SHIPMENT_ROUTE"."PLD_END_DATE", 'DD-MON-YYYY HH24:MI:SS') "ShpRou_RecPldArrDateTime",
       "CONSIGNMENT_LINE"."BU_CODE_RCV" "CsmLine_RcvCode",
       CASE
           WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV" IN ('022',
                                                     '246') THEN 'DC'
           ELSE 'Transit'
       END "c4",
       CASE
           WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV"='DT' THEN 'Lager'
           WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV" IN ('STO',
                                                     'CDC') THEN 'Transit'
           ELSE 'Paletten'
       END "c5",
       "SHIPMENT_ROUTE"."BU_CODE_END" "ShpRou_EndCode",
       "CONSIGNMENT_LINE"."BU_TYPE_RCV" "CsmLine_RcvType",
       sum("CONSIGNMENT_LINE"."ITEM_QTY_DSP"/nullif("ART_SUP_DWP_BO"."ITEM_QTY_PALL", 0)) "CsmLine_PalQtyDsp"
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
      END IN ('Transit',
              'Lager')
GROUP BY concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO"),
         to_char("SHIPMENT_ROUTE"."PLD_END_DATE", 'DD-MON-YYYY HH24:MI:SS'),
         "CONSIGNMENT_LINE"."BU_CODE_RCV",
         CASE
             WHEN "CONSIGNMENT_LINE"."BU_CODE_RCV" IN ('022',
                                                       '246') THEN 'DC'
             ELSE 'Transit'
         END,
         CASE
             WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV"='DT' THEN 'Lager'
             WHEN "CONSIGNMENT_LINE"."BU_TYPE_RCV" IN ('STO',
                                                       'CDC') THEN 'Transit'
             ELSE 'Paletten'
         END,
         "SHIPMENT_ROUTE"."BU_CODE_END",
         "CONSIGNMENT_LINE"."BU_TYPE_RCV"