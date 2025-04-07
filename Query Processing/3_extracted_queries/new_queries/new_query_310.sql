
SELECT trim(BOTH
            FROM "X08T35"."PARTREV"),
       substr("X08T35"."PARTNO", 1, 8),
       substr("X08T35"."DATREG", 0, 10),
       trim(BOTH
            FROM "X08T35"."LOGGUSER"),
       "X08T35"."X08RCODE",
       TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9))),
       trim(BOTH
            FROM "X08T35"."PARTNO")
FROM
  (SELECT "X08T3"."CARRNO" "CARRNO",
          "X08T3"."DATREG" "DATREG",
          "X08T3"."LOGGUSER" "LOGGUSER",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('000',
                                              '055')
     AND "X08T3"."X08RCODE" IN ('305',
                                '306',
                                '308',
                                '310',
                                '311',
                                '312',
                                '313',
                                '314',
                                '315',
                                '316',
                                '317',
                                '318',
                                '320',
                                '321',
                                '330',
                                '390',
                                '391',
                                '392',
                                '393',
                                '394',
                                '435',
                                '437',
                                '457',
                                '440',
                                '441',
                                '444',
                                '446',
                                '448',
                                '455',
                                '460',
                                '461',
                                '554',
                                '415',
                                '417',
                                '220',
                                '240',
                                '241',
                                '250',
                                '380',
                                '395',
                                '450',
                                '451',
                                '480',
                                '940',
                                '941')
     AND "X08T3"."X08QUANT"<>0) "X08T35"
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
SELECT trim(BOTH
            FROM "X08T35"."PARTREV"),
       substr("X08T35"."PARTNO", 1, 8),
       substr("X08T35"."DATREG", 0, 10),
       trim(BOTH
            FROM "X08T35"."LOGGUSER"),
       "X08T35"."X08RCODE",
       TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9))),
       "X08T35"."X08QUANT",
       trim(BOTH
            FROM "X08T35"."PARTNO")
FROM
  (SELECT "X08T3"."CARRNO" "CARRNO",
          "X08T3"."DATREG" "DATREG",
          "X08T3"."LOGGUSER" "LOGGUSER",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('000',
                                              '055')
     AND "X08T3"."X08RCODE" IN ('305',
                                '306',
                                '308',
                                '310',
                                '311',
                                '312',
                                '313',
                                '314',
                                '315',
                                '316',
                                '317',
                                '318',
                                '320',
                                '321',
                                '330',
                                '390',
                                '391',
                                '392',
                                '393',
                                '394',
                                '435',
                                '437',
                                '457',
                                '440',
                                '441',
                                '444',
                                '446',
                                '448',
                                '455',
                                '460',
                                '461',
                                '554',
                                '415',
                                '417',
                                '220',
                                '240',
                                '241',
                                '250',
                                '380',
                                '395',
                                '450',
                                '451',
                                '480',
                                '940',
                                '941')
     AND "X08T3"."X08QUANT"<>0) "X08T35"
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
SELECT trim(BOTH
            FROM "X08T35"."PARTREV"),
       substr("X08T35"."PARTNO", 1, 8),
       substr("X08T35"."DATREG", 0, 10),
       trim(BOTH
            FROM "X08T35"."LOGGUSER"),
       "X08T35"."X08RCODE",
       TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9))),
       "X08T35"."CARRNO",
       trim(BOTH
            FROM "X08T35"."PARTNO")
FROM
  (SELECT "X08T3"."CARRNO" "CARRNO",
          "X08T3"."DATREG" "DATREG",
          "X08T3"."LOGGUSER" "LOGGUSER",
          "X08T3"."PARTNO" "PARTNO",
          "X08T3"."PARTREV" "PARTREV",
          "X08T3"."X08QUANT" "X08QUANT",
          "X08T3"."X08RCODE" "X08RCODE"
   FROM "X08T3" "X08T3"
   WHERE trim(BOTH
              FROM "X08T3"."DIVCODE") NOT IN ('000',
                                              '055')
     AND "X08T3"."X08RCODE" IN ('305',
                                '306',
                                '308',
                                '310',
                                '311',
                                '312',
                                '313',
                                '314',
                                '315',
                                '316',
                                '317',
                                '318',
                                '320',
                                '321',
                                '330',
                                '390',
                                '391',
                                '392',
                                '393',
                                '394',
                                '435',
                                '437',
                                '457',
                                '440',
                                '441',
                                '444',
                                '446',
                                '448',
                                '455',
                                '460',
                                '461',
                                '554',
                                '415',
                                '417',
                                '220',
                                '240',
                                '241',
                                '250',
                                '380',
                                '395',
                                '450',
                                '451',
                                '480',
                                '940',
                                '941')
     AND "X08T3"."X08QUANT"<>0) "X08T35"
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