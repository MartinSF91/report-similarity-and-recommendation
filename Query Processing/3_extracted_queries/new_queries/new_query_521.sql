
SELECT "R08T1"."SHORTR08",
       "L16T3"."SHORTO08",
       trim(BOTH
            FROM "O08T18"."PARTNO"),
       trim(BOTH
            FROM "O08T18"."PARTREV"),
       "L62T19"."SHORTL62",
       "O08T18"."SHORTO08",
       "L16T3"."L16QTY",
       "O08T18"."REGDATE",
       "L62T19"."PARTDSC1",
       "O08T18"."DELQUANT",
       trim(BOTH
            FROM "L62T19"."PARTNO"),
       trim(BOTH
            FROM "L62T19"."PARTREV"),
       trim(BOTH
            FROM "X08T311"."PARTNO"),
       trim(BOTH
            FROM "X08T311"."PARTREV")
FROM ((
         (SELECT "O08T1"."DELQUANT" "DELQUANT",
                 "O08T1"."PARTNO" "PARTNO",
                 "O08T1"."PARTREV" "PARTREV",
                 "O08T1"."REGDATE" "REGDATE",
                 "O08T1"."SHORTL62" "SHORTL62",
                 "O08T1"."SHORTO08" "SHORTO08",
                 "O08T1"."SHORTR08" "SHORTR08"
          FROM "O08T1" "O08T1"
          WHERE trim(BOTH
                     FROM "O08T1"."DIVCODE") NOT IN ('005',
                                                     '310')) "O08T18"
       INNER JOIN
         (SELECT "L62T1"."PARTDSC1" "PARTDSC1",
                 "L62T1"."PARTNO" "PARTNO",
                 "L62T1"."PARTREV" "PARTREV",
                 "L62T1"."SHORTL62" "SHORTL62"
          FROM "L62T1" "L62T1"
          WHERE trim(BOTH
                     FROM "L62T1"."DIVCODE") NOT IN ('005',
                                                     '310')) "L62T19" ON "O08T18"."SHORTL62"="L62T19"."SHORTL62")
      INNER JOIN "R08T1" "R08T1" ON "O08T18"."SHORTR08"="R08T1"."SHORTR08")
LEFT OUTER JOIN ("L16T3" "L16T3"
                 INNER JOIN
                   (SELECT "X08T3"."DATREG" "DATREG",
                           "X08T3"."DIVCODE" "DIVCODE",
                           "X08T3"."L16SEQNO" "L16SEQNO",
                           "X08T3"."PARTNO" "PARTNO",
                           "X08T3"."PARTREV" "PARTREV"
                    FROM "X08T3" "X08T3"
                    WHERE trim(BOTH
                               FROM "X08T3"."DIVCODE") NOT IN ('005',
                                                               '310')) "X08T311" ON "L16T3"."L16SEQNO"="X08T311"."L16SEQNO"
                 AND "L16T3"."DATREG"="X08T311"."DATREG"
                 AND "L16T3"."DIVCODE"="X08T311"."DIVCODE"
                 AND "L16T3"."PARTNO"="X08T311"."PARTNO"
                 AND "L16T3"."PARTREV"="X08T311"."PARTREV") ON "O08T18"."SHORTO08"="L16T3"."SHORTO08"
WHERE "R08T1"."SHORTR08"=545716
  AND NOT ("L16T3"."L16QTY"=0)
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
       AND "PRICES_VW"."BU_CODE" IN ('004')
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_X08T3"
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
       AND "PRICES_VW"."BU_CODE" IN ('004')
       AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"