SELECT DISTINCT "L62T13"."PMHA" "ArtLoc_PickMha",
                "G08T1"."ECARRNO" "StoPal_Pallid",
                trim(BOTH
                     FROM "G08T1"."MHA") "StoPal_MHA",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName"
FROM "L62T13",
     "G08T1" "G08T1"
WHERE "L62T13"."PMHA" IN ('54P2 ')
  AND trim(BOTH
           FROM "G08T1"."MHA") IN ('57R1')
  AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"