
SELECT "L62T14"."SHORTL62",
       substr("L62T14"."PARTNO", 1, 8),
       trim(BOTH
            FROM "L62T14"."PARTREV"),
       "L62T14"."BALTOT",
       "L62T14"."BALNOTAV",
       "L62T14"."PARTVOL"/1000,
       "L62T14"."PARTWGHT",
       "L62T14"."CQUANT",
       "L62T14"."PZONE",
       "L62T14"."PMHA",
       ("G08T1"."AMOONCR"*"L62T14"."PARTVOL")/1000,
       "G08T1"."AMOONCR",
       trim(BOTH
            FROM "L62T14"."PARTNO")
FROM
  (SELECT "L62T1"."BALNOTAV" "BALNOTAV",
          "L62T1"."BALTOT" "BALTOT",
          "L62T1"."CQUANT" "CQUANT",
          "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."PARTVOL" "PARTVOL",
          "L62T1"."PARTWGHT" "PARTWGHT",
          "L62T1"."PMHA" "PMHA",
          "L62T1"."PZONE" "PZONE",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T14"
INNER JOIN "G08T1" "G08T1" ON "L62T14"."SHORTL62"="G08T1"."SHORTL62"
WHERE "L62T14"."BALTOT"<>0
  OR "L62T14"."BALNOTAV"<>0
  SELECT "A_PRICES_L62T1"."PRICE",
         "A_PRICES_L62T1"."ITEM_NO",
         "A_PRICES_L62T1"."BU_CODE_SUP", (coalesce("A_PRICES_L62T1"."BU_TYPE_SUP", 'SUP'))
  FROM
    (SELECT "PRICES_VW"."ITEM_TYPE" "ITEM_TYPE",
            "PRICES_VW"."ITEM_NO" "ITEM_NO",
            "PRICES_VW"."BU_TYPE_SUP" "BU_TYPE_SUP",
            "PRICES_VW"."BU_CODE_SUP" "BU_CODE_SUP",
            "PRICES_VW"."PRICE" "PRICE"
     FROM "PRICES_VW" "PRICES_VW"
     WHERE "PRICES_VW"."BU_TYPE"='CDC'
       AND "PRICES_VW"."BU_CODE" IN ('003')
       AND "PRICES_VW"."PRICE">=0
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"