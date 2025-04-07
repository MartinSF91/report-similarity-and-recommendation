/* user=Piratla Manikanta reportPath= report= queryName=CMR_External_OH_532 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=yj8jMG484ldvvs2shw99hlhGCqh2h88MyhMjy8jy */
SELECT CASE
           WHEN TO_CHAR(TRUNC(CURRENT_DATE), 'DY') = 'SUN' THEN TO_CHAR(TRUNC(CURRENT_DATE), 'yyyyiw')
           ELSE TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'yyyyiw')
       END AS "Week",
       "L62T1"."DIVCODE" AS "DIVCODE",
       "W08T1"."BUILDING" AS "BUILDING",
       "G08T1"."MHA" AS "MHA",
       ROUND("G08T1"."CARRVOL" / 1000, 1) AS "Vol_m3"
FROM "G08T1" "G08T1"
INNER JOIN "L62T1" "L62T1" ON "G08T1"."SHORTL62" = "L62T1"."SHORTL62"
INNER JOIN "W08T1" "W08T1" ON "W08T1"."TABLEREF" = "G08T1"."MHA"
WHERE "G08T1"."CARRTYPE" = 0
  AND "G08T1"."CARRSTAT" = 6