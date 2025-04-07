/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query3 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=jsdlGdylwsjsGyd2qC9w44v9G2s4C8ql29qslMG2 */
SELECT DISTINCT "ITEM_DT"."ITEM_ID" AS "ITEM_ID",
                "ITEM_DT"."BU_CODE_DT" AS "BU_CODE_DT",
                "ITEM_DT"."BU_CODE_SUP_PREF" AS "BU_CODE_SUP_PREF"
FROM "GEMINI"."ITEM_DT" "ITEM_DT"
WHERE "ITEM_DT"."BU_CODE_DT" IN ('017',
                                 '019',
                                 '030',
                                 '061',
                                 '345',
                                 '460',
                                 '490',
                                 '532')