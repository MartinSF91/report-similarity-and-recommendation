SELECT DISTINCT CASE
                    WHEN to_char("R08T1"."OPPDATE", 'DDMMYYYY') IS NULL
                         OR trim(BOTH
                                 FROM "R08T1"."ROUTENO") IS NULL
                         OR trim(BOTH
                                 FROM "R08T1"."TRIPNO") IS NULL THEN NULL
                    ELSE to_char("R08T1"."OPPDATE", 'DDMMYYYY') || '-' || trim(BOTH
                                                                               FROM "R08T1"."ROUTENO") || '-' || trim(BOTH
                                                                                                                      FROM "R08T1"."TRIPNO")
                END "Dsp_LS_ID",
                "O04T15"."EORDERID" "OrdLine_ExtOrderID",
                "O08T16"."DELQUANT" "OrdLine_DelQuant",
                "O08T16"."PARTNO" "OrdLine_O08_ArtNo",
                trim(BOTH
                     FROM "L62T17"."PARTREV") "ArtFea_SupNo",
                "L62T17"."PARTDSC1" "ArtFea_ArticleName",
                "O08T16"."REQQUANT" "OrdLine_ReqQunat",
                "R08T1"."NOPORDL" "DspDet_NofPickOrdlin",
                "R08T1"."CALCVOL" "DspDet_CalcVol",
                "R08T1"."CALCWGHT" "DspDet_CalcWei",
                "O08T16"."DELQUANT" "DspLine_CDU_PickedArtQty"
FROM "R08T1" "R08T1",
     "O04T15",
     "O08T16",
     "L62T17"
WHERE CASE
          WHEN to_char("R08T1"."OPPDATE", 'DDMMYYYY') IS NULL
               OR trim(BOTH
                       FROM "R08T1"."ROUTENO") IS NULL
               OR trim(BOTH
                       FROM "R08T1"."TRIPNO") IS NULL THEN NULL
          ELSE to_char("R08T1"."OPPDATE", 'DDMMYYYY') || '-' || trim(BOTH
                                                                     FROM "R08T1"."ROUTENO") || '-' || trim(BOTH
                                                                                                            FROM "R08T1"."TRIPNO")
      END like '17032025-1009_4-1'
  AND "O08T16"."SHORTR08"="R08T1"."SHORTR08"
  AND "O08T16"."SHORTL62"="L62T17"."SHORTL62"
  AND "O08T16"."SHORTO04"="O04T15"."SHORTO04"