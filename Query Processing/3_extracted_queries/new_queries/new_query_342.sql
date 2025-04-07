/* user=Jhanvi Nandani reportPath= report= queryName=CMR_External_OH_490 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=2qC98dywvhvG8svjvCdhlGyvCqG2yhyvvjys28j8 */
SELECT CASE
           WHEN TO_CHAR(TRUNC(CURRENT_DATE), 'DY') = 'SUN' THEN TO_CHAR(TRUNC(CURRENT_DATE), 'yyyyiw')
           ELSE TO_CHAR(TRUNC(CURRENT_DATE) - 7, 'yyyyiw')
       END AS "Week",
       SUBSTR("G08T1"."MHA", 1, 2) AS "Bldg_Number",
       ROUND("G08T1"."CARRVOL" / 1000, 1) AS "Vol_m3",
       "G08T1"."MHA" AS "Mha",
       "W08T1"."BUILDING" AS "Building",
       CASE
           WHEN "W08T1"."BUILDING" = '6' THEN '6_JDEXT'
           ELSE CASE
                    WHEN "W08T1"."BUILDING" = '7' THEN '7_CLYDE'
                    ELSE '8_LOUIS'
                END
       END AS "Building_Name"
FROM "W08T1" "W08T1"
INNER JOIN "G08T1" "G08T1" ON "W08T1"."TABLEREF" = "G08T1"."MHA"
WHERE "W08T1"."BUILDING" IN ('7',
                             '8',
                             '10',
                             '12')