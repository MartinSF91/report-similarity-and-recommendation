
SELECT CASE
           WHEN substr("L62T14"."PARTNO", 1, 8) like 'Mixed Pa' THEN 'Mixed Pallet'
           WHEN substr("L62T14"."PARTNO", 1, 8) like 'packed g' THEN 'packed goods'
           ELSE substr("L62T14"."PARTNO", 1, 8)
       END,
       trim(BOTH
            FROM "L62T14"."PARTREV"),
       CASE
           WHEN CASE
                    WHEN substr("L62T14"."PARTNO", 1, 8) like 'Mixed Pa' THEN 'Mixed Pallet'
                    WHEN substr("L62T14"."PARTNO", 1, 8) like 'packed g' THEN 'packed goods'
                    ELSE substr("L62T14"."PARTNO", 1, 8)
                END IN (' ') THEN ' '
           ELSE 'CDC'
       END,
       CASE
           WHEN CASE
                    WHEN substr("L62T14"."PARTNO", 1, 8) like 'Mixed Pa' THEN 'Mixed Pallet'
                    WHEN substr("L62T14"."PARTNO", 1, 8) like 'packed g' THEN 'packed goods'
                    ELSE substr("L62T14"."PARTNO", 1, 8)
                END IN (' ') THEN ' CWIS-NA '
           ELSE 'CWIS'
       END,
       "L62T14"."BALTOT",
       "L62T14"."BALNOTAV",
       "L62T14"."SHORTL62",
       CASE
           WHEN CASE
                    WHEN (CASE
                              WHEN substr("L62T14"."PARTNO", 1, 8) like 'Mixed Pa' THEN 'Mixed Pallet'
                              WHEN substr("L62T14"."PARTNO", 1, 8) like 'packed g' THEN 'packed goods'
                              ELSE substr("L62T14"."PARTNO", 1, 8)
                          END IN (' ')) THEN ' CWIS-NA '
                    ELSE 'CWIS'
                END ='CWIS' THEN 'CALC 52'
           ELSE 'Missing'
       END,
       trim(BOTH
            FROM 'Missing CALC 52 Price'),
       trim(BOTH
            FROM 'OK'),
       trim(BOTH
            FROM "L62T14"."PARTNO")
FROM
  (SELECT "L62T1"."BALNOTAV" "BALNOTAV",
          "L62T1"."BALTOT" "BALTOT",
          "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('015',
                                              'AL')) "L62T14"
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
     AND "PRICES_VW"."BU_CODE" IN ('017')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"