/* user=Jhanvi Nandani reportPath= report= queryName=WeeklyAdjustmentsGross REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=MM8C28v224hs2MM4vvwys2d2Mld24lyhM2Mvq8lM */
SELECT "T3"."ARTSUP",
       "T3"."GEM_ART_PRICE",
       to_number("T3"."GEM_ART_PRICE")
FROM
  (SELECT DISTINCT "Gem_Prices_FY23_T1"."Article" AS "Article",
                   "Gem_Prices_FY23_T1"."Supplier" AS "Supplier",
                   "Gem_Prices_FY23_T1"."GEM_ART_PRICE" AS "GEM_ART_PRICE",
                   "Gem_Prices_FY23_T1"."ARTSUP" AS "ARTSUP"
   FROM
     (SELECT A1.ITEM_ID AS "Article",
             A1.BU_CODE_SUP AS "Supplier",
             A1.WS_CODE,
             A1.FYT,
             CASE
                 WHEN A2.UNIT_NO = '02' THEN (A1.ART_PRI_CALC_17/100)
                 ELSE A1.ART_PRI_CALC_17
             END AS GEM_ART_PRICE,
             A1.ITEM_ID||'-'||A1.BU_CODE_SUP artsup,
             A2.UNIT_NO,
             A2.PA_NO,
             SUBSTR(A2.PA_NO, 1, 2) "HFB"
      FROM GEMINI.ITEM_SUP_WS_FYT A1,
           GEMINI.ITEM A2,

        (SELECT A2.ITEM_ID||'-'||A2.BU_CODE_SUP artsup,
                A2.WS_CODE,
                MAX(A2.FYT) maxfyt
         FROM GEMINI.ITEM_SUP_WS_FYT A2
         WHERE --UPDATE TO LUS for EAST or LUW for West
 A2.WS_CODE IN ('LUS')
           AND A2.FYT <= (CASE
                              WHEN TO_CHAR(SYSDATE, 'MM') IN ('09',
                                                              '10',
                                                              '11',
                                                              '12') THEN TO_CHAR(add_months(sysdate, 12), 'YYYY')
                              ELSE TO_CHAR(sysdate, 'YYYY')
                          END|| CASE
                                    WHEN TO_CHAR(SYSDATE, 'MM') IN ('09',
                                                                    '10',
                                                                    '11',
                                                                    '12') THEN '1'
                                    WHEN TO_CHAR(SYSDATE, 'MM') IN ('01',
                                                                    '02',
                                                                    '03',
                                                                    '04') THEN '2'
                                    WHEN TO_CHAR(SYSDATE, 'MM') IN ('05',
                                                                    '06',
                                                                    '07',
                                                                    '08') THEN '3'
                                    ELSE '0'
                                END)
         GROUP BY A2.ITEM_ID||'-'||A2.BU_CODE_SUP,
                  A2.WS_CODE) A3
      WHERE --UPDATE TO LUS for EAST or LUW for West
 A1.WS_CODE IN ('LUS')
        AND A1.ITEM_ID = A2.ITEM_ID
        AND A1.ITEM_ID||'-'||A1.BU_CODE_SUP = A3.artsup
        AND A1.WS_CODE = A3.WS_CODE
        AND --A1.FYT = A3.maxfyt
 A1.FYT = '20223') "Gem_Prices_FY23_T1") "T3" /* user=Jhanvi Nandani reportPath= report= queryName=WeeklyAdjustmentsGross REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=MM8C28v224hs2MM4vvwys2d2Mld24lyhM2Mvq8lM */
SELECT "AdjustmentsGross"."ARTSUP",
       "AdjustmentsGross"."Week",
       "AdjustmentsGross"."LOGGUSER",
       "AdjustmentsGross"."X08RCODE",
       "AdjustmentsGross"."Article",
       "AdjustmentsGross"."Revision",
       "AdjustmentsGross"."Adjustment",
       "AdjustmentsGross"."DIVCODE",
       to_number("AdjustmentsGross"."QTY"),
       TRIM(BOTH
            FROM "AdjustmentsGross"."ARTSUP"),
       "AdjustmentsGross"."x08seqno",
       "AdjustmentsGross"."QTY",
       "AdjustmentsGross"."Date0"
