
SELECT DISTINCT "YMT11T1"."ELUID" "YUniLu_LoadingUnit",
                "YMT11T1"."LUOWNER" "YUniLu_Owner",
                "YMT11T1"."PLUSTAT" "YUniLu_PhysStat",
                "YMT11T1"."LUSTATUS" "YUniLu_LuStat",
                "YMT11T1"."LUNOTE" "YUniLu_LuNote",
                "YMT11T1"."YARDITIM" "YUniLu_YardInYime",
                "YMT11T1"."LUBLOCKC" "YUniLu_LuBlockCode"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."LUOWNER" IN ('MARITIME TRANSP')
  AND "YMT11T1"."LUBLOCKC" BETWEEN 1 AND 8
  AND "YMT11T1"."LUSTATUS">0