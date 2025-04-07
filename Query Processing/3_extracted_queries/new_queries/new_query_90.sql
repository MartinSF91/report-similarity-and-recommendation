SELECT DISTINCT substr("L62T13"."PARTNO", 1, 8) "ArtFea_ArticleNo",
                trim(BOTH
                     FROM "L62T13"."PARTREV") "ArtFea_SupNo",
                trim(BOTH
                     FROM "G08T1"."MHA") "StoPal_MHA",
                "G08T1"."HORCOOR" "StoPal_HorCoor",
                "G08T1"."RACK" "StoPal_Rack",
                trim(BOTH
                     FROM "G08T1"."VERCOOR") "StoPal_VerCoor",
                "L34T1"."L34SEQNO" "StoPal_Seqno",
                "G08T1"."CARRSTAT" "StoPal_PallStat",
                "G08T1"."AMOONCR" "StoPal_PallQty",
                "L62T13"."PARTDSC1" "ArtFea_ArticleName",
                "G08T1"."ECARRNO" "StoPal_Pallid"
FROM "L62T13",
     "G08T1" "G08T1",
     "L34T1" "L34T1"
WHERE "G08T1"."CARRSTAT" IN (6)
  AND "G08T1"."AMOONCR">0
  AND "L62T13"."PARTDSC1" IN ('SKORVA Mittelbalken verzinkt  ')
  AND trim(BOTH
           FROM "G08T1"."MHA") IN ('54R1')
  AND substr("L62T13"."PARTNO", 1, 8) IN ('20298405')
  AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
  AND "G08T1"."CARRNO"="L34T1"."CARRNO"
  AND "G08T1"."HORCOOR"="L34T1"."HORCOOR"
  AND "G08T1"."MHA"="L34T1"."MHA"
  AND "G08T1"."RACK"="L34T1"."RACK"
  AND "G08T1"."VERCOOR"="L34T1"."VERCOOR"