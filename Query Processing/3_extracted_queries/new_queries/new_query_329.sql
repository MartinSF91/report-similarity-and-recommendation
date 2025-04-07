/* user=Jhanvi Nandani reportPath= report= queryName=CMR_External_OH_019 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=8qlCyhyjCw9hwMGhq8dqC8dCCCvChdsjwl4v42GC */
SELECT CASE
           WHEN TO_CHAR(TRUNC(CURRENT_DATE), 'DY') = 'SUN' THEN TO_CHAR(TRUNC(CURRENT_DATE), 'iyyyiw')
           ELSE TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'iyyyiw')
       END AS "Week",
       SUBSTR("G08T1"."MHA", 1, 1) AS "Bldg_Number",
       ROUND("G08T1"."CARRVOL" / 1000, 1) AS "Vol_m3",
       "G08T1"."MHA" AS "Mha",
       "G08T1"."LDCT" AS "LDCT",
       '019' AS "BU_Code"
FROM "G08T1" "G08T1"
WHERE "G08T1"."MHA" LIKE '7%'
ORDER BY "Mha" ASC NULLS LAST