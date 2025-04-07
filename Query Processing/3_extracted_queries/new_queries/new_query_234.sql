/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query3 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=ChyGyvsy2dCCG4jj8l9wjyG229vhhCMsqsM8428j */ SELECT DISTINCT "Query2"."PZONE" AS "PZONE",
                "Query1"."L54UNIQ" AS "L54UNIQ",
                "Query2"."CQUANT" AS "CQUANT",
                "Query2"."WZONE" AS "WZONE",
                "Query2"."WLDCT" AS "WLDCT",
                "Query2"."WMHA" AS "WMHA",
                "Query2"."PMHA" AS "PMHA",
                "Query2"."PARTDSC1" AS "PARTDSC1",
                "Query2"."SHORTL62" AS "SHORTL62",
                "Query1"."PARTREV" AS "PARTREV",
                "Query1"."PARTNO" AS "PARTNO",
                "Query2"."DIVCODE" AS "DIVCODE",
                "Query1"."ADMUNIT" AS "ADMUNIT"
FROM "Query1"
INNER JOIN "Query2" ON "Query1"."PARTNO" = "Query2"."PARTNO"
AND "Query1"."PARTREV" = "Query2"."PARTREV"