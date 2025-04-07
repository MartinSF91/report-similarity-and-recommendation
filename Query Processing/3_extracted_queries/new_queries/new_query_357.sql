/* user=Piratla Manikanta reportPath= report= queryName=CMR_External_OH_019 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=sq9sG2vwjyGGlvlsjqM88GCvs2d8dMjv8GG4vyss */
SELECT CASE
           WHEN TO_CHAR(TRUNC(CURRENT_DATE), 'DY') = 'SUN' THEN TO_CHAR(TRUNC(CURRENT_DATE), 'yyyyiw')
           ELSE TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'yyyyiw')
       END AS "Week",
       SUBSTR("G08T1"."MHA", 1, 1) AS "Bldg_Number",
       ROUND("G08T1"."CARRVOL" / 1000, 1) AS "Vol_m3"
FROM "G08T1" "G08T1"
WHERE "G08T1"."MHA" LIKE '7%'