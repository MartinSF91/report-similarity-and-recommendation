
SELECT trim(BOTH
            FROM "X08T36"."PARTREV"),
       substr("X08T36"."PARTNO", 1, 8),
       "X08T36"."DATREG",
       trim(BOTH
            FROM "X08T36"."LOGGUSER"),
       "X08T36"."X08RCODE",
       "X08T36"."DIVCODE",
       "A_Pallet_ArtData"."PARTDSC1",
       "X08T36"."X08QUANT",
       trim(BOTH
            FROM "X08T36"."PARTNO")
FROM ("L16T3" "L16T3"
      INNER JOIN
        (SELECT "X08T3"."DATREG" "DATREG",
                "X08T3"."DIVCODE" "DIVCODE",
                "X08T3"."L16SEQNO" "L16SEQNO",
                "X08T3"."L54TYPE" "L54TYPE",
                "X08T3"."LOGGUSER" "LOGGUSER",
                "X08T3"."PARTNO" "PARTNO",
                "X08T3"."PARTREV" "PARTREV",
                "X08T3"."X08QUANT" "X08QUANT",
                "X08T3"."X08RCODE" "X08RCODE"
         FROM "X08T3" "X08T3"
         WHERE trim(BOTH
                    FROM "X08T3"."DIVCODE") NOT IN ('000',
                                                    '055')) "X08T36" ON "L16T3"."L16SEQNO"="X08T36"."L16SEQNO"
      AND "L16T3"."DATREG"="X08T36"."DATREG"
      AND "L16T3"."DIVCODE"="X08T36"."DIVCODE"
      AND "L16T3"."PARTNO"="X08T36"."PARTNO"
      AND "L16T3"."PARTREV"="X08T36"."PARTREV")
INNER JOIN
  (SELECT "L62T1"."PARTDSC1" "PARTDSC1",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "A_Pallet_ArtData" ON "L16T3"."SHORTL62"="A_Pallet_ArtData"."SHORTL62"
WHERE "X08T36"."X08RCODE">0
  AND TRUNC(cast("X08T36"."DATREG" AS TIMESTAMP(9)))<=TRUNC(cast(:PQ2 AS TIMESTAMP(9)))
  AND TRUNC(cast("X08T36"."DATREG" AS TIMESTAMP(9)))>=TRUNC(cast(:PQ1 AS TIMESTAMP(9)))
  AND "X08T36"."X08QUANT"<>0
  AND "X08T36"."L54TYPE" IN (1,
                             2)
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