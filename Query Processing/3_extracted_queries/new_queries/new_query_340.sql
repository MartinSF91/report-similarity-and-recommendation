/* user=Jhanvi Nandani reportPath= report= queryName=On Hand Vol REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=9MMq4wM8hCMvhlysw2924MjhMvywljw4Gsj9vj2w */ SELECT '023' AS "BU_CODE",
       TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'yyyyiw') AS "WEEK",
       "On_Hand"."PARTNO" AS "PARTNO",
       "On_Hand"."PARTREV" AS "PARTREV",
       "DWP"."VOLM3" AS "VOLM3",
       SUM("On_Hand"."ONHANDQTY") AS "ONHANDQTY",
       SUM("On_Hand"."ONHANDQTY" * "DWP"."VOLM3") AS "AVAIL_M3"
FROM "On_Hand"
INNER JOIN "DWP" ON "On_Hand"."PARTNO" = "DWP"."ITEMNO"
AND "On_Hand"."PARTREV" = "DWP"."BUCODSUP"
GROUP BY TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'yyyyiw'),
         "On_Hand"."PARTNO",
         "On_Hand"."PARTREV",
         "DWP"."VOLM3"