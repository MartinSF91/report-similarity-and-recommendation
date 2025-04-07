
SELECT "YMT11T1"."CARRIER" "Carrier",
       "YMT11T1"."ELUID" "Loading_Unit",
       "YMT11T1"."LUSTATUS" "YUniLu_LuStat",
       min("YMT11T1"."ELUID") "c4",
       "YMT11T1"."LUBLOCKC" "YUniLu_LuBlockCode",
       "YMT11T1"."PLUSTAT" "YUniLu_PhysStat"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."CARRIER" IN ('BARRON WOOD DIS')
  AND "YMT11T1"."LUSTATUS" IN (1,
                               50,
                               70)
  AND "YMT11T1"."LUBLOCKC" IN (0,
                               8)
  AND "YMT11T1"."PLUSTAT" IN (2,
                              1)
GROUP BY "YMT11T1"."CARRIER",
         "YMT11T1"."ELUID",
         "YMT11T1"."LUSTATUS",
         "YMT11T1"."LUBLOCKC",
         "YMT11T1"."PLUSTAT"