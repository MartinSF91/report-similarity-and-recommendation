SELECT "DT" AS "DT",
       "BU_CODE_SUP" AS "BU_CODE_SUP",
       "ITEM_ID" AS "ITEM_ID",
       SUM("ONHANDQTY") AS "ONHANDQTY",
       SUM("VOL_M3") AS "VOL_M3",
       "BUCODEDT" AS "BUCODEDT",
       "BU_TYPE_DT" AS "BU_TYPE_DT",
       "HFB" AS "HFB",
       SUM("VOL_M3" * "ONHANDQTY") AS "AVAIL_VOL_M3"
FROM "SQL1"
WHERE "ONHANDQTY" <> '0'
GROUP BY "DT",
         "BU_CODE_SUP",
         "ITEM_ID",
         "BUCODEDT",
         "BU_TYPE_DT",
         "HFB"