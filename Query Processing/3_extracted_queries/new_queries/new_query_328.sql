
SELECT DISTINCT trim(BOTH
                     FROM "ARTICLE"."ART_NO") "ARTNo",
                trim(BOTH
                     FROM "SUPPLIER"."SUP_NO") "ARTSupNo",
                "ARTICLE"."ART_NAME" "ARTName",
                "ART_SUP"."ART_PRI_CALC_17" "ARTPriceInve",
                "ART_SUP"."ART_QTY_PALL" "ARTQtyPallLoc"
FROM "ARTICLE" "ARTICLE",
     "SUPPLIER" "SUPPLIER",
     "ART_SUP" "ART_SUP"
WHERE "ARTICLE"."ART_NO"="ART_SUP"."ART_NO"
  AND "SUPPLIER"."SUP_NO"="ART_SUP"."SUP_NO"