
SELECT DISTINCT "YMH12T1"."ESHPID" "YCsm_Shipment",
                "YMH12T1"."SHPTO" "YCsm_ShpTo",
                "YMH12T1"."CARRIER" "YCsm_Carrier",
                "YMH12T1"."INOUT" "YCsm_Direction",
                "YMH12T1"."DELSTAT" "YCsm_DelStat",
                "YMH12T1"."PLANSDT" "YCsm_PlanStartTime",
                "YMT10T1"."REQELUID" "YCsmLuCon_AdvLU"
FROM "YMH12T1" "YMH12T1",
     "YMT10T1" "YMT10T1"
WHERE "YMH12T1"."INOUT" IN (1)
  AND "YMH12T1"."DELSTAT" IN ('20',
                              '10')
  AND "YMH12T1"."CARRIER" IN ('MARITIME TRANSP')
  AND "YMT10T1"."CNSID"="YMH12T1"."CNSID"