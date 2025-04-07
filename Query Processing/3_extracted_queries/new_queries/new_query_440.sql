SELECT DISTINCT trim(BOTH
                     FROM "SQL1"."PARTNO") "PARTNO",
                "SQL1"."PARTREV" "PARTREV",
                "SQL1"."PARTDSC1" "PARTDSC1",
                "SQL1"."MHA" "MHA",
                "SQL1"."RACK" "RACK",
                "SQL1"."HORCOOR" "HORCOOR",
                "SQL1"."VERCOOR" "VERCOOR",
                "SQL1"."AMOONCR" "AMOONCR",
                "SQL1"."MA_LOCK" "MA_LOCK",
                "SQL1"."LOCKCODE" "LOCKCODE",
                "SQL1"."ECARRNO" "ECARRNO"
FROM "SQL1"