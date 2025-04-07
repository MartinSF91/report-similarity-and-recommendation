/* user=Piratla Manikanta reportPath= report= queryName=019_External_OH REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=vy4wMvwys22hhhGhq2CssG2hjqGvhddh28lw2lv9 */ SELECT "CMR_External_OH_019"."Week" AS "Week",
       "CMR_External_OH_019"."Bldg_Number" AS "Bldg_Number",
       SUM("CMR_External_OH_019"."Vol_m3") AS "Vol_m3"
FROM "CMR_External_OH_019"
GROUP BY "CMR_External_OH_019"."Week",
         "CMR_External_OH_019"."Bldg_Number"