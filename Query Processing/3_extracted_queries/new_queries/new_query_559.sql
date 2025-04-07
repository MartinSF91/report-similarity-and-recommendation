SELECT DISTINCT "O40T2"."ECARRNO" "DspLine_TrpPackID",
                "O40T2"."LOCATION" "DspLine_TrpPackLoc",
                "O42T2"."SHORTO08" "DspLine_ShortO08",
                "O08T14"."SHORTO08" "OrdGi_RefKeyO08T1",
                "O08T14"."SHORTO04" "OrdGi_RefKeyO04T1",
                "O04T15"."SHORTO04" "OrdGi_RefKeyO04T2",
                "O04T15"."ORDNO" "OrdGi_OrdNo",
                "O04T15"."ORDSTAT" "OrdGi_OrdStat"
FROM "O40T2" "O40T2",
     "O42T2" "O42T2",
     "O08T14",
     "O04T15"
WHERE "O04T15"."ORDSTAT" IN (1,
                             2,
                             4,
                             6,
                             7)
  AND "O40T2"."OCARRNO"="O42T2"."OCARRNO"
  AND "O08T14"."SHORTO08"="O42T2"."SHORTO08"
  AND "O08T14"."DIVCODE"="O04T15"."DIVCODE"
  AND "O08T14"."ORDNO"="O04T15"."ORDNO"
  AND "O08T14"."SHORTO04"="O04T15"."SHORTO04"