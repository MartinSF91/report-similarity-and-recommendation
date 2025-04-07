
SELECT "L62T15"."SHORTL62",
       substr("L62T15"."PARTNO", 1, 8),
       trim(BOTH
            FROM "L62T15"."PARTREV"),
       "L62T15"."BALTOT",
       "L62T15"."BALNOTAV",
       "L62T15"."PARTVOL"/1000,
       "L62T15"."CQUANT",
       "L62T15"."PZONE",
       "L62T15"."PMHA",
       "L62T15"."WMHA",
       "L62T15"."WBUFMHA",
       "L62T997"."PANUM",
       CASE
           WHEN "L62T997"."PANUM" like '01%' THEN '01'
           WHEN "L62T997"."PANUM" like '02%' THEN '02'
           WHEN "L62T997"."PANUM" like '03%' THEN '03'
           WHEN "L62T997"."PANUM" like '04%' THEN '04'
           WHEN "L62T997"."PANUM" like '05%' THEN '05'
           WHEN "L62T997"."PANUM" like '06%' THEN '06'
           WHEN "L62T997"."PANUM" like '07%' THEN '07'
           WHEN "L62T997"."PANUM" like '08%' THEN '08'
           WHEN "L62T997"."PANUM" like '09%' THEN '09'
           WHEN "L62T997"."PANUM" like '10%' THEN '10'
           WHEN "L62T997"."PANUM" like '11%' THEN '11'
           WHEN "L62T997"."PANUM" like '12%' THEN '12'
           WHEN "L62T997"."PANUM" like '13%' THEN '13'
           WHEN "L62T997"."PANUM" like '14%' THEN '14'
           WHEN "L62T997"."PANUM" like '15%' THEN '15'
           WHEN "L62T997"."PANUM" like '16%' THEN '16'
           WHEN "L62T997"."PANUM" like '17%' THEN '17'
           WHEN "L62T997"."PANUM" like '18%' THEN '18'
           WHEN "L62T997"."PANUM" like '19%' THEN '19'
           WHEN "L62T997"."PANUM" like '20%' THEN '20'
           WHEN "L62T997"."PANUM" like '50%' THEN '50'
           WHEN "L62T997"."PANUM" like '70%' THEN '70'
           WHEN "L62T997"."PANUM" like '90%' THEN '90'
           WHEN "L62T997"."PANUM" like '95%' THEN '95'
           WHEN "L62T997"."PANUM" like '96%' THEN '96'
           ELSE 'UNDEF'
       END,
       "L62T15"."DIVCODE",
       "L62T15"."PARTWGHT",
       ("G08T1"."AMOONCR"*"L62T15"."PARTVOL")/1000,
       "G08T1"."AMOONCR",
       trim(BOTH
            FROM "L62T15"."PARTNO")
FROM (
        (SELECT "L62T1"."BALNOTAV" "BALNOTAV",
                "L62T1"."BALTOT" "BALTOT",
                "L62T1"."CQUANT" "CQUANT",
                "L62T1"."DIVCODE" "DIVCODE",
                "L62T1"."PARTNO" "PARTNO",
                "L62T1"."PARTREV" "PARTREV",
                "L62T1"."PARTVOL" "PARTVOL",
                "L62T1"."PARTWGHT" "PARTWGHT",
                "L62T1"."PMHA" "PMHA",
                "L62T1"."PZONE" "PZONE",
                "L62T1"."SHORTL62" "SHORTL62",
                "L62T1"."WBUFMHA" "WBUFMHA",
                "L62T1"."WMHA" "WMHA"
         FROM "L62T1" "L62T1"
         WHERE trim(BOTH
                    FROM "L62T1"."DIVCODE") NOT IN ('000',
                                                    '055')) "L62T15"
      INNER JOIN "G08T1" "G08T1" ON "L62T15"."SHORTL62"="G08T1"."SHORTL62")
INNER JOIN
  (SELECT "L62T99"."DIVCODE" "DIVCODE",
          "L62T99"."PANUM" "PANUM",
          "L62T99"."PARTNO" "PARTNO",
          "L62T99"."PARTREV" "PARTREV"
   FROM "L62T99" "L62T99"
   WHERE trim(BOTH
              FROM "L62T99"."DIVCODE") NOT IN ('000',
                                               '055')) "L62T997" ON "L62T15"."PARTNO"="L62T997"."PARTNO"
AND "L62T15"."PARTREV"="L62T997"."PARTREV"
AND "L62T15"."DIVCODE"="L62T997"."DIVCODE"
WHERE ("L62T15"."BALTOT"<>0
       OR "L62T15"."BALNOTAV"<>0)
  AND "L62T15"."PZONE" not  like '%HA%'
  AND "L62T15"."DIVCODE"=25
  AND "L62T15"."WBUFMHA" not  like '%HMJOL%'
  AND trim(BOTH
           FROM "L62T15"."PARTREV") not  like '%10000%'
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
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"