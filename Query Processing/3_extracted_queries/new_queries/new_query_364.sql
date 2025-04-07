/* user=Piratla Manikanta reportPath= report= queryName=532_External_OH REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=8GhCyvMwwy2Chl4vMjyMhM9qvhl9sdwvjjd8jvdy */ SELECT "CMR_External_OH_532"."Week" AS "Week",
       "CMR_External_OH_532"."DIVCODE" AS "DIVCODE",
       "CMR_External_OH_532"."BUILDING" AS "BUILDING",
       SUM("CMR_External_OH_532"."Vol_m3") AS "Vol_m3"
FROM "CMR_External_OH_532"
GROUP BY "CMR_External_OH_532"."Week",
         "CMR_External_OH_532"."DIVCODE",
         "CMR_External_OH_532"."BUILDING"