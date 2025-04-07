
SELECT "A_Pallet_ArtData"."PARTDSC1",
       "L16T3"."L16QTY",
       "L16T3"."DATREG",
       TRUNC(cast("X08T36"."DATREG" AS TIMESTAMP(9))),
       "X08T36"."X08RCODE",
       SUBSTR("L16T3"."PARTNO", 1, 8),
       "L16T3"."LOGGUSER",
       abs("L16T3"."L16QTY"),
       trim(BOTH
            FROM "L16T3"."ECARRNO"),
       trim(BOTH
            FROM "X08T36"."PARTNO"),
       trim(BOTH
            FROM "X08T36"."PARTREV")
FROM ("L16T3" "L16T3"
      INNER JOIN
        (SELECT "X08T3"."DATREG" "DATREG",
                "X08T3"."DIVCODE" "DIVCODE",
                "X08T3"."L16SEQNO" "L16SEQNO",
                "X08T3"."PARTNO" "PARTNO",
                "X08T3"."PARTREV" "PARTREV",
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
WHERE TRUNC(cast("X08T36"."DATREG" AS TIMESTAMP(9)))>=last_day(add_months(sysdate, -2))+1
  AND TRUNC(cast("X08T36"."DATREG" AS TIMESTAMP(9)))<=last_day(add_months(sysdate, -1))
  AND ("L16T3"."L16LCODE"=1
       OR "L16T3"."L16LCODE"=2)
  AND "L16T3"."L16QTY"<>0
  AND "X08T36"."X08RCODE" IN ('393',
                              '308',
                              '437',
                              '440',
                              '450',
                              '460',
                              '318',
                              '441',
                              '451',
                              '457',
                              '461',
                              '390',
                              '391',
                              '392',
                              '394',
                              '305',
                              '395',
                              '306',
                              '310',
                              '311',
                              '312',
                              '317',
                              '316',
                              '330',
                              '260',
                              '261',
                              '315',
                              '380',
                              '480')
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