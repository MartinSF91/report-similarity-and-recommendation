
SELECT DISTINCT "YMT11T1"."ELUID" "YUniLu_LoadingUnit",
                "YMT11T1"."LUNOTE" "YUniLu_LuNote",
                "YMT11T1"."CARRIER" "YUniLu_Carrier",
                "YMT11T1"."LUTYPE" "YUniLu_LuType",
                "YMT11T1"."YARDITIM" "YUniLu_YardInYime",
                "YMT11T1"."PLUSTAT" "YUniLu_PhysStat"
FROM "YMT11T1" "YMT11T1"
WHERE "YMT11T1"."LUTYPE" IN ('C40DV       ',
                             'C40HC       ',
                             'C40HPW      ',
                             'C45DV       ',
                             'C45HC       ',
                             'C45HCP      ',
                             'C45HPP      ',
                             'C45HPW      ',
                             'C45PW       ')
  AND "YMT11T1"."CARRIER" IN ('MARITIME TRANSP')
  AND "YMT11T1"."PLUSTAT"=1