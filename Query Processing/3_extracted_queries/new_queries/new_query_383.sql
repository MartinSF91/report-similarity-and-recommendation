
SELECT DISTINCT SUBSTR("G30T1"."DELID", 13, 8) "RctHea_RctTrspId",
                "G30T1"."DELID" "RctHea_RctTrspId1",
                "G32T1"."G32STAT" "RctHea_DelStat",
                "G30T1"."DELID" "RctHea_RctTrspId2"
FROM "G30T1" "G30T1",
     "G32T1" "G32T1"
WHERE "G32T1"."G32STAT" IN (40)
  AND LOWER ("G30T1"."DELID") like CASE
                                       WHEN LOWER ('LSC') IS NULL THEN NULL
                                       ELSE '%' || LOWER ('LSC') || '%'
                                   END
  AND "G30T1"."SHORTG30"="G32T1"."SHORTG30"