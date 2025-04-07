
SELECT DISTINCT "YMT11T1"."ELUID" "YUniLu_LoadingUnit",
                "YMT11T1"."CARRIER" "YUniLu_Carrier",
                "YMT11T1"."YARDITIM" "YUniLu_YardInYime",
                "YMT11T1"."LUSTATUS" "YUniLu_LuStat",
                "YMT11T1"."DMHA" "YUniLu_Dock",
                "YMT11T1"."SUBSSTAT" "YUniLu_SubSysStat"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."CARRIER" IN ('MARITIME TRANSP')
  AND "YMT11T1"."LUSTATUS" BETWEEN 20 AND 20
  AND "YMT11T1"."SUBSSTAT" BETWEEN 1 AND 1