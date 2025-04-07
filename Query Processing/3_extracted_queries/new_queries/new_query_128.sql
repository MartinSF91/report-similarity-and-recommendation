/* user=Piratla Manikanta reportPath= report= queryName=GeminiPrices REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=djCGjyMqjjdCCC948l8MvqqylqChdjGdvs2MhdCy */ SELECT DISTINCT "SQL5"."Article" AS "Article",
                "SQL5"."Supplier" AS "Supplier",
                "SQL5"."ARTSUP" AS "ARTSUP",
                "SQL5"."Line 17 Price" AS "Line_17_Price",
                "SQL5"."Tertial Pricing" AS "Tertial_Pricing",
                "SQL5"."BU Type" AS "BU_Type",
                CASE
                    WHEN NOT ("SQL5"."Tertial Pricing" IS NULL) THEN 'Gemini East'
                    ELSE 'Missing'
                END AS "Data_Source",
                CASE
                    WHEN CASE
                             WHEN NOT ("SQL5"."Tertial Pricing" IS NULL) THEN 'Gemini East'
                             ELSE 'Missing'
                         END LIKE 'Gemini East' THEN 'CALC 17'
                    ELSE 'Missing'
                END AS "CALC_Method"
FROM "SQL5"