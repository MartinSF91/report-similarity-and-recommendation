
SELECT "CONSIGNMENT"."BU_CODE_CNOR" "Csm_ConsignorCode",
       "CONSIGNMENT"."BU_CODE_CNEE" "Csm_ConsigneeCode",
       concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO") "Shp_Id",
       "CONSIGNMENT"."BU_TYPE_CNEE" "Csm_CneeType",
       "CONSIGNMENT"."CSM_VOL_NET_ACT" "Csm_VolNetTot",
       TRUNC(cast("SHIPMENT"."START_DATE" AS TIMESTAMP(9))) "Shp_DateStart",
       "LOADING_UNIT_TRIP"."LU_VOL_BOOK" "LuTr_VolBook",
       sum("CONSIGNMENT"."TRPT_VOL_ORD") "Csm_TrptVolOrdSum"
FROM "CONSIGNMENT" "CONSIGNMENT",
     "SHIPMENT" "SHIPMENT",
     "LOADING_UNIT_TRIP" "LOADING_UNIT_TRIP",
     "SHIPMENT_ROUTE" "SHIPMENT_ROUTE",
     "CONNECTED_CSM" "CONNECTED_CSM"
WHERE "CONSIGNMENT"."BU_CODE_CNOR" IN ('390')
  AND "CONSIGNMENT"."BU_TYPE_CNEE" IN ('CDC',
                                       'STO')
  AND TRUNC(cast(TRUNC(cast("SHIPMENT"."START_DATE" AS TIMESTAMP(9))) AS TIMESTAMP(9))) BETWEEN (TRUNC(CURRENT_DATE) + (INTERVAL '1' DAY * (-1))) AND TRUNC(CURRENT_DATE)
  AND "CONSIGNMENT"."BU_CODE_CNEE" IN ('027',
                                       '028',
                                       '030',
                                       '038',
                                       '113',
                                       '125',
                                       '140',
                                       '141',
                                       '142',
                                       '143',
                                       '144',
                                       '150',
                                       '185',
                                       '186',
                                       '255',
                                       '261',
                                       '262',
                                       '263',
                                       '264',
                                       '265',
                                       '266',
                                       '267',
                                       '269',
                                       '461',
                                       '519',
                                       '548',
                                       '567')
  AND "CONNECTED_CSM"."BU_CODE_CRE_CSM"="CONSIGNMENT"."BU_CODE_CRE"
  AND "CONNECTED_CSM"."BU_TYPE_CRE_CSM"="CONSIGNMENT"."BU_TYPE_CRE"
  AND "CONNECTED_CSM"."CSM_NO"="CONSIGNMENT"."CSM_NO"
  AND "SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"="CONNECTED_CSM"."BU_CODE_CRE_SHP"
  AND "SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"="CONNECTED_CSM"."BU_TYPE_CRE_SHP"
  AND "SHIPMENT_ROUTE"."SHP_NO"="CONNECTED_CSM"."SHP_NO"
  AND "SHIPMENT_ROUTE"."SHPR_NO"="CONNECTED_CSM"."SHPR_NO"
  AND "SHIPMENT"."BU_CODE_CRE"="SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"
  AND "SHIPMENT"."BU_TYPE_CRE"="SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"
  AND "SHIPMENT"."SHP_NO"="SHIPMENT_ROUTE"."SHP_NO"
  AND "SHIPMENT"."BU_CODE_CRE"="LOADING_UNIT_TRIP"."BU_CODE_CRE_SHP"
  AND "SHIPMENT"."BU_TYPE_CRE"="LOADING_UNIT_TRIP"."BU_TYPE_CRE_SHP"
  AND "SHIPMENT"."SHP_NO"="LOADING_UNIT_TRIP"."SHP_NO"
GROUP BY "CONSIGNMENT"."BU_CODE_CNOR",
         "CONSIGNMENT"."BU_CODE_CNEE",
         concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO"),
         "CONSIGNMENT"."BU_TYPE_CNEE",
         "CONSIGNMENT"."CSM_VOL_NET_ACT",
         TRUNC(cast("SHIPMENT"."START_DATE" AS TIMESTAMP(9))),
         "LOADING_UNIT_TRIP"."LU_VOL_BOOK"