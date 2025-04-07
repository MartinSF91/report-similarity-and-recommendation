
SELECT trim(BOTH
            FROM "X08T35"."PARTREV"),
       substr("X08T35"."PARTNO", 1, 8),
       "X08T35"."DATREG",
       trim(BOTH
            FROM "X08T35"."LOGGUSER"),
       "X08T35"."X08RCODE",
       "X08T35"."X08QUANT",
       trim(BOTH
            FROM "X08T35"."PARTNO")
FROM
  (SELECT "X08T3"."DATREG" "DATREG",
          "X08T3"."LOGGUSER" "LOGGUSER",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('----')
     AND "X08T3"."X08RCODE" IN ('260',
                                '305',
                                '306',
                                '310',
                                '311',
                                '312',
                                '313',
                                '314',
                                '315',
                                '316',
                                '317',
                                '320',
                                '321',
                                '380',
                                '390',
                                '391',
                                '392',
                                '393',
                                '394',
                                '395',
                                '415',
                                '417',
                                '435',
                                '437',
                                '440',
                                '441',
                                '455',
                                '457',
                                '460',
                                '461',
                                '480')
     AND TRUNC(cast("X08T3"."DATREG" AS TIMESTAMP(9)))<=TRUNC(cast(:PQ2 AS TIMESTAMP(9)))
     AND TRUNC(cast("X08T3"."DATREG" AS TIMESTAMP(9)))>=TRUNC(cast(:PQ1 AS TIMESTAMP(9)))) "X08T35"
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
     AND "PRICES_VW"."BU_CODE" IN ('005')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_X08T3"