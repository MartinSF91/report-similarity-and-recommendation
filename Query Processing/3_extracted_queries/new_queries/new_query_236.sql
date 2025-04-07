
SELECT "A_L62T1_X08T3"."SUVOL",
       "X08T38"."X08QUANT",
       trim(BOTH
            FROM "X08T38"."PARTREV"),
       substr("X08T38"."PARTNO", 1, 8),
       "X08T38"."DATREG",
       trim(BOTH
            FROM "X08T38"."LOGGUSER"),
       "X08T38"."X08RCODE",
       "A_Pallet_ArtData"."PARTDSC1",
       trim(BOTH
            FROM "X08T38"."PARTNO")
FROM (("L16T3" "L16T3"
       INNER JOIN
         (SELECT "X08T3"."DATREG" "DATREG",
                 "X08T3"."DIVCODE" "DIVCODE",
                 "X08T3"."L16SEQNO" "L16SEQNO",
                 "X08T3"."LOGGUSER" "LOGGUSER",
                 "X08T3"."PARTNO" "PARTNO",
                 "X08T3"."PARTREV" "PARTREV",
                 "X08T3"."X08QUANT" "X08QUANT",
                 "X08T3"."X08RCODE" "X08RCODE"
          FROM "X08T3" "X08T3"
          WHERE trim(BOTH
                     FROM "X08T3"."DIVCODE") NOT IN ('----')) "X08T38" ON "L16T3"."L16SEQNO"="X08T38"."L16SEQNO"
       AND "L16T3"."DATREG"="X08T38"."DATREG"
       AND "L16T3"."DIVCODE"="X08T38"."DIVCODE"
       AND "L16T3"."PARTNO"="X08T38"."PARTNO"
       AND "L16T3"."PARTREV"="X08T38"."PARTREV")
      INNER JOIN
        (SELECT "L62T1"."PARTNO" "PARTNO",
                "L62T1"."PARTREV" "PARTREV",
                "L62T1"."SUVOL" "SUVOL"
         FROM "L62T1" "L62T1"
         WHERE trim(BOTH
                    FROM "L62T1"."DIVCODE") NOT IN ('----')) "A_L62T1_X08T3" ON "X08T38"."PARTNO"="A_L62T1_X08T3"."PARTNO"
      AND "X08T38"."PARTREV"="A_L62T1_X08T3"."PARTREV")
INNER JOIN
  (SELECT "L62T1"."PARTDSC1" "PARTDSC1",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('----')) "A_Pallet_ArtData" ON "L16T3"."SHORTL62"="A_Pallet_ArtData"."SHORTL62"
WHERE "X08T38"."X08RCODE" IN ('220',
                              '240',
                              '241',
                              '250',
                              '260',
                              '305',
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
                              '450',
                              '451',
                              '455',
                              '457',
                              '460',
                              '461',
                              '480')
  AND TRUNC(cast("X08T38"."DATREG" AS TIMESTAMP(9)))<=TRUNC(cast(:PQ2 AS TIMESTAMP(9)))
  AND TRUNC(cast("X08T38"."DATREG" AS TIMESTAMP(9)))>=TRUNC(cast(:PQ1 AS TIMESTAMP(9)))
  AND "X08T38"."X08QUANT"<>0
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
       AND "PRICES_VW"."BU_CODE" IN ('418')
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_X08T3"