
SELECT DISTINCT "YMT11T1"."ELUID" "YUniLu_LoadingUnit",
                "YMT11T1"."LUNOTE" "YUniLu_LuNote",
                "YMT11T1"."CARRIER" "YUniLu_Carrier",
                "YMT11T1"."YARDITIM" "YUniLu_YardInYime",
                "YMT11T1"."LUTYPE" "YUniLu_LuType",
                "YMT11T1"."PLUSTAT" "YUniLu_PhysStat",
                "YMT11T1"."LUSTATUS" "YUniLu_LuStat",
                "YMT11T1"."LUBLOCKC" "YUniLu_LuBlockCode"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."LUTYPE" IN ('T90L        ',
                             'T97         ',
                             'T90-P       ',
                             'T90         ',
                             'T85         ',
                             'T47         ',
                             'T102        ',
                             'T100-P      ',
                             'T100        ')
  AND "YMT11T1"."CARRIER" IN ('MARITIME TRANSP')
  AND "YMT11T1"."LUSTATUS" BETWEEN 1 AND 1
  AND "YMT11T1"."LUBLOCKC"<1