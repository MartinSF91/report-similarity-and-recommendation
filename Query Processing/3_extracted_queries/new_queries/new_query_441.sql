SELECT DISTINCT substr("L62T13"."PARTNO", 1, 8) "ArtFea_ArticleNo",
                trim(BOTH
                     FROM "L62T13"."PARTREV") "ArtFea_SupNo",
                "L62T13"."SHORTL62" "ArtFea_RefKey_L62",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName",
                "L62T13"."WLDCT" "ArtFea_ClassPallet",
                "G08T1"."LDCT" "StoPal_PallClass",
                "L62T13"."BALTOT" "StoBal_TotBal",
                trim(BOTH
                     FROM "G08T1"."MHA") "StoPal_MHA",
                "G08T1"."ECARRNO" "StoPal_Pallid",
                "L62T13"."SULENGTH" "ArtFea_StoUnitLen",
                "L62T13"."SUWIDTH" "ArtFea_StoUnitWid",
                "L62T13"."SUHEIGHT" "ArtFea_StoUnitHei",
                "L62T13"."PMHA" "ArtLoc_PickMha",
                "G08T1"."RESERVED" "StoPal_UnitReser"
FROM "L62T13",
     "G08T1" "G08T1"
WHERE "G08T1"."LDCT" IN ('E11',
                         'E12',
                         'E21',
                         'E22',
                         'E31',
                         'E32',
                         'E51',
                         'E52',
                         'E53',
                         'E54',
                         'I51',
                         'I52',
                         'I53',
                         'I54')
  AND "L62T13"."BALTOT">0
  AND trim(BOTH
           FROM "G08T1"."MHA") IN ('52R1',
                                   '52R2',
                                   '52R3',
                                   '56R1',
                                   '56R2')
  AND "L62T13"."PMHA" NOT IN ('53P1 ')
  AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"