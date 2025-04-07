/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query2 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=44yylqMGwwsyw4lMMl8jsvwdq8hs484h4y4hwdqq */
SELECT "ITEM_SUP"."ITEM_ID" AS "ITEM_ID",
       "ITEM_SUP"."BU_CODE_SUP" AS "BU_CODE_SUP",
       SUM("ITEM_SUP"."ITEM_QTY_PALL") AS "ITEM_QTY_PALL",
       SUM("ITEM_SUP"."ITEM_QTY_MPACK") AS "ITEM_QTY_MPACK"
FROM "GEMINI"."ITEM_SUP" "ITEM_SUP"
GROUP BY "ITEM_SUP"."ITEM_ID",
         "ITEM_SUP"."BU_CODE_SUP"