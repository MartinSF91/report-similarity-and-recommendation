/* user=Piratla Manikanta reportPath= report= queryName=For_DS_GF Database REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=8q2l994lGj4lMyyq2h9qjssGCMy28d944whw82y2 */ SELECT "Outbound"."DIVCODE" AS "DIVCODE",
       "Outbound"."DEL_TYPE" AS "DEL_TYPE",
       COUNT(DISTINCT "Outbound"."EORDERID") AS "ORDERS",
       SUM("Outbound"."ORDERLINE") AS "ORDERLINES",
       SUM("Outbound"."DELVOL") AS "M3"
FROM "Outbound"
GROUP BY "Outbound"."DIVCODE",
         "Outbound"."DEL_TYPE"