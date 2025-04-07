
SELECT count(DISTINCT CASE
                          WHEN "L16T3"."ORDNO" IS NULL
                               OR "L16T3"."SHORTL62" IS NULL THEN NULL
                          ELSE "L16T3"."ORDNO" || "L16T3"."SHORTL62"
                      END) "IMH_L16_OrdLineNo",
       "L16T3"."L16LCODE" "IMH_LoggCode",
       TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) "IMH_RegDate",
       "L16T3"."ORDNO" "IMH_L16_OrdNo",
       "L16T3"."PARTREV" "IMH_L16_Sup_No",
       "L16T3"."DATREG" "IMH_RegDateTime"
FROM "L16T3" "L16T3"
WHERE "L16T3"."L16LCODE" IN (4)
  AND "L16T3"."ORDNO" NOT IN ('0')
  AND "L16T3"."PARTREV" NOT IN ('10000')
  AND "L16T3"."DATREG">=to_date('2025-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
  AND "L16T3"."DATREG"<(to_date('2025-03-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS') + INTERVAL '1' DAY)
GROUP BY "L16T3"."L16LCODE",
         TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))),
         "L16T3"."ORDNO",
         "L16T3"."PARTREV",
         "L16T3"."DATREG"