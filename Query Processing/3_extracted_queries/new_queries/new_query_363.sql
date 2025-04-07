/* user=Piratla Manikanta reportPath= report= queryName=CMLY_532_OH_in_External REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=jws2qqGCyhhv8G9h8vss8Ch9ysMGywlCw88hyqCs */ SELECT "CMR_External_OH_532"."Week" AS "Week",
       "CMR_External_OH_532"."DIVCODE" AS "DIVCODE",
       SUM("CMR_External_OH_532"."Vol_m3") AS "Vol_m3"
FROM "CMR_External_OH_532"
GROUP BY "CMR_External_OH_532"."Week",
         "CMR_External_OH_532"."DIVCODE"