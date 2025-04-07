
SELECT trim(BOTH
            FROM "G08T1"."ECARRNO"),
       trim(BOTH
            FROM substr("L62T14"."PARTNO", 1, 8)),
       trim(BOTH
            FROM "L62T14"."PARTREV"),
       "L62T14"."PARTWGHT"*"G08T1"."AMOONCR",
       "G08T1"."AMOONCR",
       trim(BOTH
            FROM "G08T1"."CARRNO"),
       CASE
           WHEN "G08T1"."LDCT" like 'E%' THEN 'E'
           WHEN "G08T1"."LDCT" like 'I%' THEN 'I'
           WHEN "G08T1"."LDCT" like 'H%' THEN 'H'
           ELSE 'UNDEF'
       END,
       "G08T1"."LDCT",
       ("L62T14"."PARTVOL"/1000)*"G08T1"."AMOONCR",
       "L62T14"."PARTVOL"/1000,
       TRUNC(cast("G08T1"."REGDATE" AS TIMESTAMP(9))),
       "G08T1"."STATDATE",
       trim(BOTH
            FROM trim(BOTH
                      FROM "G08T1"."MHA")),
       "G08T1"."RACK",
       "G08T1"."HORCOOR",
       trim(BOTH
            FROM "G08T1"."VERCOOR"),
       CASE
           WHEN "G08T1"."RACK" IN (' ') THEN trim(BOTH
                                                  FROM trim(BOTH
                                                            FROM trim(BOTH
                                                                      FROM "G08T1"."MHA")))
           ELSE trim(BOTH
                     FROM CASE
                              WHEN "G08T1"."RACK" IS NULL
                                   OR "G08T1"."HORCOOR" IS NULL
                                   OR trim(BOTH
                                           FROM "G08T1"."VERCOOR") IS NULL THEN NULL
                              ELSE "G08T1"."RACK" || ' - ' || "G08T1"."HORCOOR" || ' - ' || trim(BOTH
                                                                                                 FROM "G08T1"."VERCOOR")
                          END)
       END,
       trim(BOTH
            FROM "G08T1"."LOCKCODE"),
       CASE
           WHEN "G08T1"."AMOONCR"="L62T14"."CQUANT" THEN 'Full'
           ELSE 'Partial'
       END,
       CASE
           WHEN "G08T1"."AVAIL"=1 THEN 'Yes'
           ELSE 'No'
       END,
       "G08T1"."AVAIL",
       "L62T14"."CQUANT",
       trim(BOTH
            FROM "L62T14"."PARTNO")
FROM
  (SELECT "L62T1"."CQUANT" "CQUANT",
          "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."PARTVOL" "PARTVOL",
          "L62T1"."PARTWGHT" "PARTWGHT",
          "L62T1"."SHORTL62" "SHORTL62"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T14"
INNER JOIN "G08T1" "G08T1" ON "L62T14"."SHORTL62"="G08T1"."SHORTL62"
WHERE "G08T1"."AMOONCR">0
  AND trim(BOTH
           FROM trim(BOTH
                     FROM "G08T1"."MHA")) not  like '%HMJOL%'
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