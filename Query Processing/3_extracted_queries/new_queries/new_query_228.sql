
SELECT DISTINCT trim(BOTH
                     FROM "ARTICLE"."ART_NO") "ARTNo",
                trim(BOTH
                     FROM "SUPPLIER"."SUP_NO") "ARTSupNo",
                "ARTICLE"."ART_NAME" "ARTName",
                "ART_SUP"."CARR_TYPE" "ARTPalType",
                concat("ART_SUP"."CARR_TYPE", "ART_SUP"."CARR_CODE") "ARTPalTypeClass",
                "ART_SUP"."ART_LEN_PALL" "ARTLenPallLoc",
                "ART_SUP"."ART_WID_PALL" "ARTWidPalLoc",
                "ART_SUP"."ART_HEI_PALL" "ARTHeiPallLoc",
                "ART_SUP"."ART_QTY_MPACK" "ARTQtyMPackLoc",
                "ART_SUP"."ART_QTY_PALL" "ARTQtyPallLoc",
                "ART_SUP"."ART_QTY_MPACK_SYS" "ARTQtyMPackSys",
                "ART_SUP"."ART_QTY_PALL_SYS" "ARTQtyPallSys"
FROM "ARTICLE" "ARTICLE",
     "SUPPLIER" "SUPPLIER",
     "ART_SUP" "ART_SUP"
WHERE "ARTICLE"."ART_NO"="ART_SUP"."ART_NO"
  AND "SUPPLIER"."SUP_NO"="ART_SUP"."SUP_NO"