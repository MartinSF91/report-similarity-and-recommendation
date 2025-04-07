/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query7 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=ysMwGsMsyCqldM9Cwvj99Cs9G492GCvqs4MM24d2 */
SELECT "Query6"."Qty_in_Silo",
       "Query6"."qty_Not_in_Silo",
       "Query12"."pall_per_week",
       "Query12"."pall_per_day",
       "Query12"."ords_per_week_",
       "Query12"."Ords_per_day",
       "Query12"."ArtFea_RefKey_L62",
       "Query12"."ArtFea_ArticleNo",
       "Query12"."ArtFea_SupNo",
       "Query12"."ArtFea_ArticleName",
       "Query12"."rank0",
       "Query12"."ArtFea_RefKey_L63",
       "Query12"."ArtFea_DefPallQty",
       "Query12"."ArtLoc_PrefStockArea",
       "Query12"."ArtLoc_PrefStorageZone",
       "Query12"."Art_Descr2_partdsc2_",
       "Query12"."ArtFea_ClassPallet",
       "Query12"."days_between",
       "Query12"."total"
FROM
  (SELECT "Query5"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
          SUM("Query5"."Qty_in_Silo") AS "Qty_in_Silo",
          SUM("Query5"."qty_Not_in_Silo") AS "qty_Not_in_Silo"
   FROM
     (SELECT "SQ0_Query5"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
             "SQ0_Query5"."ArtLoc_PrefStockArea" AS "ArtLoc_PrefStockArea",
             SUM("SQ0_Query5"."Sum1") OVER(PARTITION BY "SQ0_Query5"."ArtFea_RefKey_L62") AS "Qty_in_Silo",
             SUM("SQ0_Query5"."Sum11") OVER(PARTITION BY "SQ0_Query5"."ArtFea_RefKey_L62") AS "qty_Not_in_Silo"
      FROM
        (SELECT "L62T12"."SHORTL62" AS "ArtFea_RefKey_L62",
                "L62T12"."WMHA" AS "ArtLoc_PrefStockArea",
                SUM(CASE
                        WHEN "G08T1"."CARRSTAT" = '6'
                             AND "G08T1"."MHA" = '12R1' THEN "G08T1"."AMOONCR"
                        ELSE 0
                    END) AS "Sum1",
                SUM(CASE
                        WHEN "G08T1"."CARRSTAT" = '6'
                             AND "G08T1"."MHA" <> '12R1'
                             AND "G08T1"."MHA" <> '11PE'
                             AND "G08T1"."MHA" <> '11PI' THEN "G08T1"."AMOONCR"
                        ELSE 0
                    END) AS "Sum11"
         FROM "G08T1" "G08T1"
         LEFT OUTER JOIN
           (SELECT "L62T1"."CQUANT" AS "CQUANT",
                   "L62T1"."DIVCODE" AS "DIVCODE",
                   "L62T1"."PARTDSC1" AS "PARTDSC1",
                   "L62T1"."PARTDSC2" AS "PARTDSC2",
                   "L62T1"."PARTNO" AS "PARTNO",
                   "L62T1"."PARTREV" AS "PARTREV",
                   "L62T1"."SHORTL62" AS "SHORTL62",
                   "L62T1"."WLDCT" AS "WLDCT",
                   "L62T1"."WMHA" AS "WMHA",
                   "L62T1"."WZONE" AS "WZONE"
            FROM "L62T1" "L62T1"
            WHERE NOT (TRIM(BOTH
                            FROM "L62T1"."DIVCODE") IN ('018',
                                                        '020',
                                                        '053',
                                                        '087',
                                                        '235',
                                                        '269',
                                                        '405',
                                                        '424',
                                                        '930',
                                                        '945'))) "L62T12" ON "G08T1"."SHORTL62" = "L62T12"."SHORTL62"
         GROUP BY "L62T12"."SHORTL62",
                  "L62T12"."WMHA") "SQ0_Query5") "Query5"
   GROUP BY "Query5"."ArtFea_RefKey_L62") "Query6"
