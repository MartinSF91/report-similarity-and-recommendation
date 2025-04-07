/* user=Piratla Manikanta reportPath= report= queryName=Outbound REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=C8M2jdG22vwh924vjGly89G84sw8yGMvCGdjsCGs */ SELECT "SQL2"."DIVCODE" AS "DIVCODE",
       TO_CHAR("SQL2"."STATDATE", 'mm/dd/yyyy') AS "SHIPDATE",
       TO_CHAR("SQL2"."STATDATE", 'YYYYMM') AS "MONTH0",
       "SQL2"."EORDERID" AS "EORDERID",
       COUNT(DISTINCT "SQL2"."EORDERID") AS "ORDERS",
       SUM(1) AS "ORDERLINE",
       SUM("SQL2"."DELVOL") AS "DELVOL",
       CASE
           WHEN "SQL2"."ORDTYPE" = '12' THEN 'Parcel'
           ELSE 'Truck'
       END AS "DEL_TYPE",
       "SQL2"."SHORTO08" AS "SHORTO08"
FROM "SQL2"
GROUP BY "SQL2"."DIVCODE",
         TO_CHAR("SQL2"."STATDATE", 'mm/dd/yyyy'),
         TO_CHAR("SQL2"."STATDATE", 'YYYYMM'),
         "SQL2"."EORDERID",
         CASE
             WHEN "SQL2"."ORDTYPE" = '12' THEN 'Parcel'
             ELSE 'Truck'
         END,
         "SQL2"."SHORTO08"