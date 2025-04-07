SELECT DISTINCT "SQL1"."ITEM_ID" AS "ITEM_ID",
                "SQL1"."ITEM_TYPE" AS "ITEM_TYPE",
                "SQL1"."BU_CODE_SUP" AS "BU_CODE_SUP",
                "SQL1"."BU_TYPE_SUP" AS "BU_TYPE_SUP",
                "SQL1"."PA_NO" AS "PA_NO",
                "SQL1"."ART_PRI_CALC_17" AS "ART_PRI_CALC_17",
                "SQL1"."CUR_CODE" AS "CUR_CODE",
                "SQL1"."FYT" AS "FYT",
                "SQL1"."END_DATE_SALE" AS "END_DATE_SALE",
                "SQL1"."ITEMVOL" AS "ITEMVOL",
                "SQL1"."PRCL_CODE" AS "PRCL_CODE"
FROM "SQL1"
WHERE "SQL1"."END_DATE_SALE" > to_date('01/Jan/2006', 'DD-MON-YY')
ORDER BY "ITEM_ID" ASC NULLS LAST,
         "BU_CODE_SUP" ASC NULLS LAST