/* user=Piratla Manikanta reportPath= report= queryName=Cap_West REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=Gyvqj99vMwqjy9vjlGyyssy48MvMMqwC2CGvGCs9 */ SELECT "SQL2"."BU_CODE_SEND" AS "BU_CODE_SEND",
       SUM("SQL2"."ORDER_LINES_MAX") AS "ORDER_LINES_MAX",
       SUM("SQL2"."ORDER_LINES_RES") AS "ORDER_LINES_RES",
       TO_CHAR("SQL2"."RESERVATION_DATE" + 1, 'IW') AS "RESERVATION_DATE",
       "SQL2"."DESCRIPTION" AS "DESCRIPTION",
       CASE
           WHEN "SQL2"."DESCRIPTION" LIKE '%Parcel%' THEN 'Parcel'
           WHEN "SQL2"."DESCRIPTION" LIKE '%parcel%' THEN 'Parcel'
           ELSE 'Truck'
       END AS "Delivery_Method"
FROM "SQL2"
WHERE NOT ("SQL2"."DESCRIPTION" LIKE '%show%')
  AND "SQL2"."RESERVATION_DATE" BETWEEN TRUNC(CURRENT_DATE) - 8 AND TRUNC(CURRENT_DATE) + 90
  AND NOT ("SQL2"."DESCRIPTION" LIKE '%Show%')
  AND NOT ("SQL2"."DESCRIPTION" LIKE '%SHOWROOM%')
GROUP BY "SQL2"."BU_CODE_SEND",
         TO_CHAR("SQL2"."RESERVATION_DATE" + 1, 'IW'),
         "SQL2"."DESCRIPTION",
         CASE
             WHEN "SQL2"."DESCRIPTION" LIKE '%Parcel%' THEN 'Parcel'
             WHEN "SQL2"."DESCRIPTION" LIKE '%parcel%' THEN 'Parcel'
             ELSE 'Truck'
         END