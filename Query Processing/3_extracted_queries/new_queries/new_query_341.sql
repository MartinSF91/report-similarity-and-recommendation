
SELECT DISTINCT TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) "IMH_RegDate",
                "L16T3"."L16LCODE" "IMH_LoggCode",
                "L16T3"."FMHA" "IMH_FromMHA",
                "L16T3"."MHA" "IMH_ToMHA",
                concat(concat("L16T3"."RACK", "L16T3"."HORCOOR"), ltrim("L16T3"."VERCOOR")) "IMH_ToPlaceNo",
                "L16T3"."SHORTL62" "IMH_Shortl62",
                "L16T3"."RACK" "IMH_ToRack",
                "L16T3"."HORCOOR" "IMH_ToFloor",
                "L16T3"."VERCOOR" "IMH_ToLevel",
                "L16T3"."LDCT" "IMH_StUnType",
                "L16T3"."L16QTY" "IMH_PickQty",
                "L16T3"."LOGGUSER" "IMH_LoggUser",
                "L16T3"."FRACK" "IMH_FromRack"
FROM "L16T3" "L16T3"
WHERE "L16T3"."L16LCODE" IN (3)
  AND "L16T3"."FMHA" IN ('14RQ ',
                         '15R1 ',
                         '16R1 ',
                         '16RP ',
                         '17R1 ',
                         '18R1 ',
                         '14RP ',
                         '18RP ',
                         '17RP ',
                         '15RP ')
  AND "L16T3"."MHA" IN ('14PH ',
                        '14PS ',
                        '15PMH',
                        '16M9 ',
                        '16PH ',
                        '16PM ',
                        '17MW ',
                        '17PA ',
                        '16PMH')
  AND TRUNC(cast("L16T3"."DATREG" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-25' AND DATE '2025-03-25'
  AND concat(concat("L16T3"."RACK", "L16T3"."HORCOOR"), ltrim("L16T3"."VERCOOR")) NOT IN ('70199996',
                                                                                          '70199997',
                                                                                          '70199998',
                                                                                          '70199999')