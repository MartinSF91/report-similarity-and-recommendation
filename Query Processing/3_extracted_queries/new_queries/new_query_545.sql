SELECT DISTINCT substr("L62T13"."PARTNO", 1, 8) "ArtFea_ArticleNo",
                trim(BOTH
                     FROM "L62T13"."PARTREV") "ArtFea_SupNo",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName",
                "G08T1"."AMOONCR" "StoPal_PallQty",
                "G08T1"."AVAIL" "StoPal_UnitAvail",
                "G08T1"."AMOONCR" "StoPal_PallQty1",
                "G08T1"."CARRSTAT" "StoPal_PallStat",
                "L62T13"."PICKLOC" "ArtLoc_PickLocType",
                trim(BOTH
                     FROM "G08T1"."MHA") "StoPal_MHA"
FROM "L62T13",
     "G08T1" "G08T1"
WHERE "G08T1"."AMOONCR" IN (0)
  AND "G08T1"."AVAIL" IN (1)
  AND "G08T1"."CARRSTAT" IN (6)
  AND "L62T13"."PICKLOC" IN (0)
  AND trim(BOTH
           FROM "G08T1"."MHA") IN ('52P1',
                                   '52P2',
                                   '52P3',
                                   '52P4',
                                   '52P6',
                                   '53P1',
                                   '54P1',
                                   '54P2',
                                   '56P1',
                                   '56P2',
                                   '56P3')
  AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"