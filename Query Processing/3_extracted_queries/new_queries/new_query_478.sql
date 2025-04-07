
SELECT "AstroAdjustments9"."Date1" "c0",
       "AstroAdjustments9"."Transaction_Group" "c1",
       "AstroAdjustments9"."Trans_Type" "c2",
       "AstroAdjustments9"."Division" "c3",
       "AstroAdjustments9"."Article" "c4",
       "AstroAdjustments9"."Supplier" "c5",
       "AstroAdjustments9"."Adj_Qty" "c6",
       "AstroAdjustments9"."Log_Id" "c7",
       "AstroAdjustments9"."Buffer_MHA" "c8",
       "AstroAdjustments9"."Pick_MHA" "c9",
       "AstroAdjustments9"."Pallet_Class" "c10"
FROM
  (SELECT DISTINCT "SQL2"."Date" "Date1",
                   "SQL2"."Transaction Group" "Transaction_Group",
                   "SQL2"."Trans Type" "Trans_Type",
                   "SQL2"."Division" "Division",
                   "SQL2"."Article" "Article",
                   "SQL2"."Supplier" "Supplier",
                   "SQL2"."Adj Qty" "Adj_Qty",
                   "SQL2"."Log Id" "Log_Id",
                   "SQL2"."Buffer MHA" "Buffer_MHA",
                   "SQL2"."Pick MHA" "Pick_MHA",
                   "SQL2"."Pallet Class" "Pallet_Class"
   FROM
     (SELECT TO_CHAR(x08.datreg, 'MM/DD/YYYY') "Date",
             CASE
                 WHEN x08.x08rcode IN (390,
                                       391,
                                       392,
                                       393,
                                       394,
                                       395) THEN 'Interal Damages (390-395)'
                 WHEN x08.x08rcode IN (440,
                                       437,
                                       460,
                                       450) THEN 'Gross Adj + (440,437,460,450)'
                 WHEN x08.x08rcode IN (441,
                                       457,
                                       461,
                                       451) THEN 'Gross Adj - (441,457,461,451)'
                 WHEN x08.x08rcode IN (305) THEN 'Recovery (305)'
                 ELSE 'Other'
             END "Transaction Group",
             x08.x08rcode "Trans Type",
             trim(x08.divcode) "Division",
             trim(x08.partno) "Article",
             trim(x08.partrev) "Supplier",
             x08.x08quant "Adj Qty",
             x08.x08seqno "Log Id",
             l62.wmha "Buffer MHA",
             l62.pmha "Pick MHA",
             l62.wldct "Pallet Class"
      FROM x08t3 x08
      INNER JOIN l62t1 l62 ON (l62.partno = x08.partno
                               AND l62.partrev = x08.partrev
                               AND l62.divcode = x08.divcode)
      WHERE x08.x08rcode IN (390,
                             391,
                             392,
                             393,
                             394,
                             395,
                             440,
                             437,
                             460,
                             450,
                             441,
                             457,
                             461,
                             451,
                             305)
        AND x08.divcode NOT IN ('017',
                                '019',
                                '061',
                                '345',
                                '460',
                                '490',
                                '532')
        AND x08.datreg BETWEEN
          (SELECT next_day(trunc(sysdate), 'Sunday') - 14
           FROM DUAL) AND
          (SELECT next_day(trunc(sysdate), 'Sunday') - 7
           FROM DUAL)
        AND x08.x08quant != 0) "SQL2") "AstroAdjustments9"
ORDER BY "c4" ASC NULLS LAST,
         "c5" ASC NULLS LAST
SELECT substr("L62T17"."PARTNO", 1, 8),
       trim(BOTH
            FROM "L62T17"."PARTREV"),
       "L62T17"."PARTUNIT",
       trim(BOTH
            FROM "L62T17"."PARTNO")
FROM
  (SELECT "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."PARTUNIT" "PARTUNIT"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T17"
SELECT "A_PRICES_L62T1"."PRICE",
       "A_PRICES_L62T1"."PRICE"/100,
       "A_PRICES_L62T1"."ITEM_NO",
       "A_PRICES_L62T1"."BU_CODE_SUP", (coalesce("A_PRICES_L62T1"."BU_TYPE_SUP", 'SUP'))
FROM
  (SELECT "PRICES_VW"."ITEM_TYPE" "ITEM_TYPE",
          "PRICES_VW"."ITEM_NO" "ITEM_NO",
          "PRICES_VW"."BU_TYPE_SUP" "BU_TYPE_SUP",
          "PRICES_VW"."BU_CODE_SUP" "BU_CODE_SUP",
          "PRICES_VW"."PRICE" "PRICE"
   FROM "PRICES_VW" "PRICES_VW"
   WHERE "PRICES_VW"."BU_TYPE"='CDC'
     AND "PRICES_VW"."BU_CODE" IN ('003')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"