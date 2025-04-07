SELECT DISTINCT rtrim("L62T13"."PARTNO") "ArtFea_ArticleNo",
                rtrim("L62T13"."PARTREV") "ArtFea_SupNo",
                "L62T13"."CQUANT" "ArtFea_DefPallQty",
                "L62T13"."HUQTY" "ArtFea_DefMLPQty",
                "L62T13"."DIVCODE" "ArtLoc_DivCode"
FROM "L62T13"
WHERE "L62T13"."DIVCODE" IN ('310')