/* user=Piratla Manikanta reportPath= report= queryName=All Price REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=j4ld4sCl949sshd8wyMG2CGjyywyhlqw924CCljw */
SELECT TRIM(BOTH
            FROM "L62T10"."PARTREV"),
       TRIM(BOTH
            FROM "L62T10"."PARTNO"),
       CASE
           WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'Mixed Pa' THEN 'Mixed Pallet'
           WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'packed g' THEN 'packed goods'
           ELSE substr("L62T10"."PARTNO", 1, 8)
       END,
       CASE
           WHEN CASE
                    WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'Mixed Pa' THEN 'Mixed Pallet'
                    WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'packed g' THEN 'packed goods'
                    ELSE substr("L62T10"."PARTNO", 1, 8)
                END IN (' ') THEN ' '
           ELSE 'CDC'
       END,
       CASE
           WHEN CASE
                    WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'Mixed Pa' THEN 'Mixed Pallet'
                    WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'packed g' THEN 'packed goods'
                    ELSE substr("L62T10"."PARTNO", 1, 8)
                END IN (' ') THEN ' CWIS-NA '
           ELSE 'CWIS'
       END,
       "L62T10"."BALTOT",
       "L62T10"."BALNOTAV",
       "L62T10"."SHORTL62",
       CASE
           WHEN CASE
                    WHEN CASE
                             WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'Mixed Pa' THEN 'Mixed Pallet'
                             WHEN substr("L62T10"."PARTNO", 1, 8) LIKE 'packed g' THEN 'packed goods'
                             ELSE substr("L62T10"."PARTNO", 1, 8)
                         END IN (' ') THEN ' CWIS-NA '
                    ELSE 'CWIS'
                END = 'CWIS' THEN 'CALC 52'
           ELSE 'Missing'
       END
FROM
  (SELECT "L62T1"."BALNOTAV" AS "BALNOTAV",
          "L62T1"."BALTOT" AS "BALTOT",
          "L62T1"."PARTNO" AS "PARTNO",
          "L62T1"."PARTREV" AS "PARTREV",
          "L62T1"."SHORTL62" AS "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE NOT (TRIM(BOTH
                   FROM "L62T1"."DIVCODE") IN ('----'))) "L62T10" /* user=Piratla Manikanta reportPath= report= queryName=All Price REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=j4ld4sCl949sshd8wyMG2CGjyywyhlqw924CCljw */
SELECT "A_PRICES_L62T12"."BU_CODE_SUP",
       "A_PRICES_L62T12"."ITEM_NO",
       "A_PRICES_L62T12"."PRICE"
FROM
  (SELECT "A_PRICES_L62T1"."ITEM_TYPE" AS "ITEM_TYPE",
          "A_PRICES_L62T1"."ITEM_NO" AS "ITEM_NO",
          "A_PRICES_L62T1"."BU_TYPE_SUP" AS "BU_TYPE_SUP",
          "A_PRICES_L62T1"."BU_CODE_SUP" AS "BU_CODE_SUP",
          "A_PRICES_L62T1"."PRICE" AS "PRICE"
   FROM "PRICES_VW" "A_PRICES_L62T1"
   WHERE "A_PRICES_L62T1"."BU_CODE" IN ('005')
     AND "A_PRICES_L62T1"."BU_TYPE" = 'CDC') "A_PRICES_L62T12"
WHERE COALESCE("A_PRICES_L62T12"."BU_TYPE_SUP", 'SUP') = 'SUP'
  AND "A_PRICES_L62T12"."ITEM_TYPE" = 'ART'