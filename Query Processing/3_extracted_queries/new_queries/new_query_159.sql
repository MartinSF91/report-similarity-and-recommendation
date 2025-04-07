
SELECT "YMT11T1"."CARRIER" "Carrier",
       "YMT11T1"."ELUID" "Loading_Unit",
       "YMT11T1"."LUBLOCKC" "YUniLu_LuBlockCode",
       min("YMT11T1"."ELUID") "Count_distinct_Loading_Unit_",
       "YMT11T1"."PLUSTAT" "YUniLu_PhysStat"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."CARRIER" IN ('WOODSIDE HAULAG')
  AND "YMT11T1"."LUBLOCKC" IN (1,
                               2,
                               6,
                               7)
  AND "YMT11T1"."PLUSTAT" IN (2,
                              1)
GROUP BY "YMT11T1"."CARRIER",
         "YMT11T1"."ELUID",
         "YMT11T1"."LUBLOCKC",
         "YMT11T1"."PLUSTAT"