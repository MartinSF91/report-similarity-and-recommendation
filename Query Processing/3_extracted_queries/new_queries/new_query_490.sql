
SELECT trim(BOTH
            FROM "ARTICLE"."ART_NO") "ARTNo",
       trim(BOTH
            FROM "SUPPLIER"."SUP_NO") "ARTSupNo",
       sum("STOCK_INFO"."AVAILABLE_QTY") "STOAvailable_Stock",
       '11' "DC"
FROM "ARTICLE" "ARTICLE",
     "SUPPLIER" "SUPPLIER",
     "STOCK_INFO" "STOCK_INFO",
     "ART_SUP" "ART_SUP"
WHERE "ARTICLE"."ART_NO"="ART_SUP"."ART_NO"
  AND "ART_SUP"."ART_NO"="STOCK_INFO"."ART_NO"
  AND "ART_SUP"."SUP_NO"="STOCK_INFO"."SUP_NO"
  AND "SUPPLIER"."SUP_NO"="ART_SUP"."SUP_NO"
GROUP BY trim(BOTH
              FROM "ARTICLE"."ART_NO"),
         trim(BOTH
              FROM "SUPPLIER"."SUP_NO")