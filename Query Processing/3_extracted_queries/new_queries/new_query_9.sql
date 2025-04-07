SELECT DISTINCT "PARTNO" AS "PARTNO",
                "PARTREV" AS "PARTREV",
                "ONHANDQTY" AS "ONHANDQTY",
                "VOL_M3" AS "VOL_M3",
                '013' AS "DT",
                "ONHANDQTY" * "VOL_M3" AS "AVAIL_VOL_M3",
                '013' AS "BU_CODE_DT",
                'CDC' AS "BU_TYPE_DT"
FROM "SQL1"