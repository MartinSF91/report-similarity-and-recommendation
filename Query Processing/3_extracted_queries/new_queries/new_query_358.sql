/* user=Piratla Manikanta reportPath= report= queryName=CMLY_019_OH_in_External REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=dqqjyCdMwvqlwj94jCGj22hssGylwwCjq822Gwss */ SELECT "CMR_External_OH_019"."Week" AS "Week",
       SUM("CMR_External_OH_019"."Vol_m3") AS "Vol_m3"
FROM "CMR_External_OH_019"
GROUP BY "CMR_External_OH_019"."Week"