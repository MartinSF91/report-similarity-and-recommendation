SELECT DISTINCT "G08T1"."ECARRNO" "StoPal_Pallid",
                "G08T1"."CARRSTAT" "StoPal_PallStat",
                "G08T1"."MHA" "StoPal_MHA",
                "G08T1"."MHA" "StoPal_MHA1",
                rtrim("L62T13"."PARTNO") "ArtFea_ArticleNo",
                rtrim("L62T13"."PARTREV") "ArtFea_SupNo",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName",
                "G08T1"."RACK" "StoPal_Rack",
                "G08T1"."HORCOOR" "StoPal_HorCoor",
                "G08T1"."VERCOOR" "StoPal_VerCoor",
                "G07T1"."LOTID" "StoPal_G07_Lotid",
                "L62T13"."FLEXDAYS" "ArtFea_FlexDays"
FROM ("G08T1" "G08T1"
      INNER JOIN "G07T1" "G07T1" ON "G08T1"."SHORTG07"="G07T1"."SHORTG07")
LEFT OUTER JOIN "L62T13" ON "G08T1"."SHORTL62"="L62T13"."SHORTL62"
WHERE "G08T1"."CARRSTAT" IN (6)
  AND "G08T1"."MHA" IN ('13P1 ',
                        '13P2 ',
                        '13P3 ',
                        '14P3 ',
                        '14P9 ')