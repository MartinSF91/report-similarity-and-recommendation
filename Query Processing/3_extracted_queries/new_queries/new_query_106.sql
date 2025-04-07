
SELECT "L16T3"."DATREG",
       TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9))),
       trim(BOTH
            FROM "L16T3"."ECARRNO"),
       "L16T3"."PARTNO",
       SUBSTR("L16T3"."PARTNO", 1, 8),
       SUBSTR("L16T3"."PARTREV", 1, 5),
       "L16T3"."PARTREV",
       "X08T35"."X08RCODE",
       "A_Pallet_ArtData"."PARTDSC1",
       "L16T3"."FMHA",
       SUBSTR("L16T3"."FMHA", 1, 5),
       "L16T3"."FRACK",
       "L16T3"."FHORCOOR",
       "L16T3"."FVERCOOR",
       "L16T3"."LOGGUSER",
       "L16T3"."L16QTY",
       length("L16T3"."LOGGUSER"),
       SUBSTR("L16T3"."LOGGUSER", 1, 2),
       abs("L16T3"."L16QTY"),
       trim(BOTH
            FROM "X08T35"."PARTNO"),
       trim(BOTH
            FROM "X08T35"."PARTREV")
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
                                                    '055')) "X08T35" ON "L16T3"."L16SEQNO"="X08T35"."L16SEQNO"
      AND "L16T3"."DATREG"="X08T35"."DATREG"
      AND "L16T3"."DIVCODE"="X08T35"."DIVCODE"
      AND "L16T3"."PARTNO"="X08T35"."PARTNO"
      AND "L16T3"."PARTREV"="X08T35"."PARTREV")
INNER JOIN
  (SELECT "L62T1"."PARTDSC1" "PARTDSC1",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "A_Pallet_ArtData" ON "L16T3"."SHORTL62"="A_Pallet_ArtData"."SHORTL62"
WHERE TRUNC(cast("X08T35"."DATREG" AS TIMESTAMP(9)))=TRUNC(cast(sysdate - 1 AS TIMESTAMP(9)))
  AND ("L16T3"."L16LCODE"=1
       OR "L16T3"."L16LCODE"=2)
  AND "L16T3"."L16QTY"<>0
  AND "X08T35"."X08RCODE" IN ('393',
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