FULL OUTER JOIN
  (SELECT "SQ0_Query12"."pall_per_week" AS "pall_per_week",
          "SQ0_Query12"."ArtFea_SupNo" AS "ArtFea_SupNo",
          "SQ0_Query12"."ArtFea_ArticleNo" AS "ArtFea_ArticleNo",
          "SQ0_Query12"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
          RANK() OVER(
                      ORDER BY "SQ0_Query12"."pall_per_week" ASC NULLS LAST) AS "rank0",
          "SQ0_Query12"."total" AS "total",
          "SQ0_Query12"."days_between" AS "days_between",
          "SQ0_Query12"."ArtFea_ClassPallet" AS "ArtFea_ClassPallet",
          "SQ0_Query12"."Art_Descr2_partdsc2_" AS "Art_Descr2_partdsc2_",
          "SQ0_Query12"."ArtLoc_PrefStorageZone" AS "ArtLoc_PrefStorageZone",
          "SQ0_Query12"."ArtLoc_PrefStockArea" AS "ArtLoc_PrefStockArea",
          "SQ0_Query12"."ArtFea_DefPallQty" AS "ArtFea_DefPallQty",
          "SQ0_Query12"."ArtFea_RefKey_L63" AS "ArtFea_RefKey_L63",
          "SQ0_Query12"."ArtFea_ArticleName" AS "ArtFea_ArticleName",
          "SQ0_Query12"."ArtFea_SupNo" AS "ArtFea_SupNo1",
          "SQ0_Query12"."Ords_per_day" AS "Ords_per_day",
          "SQ0_Query12"."ords_per_week_" AS "ords_per_week_",
          "SQ0_Query12"."pall_per_day" AS "pall_per_day"
   FROM
     (SELECT "Query8"."ArtFea_SupNo" AS "ArtFea_SupNo",
             "Query8"."ArtFea_ArticleNo" AS "ArtFea_ArticleNo",
             "Query8"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
             "Query8"."days_between" AS "days_between",
             "Query8"."ArtFea_ClassPallet" AS "ArtFea_ClassPallet",
             "Query8"."Art_Descr2_partdsc2_" AS "Art_Descr2_partdsc2_",
             "Query8"."ArtLoc_PrefStorageZone" AS "ArtLoc_PrefStorageZone",
             "Query8"."ArtLoc_PrefStockArea" AS "ArtLoc_PrefStockArea",
             "Query8"."ArtFea_DefPallQty" AS "ArtFea_DefPallQty",
             "Query8"."ArtFea_RefKey_L63" AS "ArtFea_RefKey_L63",
             "Query8"."ArtFea_ArticleName" AS "ArtFea_ArticleName",
             SUM("Query8"."pall_per_week") AS "pall_per_week",
             SUM("Query8"."total") AS "total",
             SUM("Query8"."Ords_per_day") AS "Ords_per_day",
             SUM("Query8"."ords_per_week_") AS "ords_per_week_",
             SUM("Query8"."pall_per_day") AS "pall_per_day"
      FROM
        (SELECT CASE
                    WHEN SUM("Query4"."pall_per_week") IS NULL THEN 0.01
                    WHEN SUM("Query4"."pall_per_week") < 0.01 THEN 0.01
                    ELSE SUM("Query4"."pall_per_week")
                END AS "pall_per_week",
                SUM("Query4"."pall_per_day") AS "pall_per_day",
                SUM("Query4"."ords_per_week_") AS "ords_per_week_",
                SUM("Query4"."Ords_per_day") AS "Ords_per_day",
                "Query4"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
                "Query4"."ArtFea_ArticleNo" AS "ArtFea_ArticleNo",
                "Query4"."ArtFea_SupNo" AS "ArtFea_SupNo",
                "Query4"."ArtFea_ArticleName" AS "ArtFea_ArticleName",
                "Query4"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L63",
                "Query4"."ArtFea_DefPallQty" AS "ArtFea_DefPallQty",
                "Query4"."ArtLoc_PrefStockArea" AS "ArtLoc_PrefStockArea",
                "Query4"."ArtLoc_PrefStorageZone" AS "ArtLoc_PrefStorageZone",
                "Query4"."Art_Descr2_partdsc2_" AS "Art_Descr2_partdsc2_",
                "Query4"."ArtFea_ClassPallet" AS "ArtFea_ClassPallet",
                "Query4"."days_between" AS "days_between",
                SUM("Query4"."total") AS "total"
         FROM
           (SELECT "Query3"."ArtFea_ArticleNo" AS "ArtFea_ArticleNo",
                   "Query3"."ArtFea_SupNo" AS "ArtFea_SupNo",
                   "Query3"."ArtFea_ArticleName" AS "ArtFea_ArticleName",
                   "Query3"."ArtFea_RefKey_L62" AS "ArtFea_RefKey_L62",
                   "Query3"."ArtFea_DefPallQty" AS "ArtFea_DefPallQty",
                   CASE
                       WHEN MIN("Query2"."days_between") < 7 THEN 0
                       ELSE SUM("Query2"."total") / NULLIF(MIN("Query2"."days_between"), 0)
                   END AS "Ords_per_day",
                   CASE
                       WHEN MIN("Query2"."days_between") < 7 THEN 0
                       ELSE SUM("Query2"."total") / NULLIF(MIN("Query2"."days_between"), 0)
                   END * 7 AS "ords_per_week_",
                         CASE
                             WHEN MIN("Query2"."days_between") < 7 THEN 0
                             ELSE SUM("Query2"."total") / NULLIF(MIN("Query2"."days_between"), 0)
                         END / NULLIF(MIN("Query3"."ArtFea_DefPallQty"), 0) AS "pall_per_day",
                               (CASE
                                    WHEN MIN("Query2"."days_between") < 7 THEN 0
                                    ELSE SUM("Query2"."total") / NULLIF(MIN("Query2"."days_between"), 0)
                                END * 7) / NULLIF(MIN("Query3"."ArtFea_DefPallQty"), 0) AS "pall_per_week",
                               "Query3"."ArtLoc_PrefStockArea" AS "ArtLoc_PrefStockArea",
                               "Query3"."ArtLoc_PrefStorageZone" AS "ArtLoc_PrefStorageZone",
                               "Query3"."Art_Descr2_partdsc2_" AS "Art_Descr2_partdsc2_",
                               "Query3"."ArtFea_ClassPallet" AS "ArtFea_ClassPallet",
                               "Query2"."days_between" AS "days_between",
                               SUM("Query2"."total") AS "total"
            FROM
              (SELECT DISTINCT rtrim("L62T1"."PARTNO") AS "ArtFea_ArticleNo",
                               rtrim("L62T1"."PARTREV") AS "ArtFea_SupNo",
                               "L62T1"."PARTDSC1" AS "ArtFea_ArticleName",
                               "L62T1"."SHORTL62" AS "ArtFea_RefKey_L62",
                               "L62T1"."CQUANT" AS "ArtFea_DefPallQty",
                               "L62T1"."WMHA" AS "ArtLoc_PrefStockArea",
                               "L62T1"."WZONE" AS "ArtLoc_PrefStorageZone",
                               "L62T1"."PARTDSC2" AS "Art_Descr2_partdsc2_",
                               "L62T1"."WLDCT" AS "ArtFea_ClassPallet",
                               "L62T1"."DIVCODE" AS "ArtLoc_DivCode"
               FROM "L62T1" "L62T1"
               WHERE (rtrim("L62T1"."PARTNO") LIKE '0%'
                      OR rtrim("L62T1"."PARTNO") LIKE '1%'
                      OR rtrim("L62T1"."PARTNO") LIKE '2%'
                      OR rtrim("L62T1"."PARTNO") LIKE '3%'
                      OR rtrim("L62T1"."PARTNO") LIKE '4%'
                      OR rtrim("L62T1"."PARTNO") LIKE '5%'
                      OR rtrim("L62T1"."PARTNO") LIKE '6%'
                      OR rtrim("L62T1"."PARTNO") LIKE '7%'
                      OR rtrim("L62T1"."PARTNO") LIKE '8%'
                      OR rtrim("L62T1"."PARTNO") LIKE '9%')
                 AND "L62T1"."DIVCODE" = '015'
                 AND NOT (TRIM(BOTH
                               FROM "L62T1"."DIVCODE") IN ('018',
                                                           '020',
                                                           '053',
                                                           '087',
                                                           '235',
                                                           '269',
                                                           '405',
                                                           '424',
                                                           '930',
                                                           '945'))) "Query3"
            FULL OUTER JOIN
              (SELECT "Query10"."IMH_Shortl62" AS "IMH_Shortl62",
                      "Query10"."days_between" AS "days_between",
                      SUM("Query10"."total") AS "total"
               FROM
                 (SELECT "SQ0_Query10"."IMH_Shortl62" AS "IMH_Shortl62",
                         "SQ0_Query10"."days_between" AS "days_between",
                         SUM("SQ0_Query10"."Sum1") OVER(PARTITION BY "SQ0_Query10"."IMH_Shortl62") AS "total"
                  FROM
                    (SELECT "D1"."C0" AS "IMH_Shortl62",
                            "D1"."C1" AS "days_between",
                            SUM("D1"."C2") AS "Sum1"
                     FROM
                       (SELECT "Query9"."IMH_Shortl62" AS "C0",
                               (TRUNC(CAST(MAX("Query9"."IMH_RegDate") OVER(PARTITION BY "Query9"."IMH_Shortl62") AS TIMESTAMP)) - TRUNC(CAST(MIN("Query9"."IMH_RegDate") OVER(PARTITION BY "Query9"."IMH_Shortl62") AS TIMESTAMP))) AS "C1",
                               "Query9"."IMH_PickQty" AS "C2"
                        FROM
                          (SELECT DISTINCT "BO_L16T3"."DIVCODE" AS "IMH_DivCode",
                                           "BO_L16T3"."L16LCODE" AS "IMH_LoggCode",
                                           "BO_L16T3"."SHORTL62" AS "IMH_Shortl62",
                                           "BO_L16T3"."ORDTYPE" AS "IMH_L16_OrdType",
                                           "BO_L16T3"."L16QTY" AS "IMH_PickQty",
                                           TRUNC(cast("BO_L16T3"."DATREG" AS DATE)) AS "IMH_RegDate"
                           FROM "BO_L16T3" "BO_L16T3"
                           WHERE "BO_L16T3"."L16LCODE" = '4'
                             AND "BO_L16T3"."ORDTYPE" <> '14'
                             AND "BO_L16T3"."DIVCODE" = '015') "Query9") "D1"
                     GROUP BY "D1"."C0",
                              "D1"."C1") "SQ0_Query10") "Query10"
               GROUP BY "Query10"."IMH_Shortl62",
                        "Query10"."days_between") "Query2" ON "Query2"."IMH_Shortl62" = "Query3"."ArtFea_RefKey_L62"
            GROUP BY "Query3"."ArtFea_ArticleNo",
                     "Query3"."ArtFea_SupNo",
                     "Query3"."ArtFea_ArticleName",
                     "Query3"."ArtFea_RefKey_L62",
                     "Query3"."ArtFea_DefPallQty",
                     "Query3"."ArtLoc_PrefStockArea",
                     "Query3"."ArtLoc_PrefStorageZone",
                     "Query3"."Art_Descr2_partdsc2_",
                     "Query3"."ArtFea_ClassPallet",
                     "Query2"."days_between") "Query4"
         GROUP BY "Query4"."ArtFea_RefKey_L62",
                  "Query4"."ArtFea_ArticleNo",
                  "Query4"."ArtFea_SupNo",
                  "Query4"."ArtFea_ArticleName",
                  "Query4"."ArtFea_DefPallQty",
                  "Query4"."ArtLoc_PrefStockArea",
                  "Query4"."ArtLoc_PrefStorageZone",
                  "Query4"."Art_Descr2_partdsc2_",
                  "Query4"."ArtFea_ClassPallet",
                  "Query4"."days_between") "Query8"
      GROUP BY "Query8"."ArtFea_SupNo",
               "Query8"."ArtFea_ArticleNo",
               "Query8"."ArtFea_RefKey_L62",
               "Query8"."days_between",
               "Query8"."ArtFea_ClassPallet",
               "Query8"."Art_Descr2_partdsc2_",
               "Query8"."ArtLoc_PrefStorageZone",
               "Query8"."ArtLoc_PrefStockArea",
               "Query8"."ArtFea_DefPallQty",
               "Query8"."ArtFea_RefKey_L63",
               "Query8"."ArtFea_ArticleName") "SQ0_Query12") "Query12" ON "Query12"."ArtFea_RefKey_L62" = "Query6"."ArtFea_RefKey_L62"
WHERE NOT ("Query12"."ArtFea_ArticleName" IS NULL )/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query7 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=ysMwGsMsyCqldM9Cwvj99Cs9G492GCvqs4MM24d2 */
  SELECT "Query11"."COUNT_PARTNO_"
  FROM
    (SELECT DISTINCT "SQL1"."COUNT(PARTNO)" AS "COUNT_PARTNO_"
     FROM
       (SELECT count(partno)
        FROM L62T1
        WHERE divcode='015') "SQL1") "Query11"