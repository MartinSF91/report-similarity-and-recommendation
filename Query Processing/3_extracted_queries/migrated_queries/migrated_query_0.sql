SELECT "PARTNO" AS "PARTNO",
       "PARTREV" AS "PARTREV",
       "PARTDSC1" AS "PARTDSC1",
       "AMOONCR" AS "AMOONCR",
       "SUVOL" AS "SUVOL",
       (MIN("AMOONCR") * MIN("SUVOL")) / 1000 AS "SU_VOL_M3",
       "ECARRNO" AS "ECARRNO",
       "LDCT" AS "LDCT",
       "REGDATE" AS "REGDATE",
       TO_CHAR("REGDATE", 'YYYY') AS "SU_YEAR",
       TRUNC(CURRENT_DATE) AS "CURRENT_DATE_",
       TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY') - TO_CHAR("REGDATE", 'YYYY') AS "SU_AGE",
       (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) AS "DAYS",
       TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY') AS "CURRENT_YEAR",
       TO_CHAR(TRUNC(CURRENT_DATE), 'MON DD, YYYY HH:MI AM') AS "CURRENT_DATE0",
       "DIVCODE" AS "DIVCODE",
       "LOCKCODE" AS "LOCKCODE",
       "LOTID" AS "LOTID",
       TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS "PRODDATE",
       "G08PDATE" AS "G08PDATE",
       "FLEXDAYS" AS "FLEXDAYS",
       TO_CHAR("REGDATE", 'MM/DD/YYYY') AS "REG_DATE_TD",
       CASE
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '1095' THEN '>GT 36 MONTHS'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '1095'
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '730' THEN '24-35 MONTHS'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '730'
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '365' THEN '12-23 MONTHS'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '365'
                AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '182' THEN '6-11 MONTHS'
           WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '182' THEN 'LT 6 MONTHS'
       END AS "SU_AGE_GROUPING"
FROM "G08T1" "G08T1"
INNER JOIN "L62T1" "L62T1" ON "SHORTL62" = "SHORTL62"
LEFT OUTER JOIN "G07T1" "G07T1" ON "SHORTG07" = "SHORTG07"
AND "SHORTL62" = "SHORTL62"
WHERE "CARRTYPE" = '0'
  AND "CARRSTAT" = '6'
  AND "DIVCODE" IN ('009',
                            '061')
GROUP BY "PARTNO",
         "PARTREV",
         "PARTDSC1",
         "AMOONCR",
         "SUVOL",
         "ECARRNO",
         "LDCT",
         "REGDATE",
         TO_CHAR("REGDATE", 'YYYY'),
         TRUNC(CURRENT_DATE),
         TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY') - TO_CHAR("REGDATE", 'YYYY'), (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))), TO_CHAR(TRUNC(CURRENT_DATE), 'YYYY'),
                                                                                                                                                                                                                                      TO_CHAR(TRUNC(CURRENT_DATE), 'MON DD, YYYY HH:MI AM'),
                                                                                                                                                                                                                                      "DIVCODE",
                                                                                                                                                                                                                                      "LOCKCODE",
                                                                                                                                                                                                                                      "LOTID",
                                                                                                                                                                                                                                      TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY'),
                                                                                                                                                                                                                                      "G08PDATE",
                                                                                                                                                                                                                                      "FLEXDAYS",
                                                                                                                                                                                                                                      TO_CHAR("REGDATE", 'MM/DD/YYYY'),
                                                                                                                                                                                                                                      CASE
                                                                                                                                                                                                                                          WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '1095' THEN '>GT 36 MONTHS'
                                                                                                                                                                                                                                          WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '1095'
                                                                                                                                                                                                                                               AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '730' THEN '24-35 MONTHS'
                                                                                                                                                                                                                                          WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '730'
                                                                                                                                                                                                                                               AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '365' THEN '12-23 MONTHS'
                                                                                                                                                                                                                                          WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '365'
                                                                                                                                                                                                                                               AND (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) > '182' THEN '6-11 MONTHS'
                                                                                                                                                                                                                                          WHEN (TRUNC(CAST(TRUNC(CURRENT_DATE) AS TIMESTAMP)) - TRUNC(CAST(TO_DATE(TO_CHAR("PRODDATE", 'MON DD, YYYY'), 'MON DD, YYYY') AS TIMESTAMP))) <= '182' THEN 'LT 6 MONTHS'
                                                                                                                                                                                                                                      END
ORDER BY "PARTNO" ASC NULLS LAST