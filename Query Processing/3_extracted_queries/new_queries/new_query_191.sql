
SELECT "L62T1"."PARTNO" AS "PARTNO",
       "L62T1"."PARTREV" AS "PARTREV",
       "L62T1"."PARTDSC1" AS "PARTDSC1",
       COUNT("G08T1"."AMOONCR") AS "AMOONCR",
       SUM("L62T1"."SUVOL") AS "SUVOL",
       (COUNT("G08T1"."AMOONCR") * SUM("L62T1"."SUVOL")) / 1000 AS "SU_Vol_m3",
       TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS "REGDATE",
       TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY') AS "Current_Year",
       TRUNC(CURRENT_DATE) AS "Current_Date0",
       "G08T1"."LOCKCODE" AS "LOCKCODE",
       SUM("G08T1"."CARRSTAT") AS "CARRSTAT",
       "G08T1"."STATDATE" AS "STATDATE",
       "L62T1"."DIVCODE" AS "DIVCODE",
       (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) AS "Days",
       CASE
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 1095 THEN '>GT 36 Months'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 1095
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 730 THEN ' 24-35 Months'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 730
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 365 THEN '12-23 Months'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 365
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 182 THEN '6-11 Months'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 182 THEN 'LT 6 Months'
       END AS "SU_Age_Grouping",
       To_Date('09/01/13', 'MM/DD/YY') AS "Hard_Code_BA_Date",
       CASE
           WHEN SUM("G08T1"."CARRSTAT") = 8
                AND MIN("G08T1"."STATDATE") > MIN(To_Date('09/01/13', 'MM/DD/YY')) THEN 1
           ELSE 0
       END AS "DateCheck",
       SUM("G08T1"."DELAMO") AS "DELAMO",
       SUM("G08T1"."AMOONCR") AS "AMOONCR1"
FROM "G08T1" "G08T1"
INNER JOIN "L62T1" "L62T1" ON "G08T1"."SHORTL62" = "L62T1"."SHORTL62"
WHERE "G08T1"."CARRTYPE" = '0'
  AND "G08T1"."CARRSTAT" = '6'
GROUP BY "L62T1"."PARTNO",
         "L62T1"."PARTREV",
         "L62T1"."PARTDSC1",
         TRUNC(cast("G08T1"."REGDATE" AS DATE)),
         TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY'),
         TRUNC(CURRENT_DATE),
         "G08T1"."LOCKCODE",
         "G08T1"."STATDATE",
         "L62T1"."DIVCODE", (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))), CASE
                                                                                                                                                    WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 1095 THEN '>GT 36 Months'
                                                                                                                                                    WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 1095
                                                                                                                                                         AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 730 THEN ' 24-35 Months'
                                                                                                                                                    WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 730
                                                                                                                                                         AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 365 THEN '12-23 Months'
                                                                                                                                                    WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 365
                                                                                                                                                         AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) > 182 THEN '6-11 Months'
                                                                                                                                                    WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TRUNC(cast("G08T1"."REGDATE" AS DATE)) AS TIMESTAMP))) <= 182 THEN 'LT 6 Months'
                                                                                                                                                END,
                                                                                                                                                To_Date('09/01/13', 'MM/DD/YY')