
SELECT "T0"."C0" "Shp_Id",
       CASE
           WHEN count("T0"."C1") OVER (PARTITION BY "T0"."C0"
                                       ORDER BY "T0"."C0" ASC, "T0"."C2" ASC, "T0"."C3" ASC, "T0"."C4" ASC, "T0"."C5" ASC, "T0"."C6" ASC, "T0"."C7" ASC, "T0"."C8" ASC, "T0"."C9" ASC, "T0"."C10" ASC, "T0"."C11" ASC, "T0"."C12" ASC, "T0"."C13" ASC, "T0"."C14" ASC ROWS UNBOUNDED PRECEDING)>1 THEN 0
           ELSE 1
       END "Count_of_Shps",
       "T0"."C2" "ShpRou_StartCty",
       "T0"."C3" "ShpRou_StartCode",
       "T0"."C4" "ShpRou_StartType",
       "T0"."C5" "ShpRou_StartBuaNo",
       "T0"."C6" "ShpRou_EndCty",
       "T0"."C7" "ShpRou_EndCode",
       "T0"."C8" "ShpRou_EndType",
       "T0"."C9" "ShpRou_EndBuaNo",
       "T0"."C10" "ShpRou_SendPldArrDateTimeOra",
       "T0"."C11" "Csm_Id",
       "T0"."C12" "Csm_Pld_DispDate",
       "T0"."C13" "Date_check",
       "T0"."C14" "ShpRou_RecPldArrDateTimeOra"
FROM
  (SELECT concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO") "C0",
          min(concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO")) "C1",
          "SHIPMENT_ROUTE"."CTY_CODE_START" "C2",
          "SHIPMENT_ROUTE"."BU_CODE_START" "C3",
          "SHIPMENT_ROUTE"."BU_TYPE_START" "C4",
          "SHIPMENT_ROUTE"."BUA_NO_START" "C5",
          "SHIPMENT_ROUTE"."CTY_CODE_END" "C6",
          "SHIPMENT_ROUTE"."BU_CODE_END" "C7",
          "SHIPMENT_ROUTE"."BU_TYPE_END" "C8",
          "SHIPMENT_ROUTE"."BUA_NO_END" "C9",
          "SHIPMENT_ROUTE"."PLD_START_DATE" "C10",
          concat(concat("CONSIGNMENT"."BU_CODE_CRE", "CONSIGNMENT"."BU_TYPE_CRE"), "CONSIGNMENT"."CSM_NO") "C11",
          TRUNC(cast("CONSIGNMENT"."DSP_DAY_PLAN" AS TIMESTAMP(9))) "C12",
          CASE
              WHEN TRUNC(cast("CONSIGNMENT"."DSP_DAY_PLAN" AS TIMESTAMP(9)))<>TRUNC(cast("SHIPMENT_ROUTE"."PLD_START_DATE" AS TIMESTAMP(9))) THEN '!'
              ELSE NULL
          END "C13",
          "SHIPMENT_ROUTE"."PLD_END_DATE" "C14"
   FROM "SHIPMENT" "SHIPMENT",
        "SHIPMENT_ROUTE" "SHIPMENT_ROUTE",
        "CONSIGNMENT" "CONSIGNMENT",
        "CONNECTED_CSM" "CONNECTED_CSM"
   WHERE TRUNC(cast("CONSIGNMENT"."DSP_DAY_PLAN" AS TIMESTAMP(9)))=TRUNC(cast(sysdate+1 AS TIMESTAMP(9)))
     AND "SHIPMENT"."SHP_STAT"<60
     AND "CONSIGNMENT"."CSM_STAT"<80
     AND "SHIPMENT"."BU_CODE_CRE"="SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"
     AND "SHIPMENT"."BU_TYPE_CRE"="SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"
     AND "SHIPMENT"."SHP_NO"="SHIPMENT_ROUTE"."SHP_NO"
     AND "SHIPMENT_ROUTE"."BU_CODE_CRE_SHP"="CONNECTED_CSM"."BU_CODE_CRE_SHP"
     AND "SHIPMENT_ROUTE"."BU_TYPE_CRE_SHP"="CONNECTED_CSM"."BU_TYPE_CRE_SHP"
     AND "SHIPMENT_ROUTE"."SHP_NO"="CONNECTED_CSM"."SHP_NO"
     AND "SHIPMENT_ROUTE"."SHPR_NO"="CONNECTED_CSM"."SHPR_NO"
     AND "CONNECTED_CSM"."BU_CODE_CRE_CSM"="CONSIGNMENT"."BU_CODE_CRE"
     AND "CONNECTED_CSM"."BU_TYPE_CRE_CSM"="CONSIGNMENT"."BU_TYPE_CRE"
     AND "CONNECTED_CSM"."CSM_NO"="CONSIGNMENT"."CSM_NO"
   GROUP BY concat(concat("SHIPMENT"."BU_CODE_CRE", "SHIPMENT"."BU_TYPE_CRE"), "SHIPMENT"."SHP_NO"),
            "SHIPMENT_ROUTE"."CTY_CODE_START",
            "SHIPMENT_ROUTE"."BU_CODE_START",
            "SHIPMENT_ROUTE"."BU_TYPE_START",
            "SHIPMENT_ROUTE"."BUA_NO_START",
            "SHIPMENT_ROUTE"."CTY_CODE_END",
            "SHIPMENT_ROUTE"."BU_CODE_END",
            "SHIPMENT_ROUTE"."BU_TYPE_END",
            "SHIPMENT_ROUTE"."BUA_NO_END",
            "SHIPMENT_ROUTE"."PLD_START_DATE",
            concat(concat("CONSIGNMENT"."BU_CODE_CRE", "CONSIGNMENT"."BU_TYPE_CRE"), "CONSIGNMENT"."CSM_NO"),
            TRUNC(cast("CONSIGNMENT"."DSP_DAY_PLAN" AS TIMESTAMP(9))),
            CASE
                WHEN TRUNC(cast("CONSIGNMENT"."DSP_DAY_PLAN" AS TIMESTAMP(9)))<>TRUNC(cast("SHIPMENT_ROUTE"."PLD_START_DATE" AS TIMESTAMP(9))) THEN '!'
                ELSE NULL
            END,
            "SHIPMENT_ROUTE"."PLD_END_DATE") "T0"
ORDER BY "Shp_Id" ASC NULLS LAST,
         "ShpRou_StartCty" ASC NULLS LAST,
         "ShpRou_StartCode" ASC NULLS LAST,
         "ShpRou_StartType" ASC NULLS LAST,
         "ShpRou_StartBuaNo" ASC NULLS LAST,
         "ShpRou_EndCty" ASC NULLS LAST,
         "ShpRou_EndCode" ASC NULLS LAST,
         "ShpRou_EndType" ASC NULLS LAST,
         "ShpRou_EndBuaNo" ASC NULLS LAST,
         "ShpRou_SendPldArrDateTimeOra" ASC NULLS LAST,
         "Csm_Id" ASC NULLS LAST,
         "Csm_Pld_DispDate" ASC NULLS LAST,
         "Date_check" ASC NULLS LAST,
         "ShpRou_RecPldArrDateTimeOra" ASC NULLS LAST