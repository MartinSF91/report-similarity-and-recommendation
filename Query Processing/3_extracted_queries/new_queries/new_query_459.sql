
SELECT DISTINCT TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) "IMH_RegDate",
                "L16T3"."L16LCODE" "IMH_LoggCode",
                "L16T3"."FMHA" "IMH_FromMHA",
                "L16T3"."FRACK" "IMH_FromRack",
                concat(concat("L16T3"."FRACK", "L16T3"."FHORCOOR"), ltrim("L16T3"."FVERCOOR")) "IMH_FromPlaceNo",
                "L16T3"."FHORCOOR" "IMH_FromFloor",
                "L16T3"."FVERCOOR" "IMH_FromLevel",
                "L16T3"."L16SEQNO" "IMH_SeqNo",
                "L16T3"."ADMUNIT" "IMH_Queue",
                "L16T3"."PARTNO" "IMH_L16_Art_No",
                "L16T3"."PARTREV" "IMH_L16_Sup_No",
                "L16T3"."SHORTL62" "IMH_Shortl62",
                "L16T3"."ORDTYPE" "IMH_L16_OrdType",
                "L16T3"."LOGGUSER" "IMH_LoggUser",
                "L16T3"."L16WGHT" "IMH_PickWght",
                "L16T3"."L16QTY" "IMH_PickQty",
                "L16T3"."PARTNO" "IMH_L16_Art_No1",
                "L16T3"."ORDNO" "IMH_L16_OrdNo",
                trim(BOTH
                     FROM "L16T3"."ECARRNO") "IMH_StUn",
                TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) "IMH_RegDate1",
                "L16T3"."DATREG" "IMH_RegDateTime",
                "L16T3"."PICKRNO" "IMH_PickRound",
                "L16T3"."SHORTR08" "IMH_Shortr08",
                CASE
                    WHEN "L16T3"."ORDNO" IS NULL
                         OR "L16T3"."PARTNO" IS NULL
                         OR "L16T3"."PARTREV" IS NULL
                         OR "L16T3"."FMHA" IS NULL
                         OR "L16T3"."FRACK" IS NULL
                         OR "L16T3"."FHORCOOR" IS NULL
                         OR "L16T3"."FVERCOOR" IS NULL THEN NULL
                    ELSE "L16T3"."ORDNO" || "L16T3"."PARTNO" || "L16T3"."PARTREV" || "L16T3"."FMHA" || "L16T3"."FRACK" || "L16T3"."FHORCOOR" || "L16T3"."FVERCOOR"
                END "clef"
FROM "L16T3" "L16T3"
WHERE "L16T3"."L16LCODE" IN (4)
  AND TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-19' AND DATE '2025-03-26'