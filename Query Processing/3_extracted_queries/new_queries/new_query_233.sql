SELECT DISTINCT "Query26"."StoPal_Pallid" "StoPal_Pallid",
                "Query26"."ArtLoc_DivCode" "ArtLoc_DivCode",
                "Query26"."StoPal_PallClass" "Pref_LdCT",
                "Query17"."Whs_GroupNo" "Whs_GroupNo",
                'FloorStorage' "Type",
                               "Query26"."StoPal_MHA" "StoPal_MHA",
                               "Query26"."ArtFea_RefKey_L62" "ArtFea_RefKey_L62",
                               "Query26"."ArtFea_ArticleNo" "ArtFea_ArticleNo",
                               "Query26"."StoPal_PallStat" "StoPal_PallStat"
FROM "Query26",
     "Query17"
WHERE "Query17"."Whs_GroupNo" IN ('111',
                                  '112',
                                  '121',
                                  '122',
                                  '131',
                                  '132',
                                  '141',
                                  '142',
                                  '151',
                                  '152')
  AND "Query26"."ArtLoc_DivCode"='015'
  AND "Query26"."StoPal_MHA" not  like '%XD%'
  AND "Query26"."ArtFea_ArticleNo" not  like 'p%'
  AND "Query26"."StoPal_PallStat"='6'
  AND "Query26"."StoPal_PallClass" NOT IN ('EP',
                                           'IP')
  AND "Query26"."StoPal_MHA"="Query17"."Whs_Member"