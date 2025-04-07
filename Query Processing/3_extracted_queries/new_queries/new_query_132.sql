
SELECT DISTINCT "YMH12T1"."EXTSHPID" "YCsm_Extshpid",
                "YMH12T1"."CARRIER" "YCsm_Carrier",
                "YMT10T1"."EXPGH" "YCsmLuCon_ExpGatehTime",
                "YMT10T1"."ACTGH" "YCsmLuCon_ActGatehTime",
                "YMT10T1"."REQELUID" "YCsmLuCon_AdvLU",
                "YMH12T1"."DELSTAT" "YCsm_DelStat",
                "YMH12T1"."INOUT" "YCsm_Direction"
FROM "YMH12T1" "YMH12T1",
     "YMT10T1" "YMT10T1"
WHERE "YMH12T1"."CARRIER" IN ('W H MALCOLM  LT',
                              'W H MALCOLM LTD')
  AND "YMH12T1"."DELSTAT"=20
  AND "YMH12T1"."INOUT"<1
  AND "YMT10T1"."CNSID"="YMH12T1"."CNSID"