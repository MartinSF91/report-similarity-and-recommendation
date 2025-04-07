/* user=Piratla Manikanta reportPath= report= queryName=Cap_East REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=C9svGwjw944G4jhhdM9h999vwj8yM9dCMdvyw8jv */ SELECT "SQL1"."BU_CODE_SEND" AS "BU_CODE_SEND",
       SUM("SQL1"."ORDER_LINES_MAX") AS "ORDER_LINES_MAX",
       SUM("SQL1"."ORDER_LINES_RES") AS "ORDER_LINES_RES",
       TO_CHAR("SQL1"."RESERVATION_DATE" + 1, 'IW') AS "RESERVATION_DATE",
       "SQL1"."DESCRIPTION" AS "DESCRIPTION",
       CASE
           WHEN "SQL1"."DESCRIPTION" LIKE '%Parcel%' THEN 'Parcel'
           WHEN "SQL1"."DESCRIPTION" LIKE '%parcel%' THEN 'Parcel'
           ELSE 'Truck'
       END AS "Delivery_Method"
FROM "SQL1"
WHERE NOT ("SQL1"."DESCRIPTION" LIKE '%Show%')
  AND "SQL1"."RESERVATION_DATE" BETWEEN TRUNC(CURRENT_DATE) - 8 AND TRUNC(CURRENT_DATE) + 90
  AND NOT ("SQL1"."DESCRIPTION" LIKE '%show%')
  AND NOT ("SQL1"."DESCRIPTION" LIKE '%SHOWROOM%')
GROUP BY "SQL1"."BU_CODE_SEND",
         TO_CHAR("SQL1"."RESERVATION_DATE" + 1, 'IW'),
         "SQL1"."DESCRIPTION",
         CASE
             WHEN "SQL1"."DESCRIPTION" LIKE '%Parcel%' THEN 'Parcel'
             WHEN "SQL1"."DESCRIPTION" LIKE '%parcel%' THEN 'Parcel'
             ELSE 'Truck'
         END