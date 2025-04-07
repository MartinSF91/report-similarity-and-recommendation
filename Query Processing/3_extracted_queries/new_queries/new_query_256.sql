
SELECT "X08T34"."X08RCODE",
       TRUNC(cast("X08T34"."DATREG" AS TIMESTAMP(9))),
       "X08T34"."X08QUANT",
       trim(BOTH
            FROM "X08T34"."PARTREV"),
       trim(BOTH
            FROM "X08T34"."PARTNO")
FROM
  (SELECT "X08T3"."DATREG" "DATREG",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('000',
                                              '055')
     AND "X08T3"."X08RCODE" IN (305,
                                306,
                                390,
                                391,
                                392,
                                393,
                                395)
     AND NOT ("X08T3"."X08QUANT"=0)
     AND trim(BOTH
              FROM "X08T3"."PARTREV") NOT IN ('02508',
                                              '23801',
                                              '25080',
                                              '99999',
                                              '598014',
                                              '50059',
                                              '998014',
                                              '10000')
     AND TRUNC(cast("X08T3"."DATREG" AS TIMESTAMP(9)))>=TRUNC(cast(:PQ1 AS TIMESTAMP(9)))
     AND TRUNC(cast("X08T3"."DATREG" AS TIMESTAMP(9)))<=TRUNC(cast(:PQ2 AS TIMESTAMP(9)))) "X08T34"
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
     AND "PRICES_VW"."BU_CODE" IN ('003')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_X08T3"