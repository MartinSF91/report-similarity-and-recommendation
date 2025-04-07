
SELECT "X08T35"."DATREG",
       "X08T35"."X08RCODE",
       TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9))),
       ("X08T35"."X08QUANT"*"A_L62T1_X08T3"."SUVOL")/1000,
       "X08T35"."X08QUANT",
       trim(BOTH
            FROM "X08T35"."PARTNO"),
       trim(BOTH
            FROM "X08T35"."PARTREV")
FROM
  (SELECT "X08T3"."DATREG" "DATREG",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('417',
                                              '487',
                                              'DOC')) "X08T35"
INNER JOIN
  (SELECT "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."SUVOL" "SUVOL"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('417',
                                              '487',
                                              'DOC')) "A_L62T1_X08T3" ON "X08T35"."PARTNO"="A_L62T1_X08T3"."PARTNO"
AND "X08T35"."PARTREV"="A_L62T1_X08T3"."PARTREV"
WHERE "X08T35"."X08RCODE" IN (437,
                              440,
                              460,
                              450,
                              308)
  AND TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9)))>=DATE '2025-03-18'
  AND TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9)))<=DATE '2025-03-25'
  SELECT "A_PRICES_X08T3"."PRICE",
         "A_PRICES_X08T3"."ITEM_NO",
         "A_PRICES_X08T3"."BU_CODE_SUP", (coalesce("A_PRICES_X08T3"."BU_TYPE_SUP", 'SUP'))
  FROM
    (SELECT "PRICES_VW"."ITEM_TYPE" "ITEM_TYPE",
            "PRICES_VW"."ITEM_NO" "ITEM_NO",
            "PRICES_VW"."BU_TYPE_SUP" "BU_TYPE_SUP",
            "PRICES_VW"."BU_CODE_SUP" "BU_CODE_SUP",
            "PRICES_VW"."PRICE" "PRICE"
     FROM "PRICES_VW" "PRICES_VW"
     WHERE "PRICES_VW"."BU_TYPE"='CDC'
       AND "PRICES_VW"."BU_CODE" IN ('016')
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_X08T3"