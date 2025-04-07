
SELECT DISTINCT "YMT11T1"."ELUID" "YUniLu_LoadingUnit",
                "YMT11T1"."LUOWNER" "YUniLu_Owner",
                "YMT11T1"."LUTYPE" "YUniLu_LuType",
                "YMT11T1"."UPDDATE" "YUniLu_UpdDate",
                "YMT11T1"."PLUSTAT" "YUniLu_PhysStat",
                "YMT11T1"."LUBLOCKC" "YUniLu_LuBlockCode",
                "YMT11T1"."LUNOTE" "YUniLu_LuNote"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."LUOWNER" IN ('W H MALCOLM  LT',
                              'W H MALCOLM LTD')
  AND "YMT11T1"."LUBLOCKC">0
  AND "YMT11T1"."PLUSTAT">0