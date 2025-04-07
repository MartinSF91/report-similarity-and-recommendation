/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query4 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=l2Cjvq98Ms8ysdM9C8wllv2wqysslljj98wvhyd8 */
SELECT "ITEM_SUP_DT_UI"."ITEM_ID" AS "ITEM_ID",
       "ITEM_SUP_DT_UI"."BU_CODE_SUP" AS "BU_CODE_SUP",
       "ITEM_SUP_DT_UI"."BU_CODE_DT" AS "BU_CODE_DT",
       SUM("ITEM_SUP_DT_UI"."ITEM_QTY_PALL") AS "ITEM_QTY_PALL"
FROM "GEMINI"."ITEM_SUP_DT_UI" "ITEM_SUP_DT_UI"
GROUP BY "ITEM_SUP_DT_UI"."ITEM_ID",
         "ITEM_SUP_DT_UI"."BU_CODE_SUP",
         "ITEM_SUP_DT_UI"."BU_CODE_DT"