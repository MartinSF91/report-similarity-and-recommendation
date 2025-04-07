SELECT DISTINCT trim(BOTH
                     FROM "G08T1"."MHA") "StoPal_MHA",
                "G08T1"."CARRSTAT" "StoPal_PallStat",
                "G08T1"."AMOONCR" "StoPal_PallQty",
                substr("L62T13"."PARTNO", 1, 8) "ArtFea_ArticleNo",
                trim(BOTH
                     FROM "L62T13"."PARTREV") "ArtFea_SupNo",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName",
                TRUNC(cast("G08T1"."REGDATE" AS TIMESTAMP(9))) "StoPal_PallRegDate",
                "G08T1"."STATDATE" "StoPal_UpdDateTime",
                "G08T1"."AMOONCR" "StoPal_PallQty1",
                "G08T1"."LOCKCODE" "StoPal_BlockCode",
                "G08T1"."ECARRNO" "StoPal_Pallid"
FROM "G08T1" "G08T1",
     "L62T13"
WHERE trim(BOTH
           FROM "G08T1"."MHA") IN ('5039')
  AND "G08T1"."CARRSTAT" IN (6)
  AND "G08T1"."AMOONCR">0
  AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"