/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query4 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=4qMhvlGswq2Mqq922dCqvyhhywh8CsCqywjjyhvy */ SELECT to_char(TRUNC(cast("Query3"."IMH_RegDate" AS DATE)), 'yyyy/mm/dd') AS "Date0",
       CASE
           WHEN COUNT(CASE
                          WHEN "Query3"."IMH_ToMHA" LIKE '%IN1'
                               OR "Query3"."IMH_ToMHA" LIKE '%IN2'
                               AND "Query3"."ArtLoc_PrefStockArea" <> '12R1' THEN "Query3"."IMH_LoggCode"
                          ELSE NULL
                      END) IS NULL THEN 0
           ELSE COUNT(CASE
                          WHEN "Query3"."IMH_ToMHA" LIKE '%IN1'
                               OR "Query3"."IMH_ToMHA" LIKE '%IN2'
                               AND "Query3"."ArtLoc_PrefStockArea" <> '12R1' THEN "Query3"."IMH_LoggCode"
                          ELSE NULL
                      END)
       END AS "Silo_pallets"
FROM "Query3"
WHERE to_char(TRUNC(cast("Query3"."IMH_RegDate" AS DATE)), 'yyyy/mm/dd') = to_char(TRUNC(cast(sysdate AS DATE)) - 2, 'yyyy/mm/dd')
GROUP BY to_char(TRUNC(cast("Query3"."IMH_RegDate" AS DATE)), 'yyyy/mm/dd')