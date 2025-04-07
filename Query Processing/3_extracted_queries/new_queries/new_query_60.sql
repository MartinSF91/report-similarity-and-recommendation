
SELECT DISTINCT "YMH12T1"."PLANEDT" "YCsm_PlanEndTime",
                "YMH12T1"."EXTSHPID" "YCsm_Extshpid",
                "YMT10T1"."REQELUID" "YCsmLuCon_AdvLU",
                "YMH12T1"."CARRIER" "YCsm_Carrier",
                "YMH12T1"."DELSTAT" "YCsm_DelStat",
                "YMT10T1"."ACTHND" "YCsm_Acthnd",
                "YMH12T1"."SHPFR" "YCsm_ShpFrom"
FROM "YMH12T1" "YMH12T1",
     "YMT10T1" "YMT10T1"
WHERE "YMH12T1"."SHPFR" IN ('GBFXTPRT1      ',
                            'GBIMMPRT1      ',
                            'GBLGPPRT1      ',
                            'GBSOUPRT1      ')
  AND "YMH12T1"."CARRIER" IN ('MARITIME TRANSP',
                              'Maritime Trans1')
  AND "YMT10T1"."ACTHND">=sysdate - (0.166667*1.0e0)
  AND "YMT10T1"."CNSID"="YMH12T1"."CNSID"