FROM
  (SELECT DISTINCT "Gross"."Date" AS "Date0",
                   "Gross"."PARTNO" AS "Article",
                   "Gross"."PARTREV" AS "Revision",
                   "Gross"."ARTSUP" AS "ARTSUP",
                   "Gross"."DIVCODE" AS "DIVCODE",
                   "Gross"."X08RCODE" AS "X08RCODE",
                   "Gross"."Adjustment" AS "Adjustment",
                   "Gross"."Week" AS "Week",
                   "Gross"."X08SEQNO" AS "x08seqno",
                   "Gross"."LOGGUSER" AS "LOGGUSER",
                   "Gross"."X08QUANT" AS "QTY"
   FROM
     (SELECT trim(x08.partno) partno,
             trim(x08.partrev) partrev,
             trim(x08.partno)||'-'||trim(x08.partrev) artsup,
             x08.divcode,
             x08.logguser,
             x08.x08rcode,
             CASE
                 WHEN x08.x08rcode IN (437,
                                       440,
                                       460) THEN 'Gross (+)'
                 WHEN x08.x08rcode IN (457,
                                       441,
                                       461) THEN 'Gross (-)'
                 WHEN x08.x08rcode IN (390,
                                       391,
                                       392,
                                       393,
                                       394) THEN 'Damages'
                 WHEN x08.x08rcode IN (313) THEN 'Re-label (-)'
                 WHEN x08.x08rcode IN (314) THEN 'Re-label (+)'
                 WHEN x08.x08rcode IN (308) THEN 'Indelivery Corrections (+)'
                 WHEN x08.x08rcode IN (318) THEN 'Indelivery Corrections (-)'
                 WHEN x08.x08rcode IN (435) THEN 'Merge'
                 WHEN x08.x08rcode IN (455) THEN 'Merge'
                 WHEN x08.x08rcode IN (316) THEN 'Discontinued (UTG)'
                 WHEN x08.x08rcode IN (320) THEN 'Shipping Correction (+)'
                 WHEN x08.x08rcode IN (321) THEN 'Shipping Correction (-)'
                 WHEN x08.x08rcode IN ('305') THEN 'Recovery'
                 ELSE 'Unknown'
             END "Adjustment",
             x08.datreg AS "Date",
             TO_CHAR(x08.datreg+1, 'IW') "Week",
             x08.x08quant, /*	SUM(x08.x08quant) qty, */ SUM(x08.x08seqno) x08seqno /*	COUNT(x08.x08seqno) adjcnt */
      FROM x08t3 x08
      WHERE x08.x08rcode IN (440,
                             437,
                             460,
                             450,
                             441,
                             457,
                             461,
                             451)
        AND x08.divcode IN ('345',
                            '532',
                            '017',
                            '019',
                            '490',
                            '460',
                            '061')
        AND x08.x08quant != 0
        AND x08.datreg >=
          (SELECT next_day(trunc(sysdate), 'Sondag') - 7 datstart
           FROM DUAL)
        AND x08.datreg <
          (SELECT next_day(trunc(sysdate), 'Sondag') - 0 datend
           FROM DUAL)
      GROUP BY trim(x08.partno),
               trim(x08.partrev),
               trim(x08.partno)||'-'||trim(x08.partrev),
               x08.divcode,
               x08.x08rcode,
               x08.x08quant,
               x08.logguser,
               CASE
                   WHEN x08.x08rcode IN (437,
                                         440,
                                         460) THEN 'Gross (+)'
                   WHEN x08.x08rcode IN (457,
                                         441,
                                         461) THEN 'Gross (-)'
                   WHEN x08.x08rcode IN (390,
                                         391,
                                         392,
                                         393,
                                         394) THEN 'Damages'
                   WHEN x08.x08rcode IN (313) THEN 'Re-label (-)'
                   WHEN x08.x08rcode IN (314) THEN 'Re-label (+)'
                   WHEN x08.x08rcode IN (308) THEN 'Indelivery Corrections (+)'
                   WHEN x08.x08rcode IN (318) THEN 'Indelivery Corrections (-)'
                   WHEN x08.x08rcode IN (435) THEN 'Merge'
                   WHEN x08.x08rcode IN (455) THEN 'Merge'
                   WHEN x08.x08rcode IN (316) THEN 'Discontinued (UTG)'
                   WHEN x08.x08rcode IN (320) THEN 'Shipping Correction (+)'
                   WHEN x08.x08rcode IN (321) THEN 'Shipping Correction (-)'
                   WHEN x08.x08rcode IN (305) THEN 'Recovery'
                   ELSE 'Unknown'
               END,
               x08.datreg,
               TO_CHAR(x08.datreg+1, 'IW')) "Gross") "AdjustmentsGross"