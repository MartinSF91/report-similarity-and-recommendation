
SELECT DISTINCT trim(BOTH
                     FROM "L30T1"."MHA") "WhsLoc_MhaName",
                "L30T1"."RACK" "WhsLoc_Rack",
                "L30T1"."HORCOOR" "WhsLoc_X",
                trim(BOTH
                     FROM "L30T1"."VERCOOR") "WhsLoc_Y",
                "L30T1"."LOCSTAT" "WhsLoc_Status",
                "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
                "L30T1"."ZONE" "WhsLoc_Zone",
                to_number(to_char(trunc(sysdate), 'IW')) "TI_Current_WeekNo",
                TRUNC(cast(sysdate AS TIMESTAMP(9))) "TI_Today"
FROM "L30T1" "L30T1"
WHERE LOWER (trim(BOTH
                  FROM "L30T1"."MHA")) not  like CASE
                                                     WHEN LOWER ('L49M') IS NULL THEN NULL
                                                     ELSE '%' || LOWER ('L49M') || '%'
                                                 END