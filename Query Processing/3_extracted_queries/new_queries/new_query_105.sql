
SELECT "Astro11"."Date1" "c0",
       "Astro11"."Transaction_Group" "c1",
       "Astro11"."Trans_Type" "c2",
       "Astro11"."Division" "c3",
       "Astro11"."Article" "c4",
       "Astro11"."Supplier" "c5",
       "Astro11"."Adj_Qty" "c6",
       "Astro11"."Log_Id" "c7",
       "Astro11"."Buffer_MHA" "c8",
       "Astro11"."Pick_MHA" "c9",
       "Astro11"."Pallet_Class" "c10",
       "Astro11"."Carrno" "c11",
       "Astro11"."Pallet_ID" "c12",
       "Astro11"."Previous_Touch" "c13",
       "Astro11"."Last_User" "c14",
       to_number("Astro11"."Adj_Qty") "c15"
FROM
  (SELECT DISTINCT "SQL1"."Date" "Date1",
                   "SQL1"."Transaction Group" "Transaction_Group",
                   "SQL1"."Trans Type" "Trans_Type",
                   "SQL1"."Division" "Division",
                   "SQL1"."Article" "Article",
                   "SQL1"."Supplier" "Supplier",
                   "SQL1"."Adj Qty" "Adj_Qty",
                   "SQL1"."Log Id" "Log_Id",
                   "SQL1"."Buffer MHA" "Buffer_MHA",
                   "SQL1"."Pick MHA" "Pick_MHA",
                   "SQL1"."Pallet Class" "Pallet_Class",
                   "SQL1"."Carrno" "Carrno",
                   "SQL1"."Pallet ID" "Pallet_ID",
                   "SQL1"."Previous Touch" "Previous_Touch",
                   "SQL1"."Last User" "Last_User",
                   "SQL1"."HFB" "HFB",
                   "SQL1"."PANUM" "PANUM"
   FROM
     (SELECT *
      FROM
        (SELECT a1.dat "Date",
                a1.carrno "Carrno",
                a1.ecarrno "Pallet ID",
                a1.trans_group "Transaction Group",
                a1.Trans_Type "Trans Type",
                a1.Division "Division",
                a1.Article "Article",
                a1.Supplier "Supplier",
                a1.Adj_Qty "Adj Qty",
                a1.Log_Id "Log Id",
                a1.Buffer_MHA "Buffer MHA",
                a1.Pick_MHA "Pick MHA",
                a1.Pallet_Class "Pallet Class",
                a1.previous_touch "Previous Touch",
                a1.logguser "Last User",
                a1.hfb "HFB",
                a1.panum "PANUM"
         FROM
           (SELECT l16.datreg previous_touch,
                   l16.logguser,
                   l16.l16seqno,
                   x1.dat,
                   x1.carrno,
                   l16.ecarrno,
                   x1.trans_group,
                   x1.Trans_Type,
                   x1.Division,
                   x1.Article,
                   x1.Supplier,
                   x1.Adj_Qty,
                   x1.Log_Id,
                   x1.Buffer_MHA,
                   x1.Pick_MHA,
                   x1.Pallet_Class,
                   x1.hfb,
                   x1.panum,
                   RANK() OVER (PARTITION BY x1.carrno
                                ORDER BY l16.datreg DESC) rnk
            FROM
              (SELECT x08.datreg dat,
                      x08.carrno,
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
                          WHEN x08.x08rcode IN (305,
                                                306) THEN 'Recovery/Repair'
                          ELSE 'Other'
                      END trans_group,
                      x08.x08rcode Trans_Type,
                      trim(x08.divcode) Division,
                      trim(x08.partno) Article,
                      trim(x08.partrev) Supplier,
                      x08.x08quant Adj_Qty,
                      x08.x08seqno Log_Id,
                      l62.wmha Buffer_MHA,
                      l62.pmha Pick_MHA,
                      l62.wldct Pallet_Class,
                      l62t99.panum,
                      SUBSTR(l62t99.panum, 1, 2) hfb
               FROM x08t3 x08
               INNER JOIN l62t1 l62 ON (l62.partno = x08.partno
                                        AND l62.partrev = x08.partrev
                                        AND l62.divcode = x08.divcode)
               INNER JOIN L62t99 L62t99 ON (l62.partno = L62t99.partno
                                            AND l62.partrev = L62t99.partrev
                                            AND l62.divcode = L62t99.divcode)
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
                                      305,
                                      306)
                 AND x08.divcode NOT IN ('017',
                                         '019',
                                         '061',
                                         '345',
                                         '460',
                                         '490',
                                         '532')
                 AND x08.datreg >= next_day(trunc(sysdate), 'Sunday') - 7
                 AND x08.x08quant != 0) x1
            LEFT JOIN l16t3 l16 ON (l16.carrno = x1.carrno
                                    AND l16.l16lcode IN (3,
                                                         4)
                                    AND l16.datreg < x1.dat)--WHERE

            ORDER BY x1.carrno,
                     l16.datreg DESC) a1
         WHERE rnk = 1
           OR rnk IS NULL
         ORDER BY a1.dat DESC) A1
      UNION SELECT TO_DATE('01/01/2000 01:00 A.M.', 'MM/DD/YYYY HH:MI A.M.') "Date",
                   123 "Carrno",
                   '456' "Pallet ID",
                         'Temp' "Transaction Group",
                                123 "Trans Type",
                                '000' "Division",
                                      '00000000' "Article",
                                                 '00000' "Supplier",
                                                         0 "Adj Qty",
                                                         0 "Log Id",
                                                         'Temp' "Buffer MHA",
                                                                'Temp' "Pick MHA",
                                                                       'XX' "Pallet Class",
                                                                            TO_DATE('01/01/2000 01:00 A.M.', 'MM/DD/YYYY HH:MI A.M.') "Previous Touch",
                                                                            'Temp' "Last User",
                                                                                   '00' "HFB",
                                                                                        '0000' "PANUM"
      FROM DUAL) "SQL1") "Astro11"
ORDER BY "c4" ASC NULLS LAST,
         "c5" ASC NULLS LAST
SELECT trim(BOTH
            FROM substr("L62T18"."PARTNO", 1, 8)),
       trim(BOTH
            FROM trim(BOTH
                      FROM "L62T18"."PARTREV")),
       "L62T999"."PANUM",
       substr("L62T999"."PANUM", 1, 2),
       trim(BOTH
            FROM "L62T18"."PARTNO"),
       trim(BOTH
            FROM "L62T18"."PARTREV")
FROM
  (SELECT "L62T1"."DIVCODE" "DIVCODE",
          "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T18"
INNER JOIN
  (SELECT "L62T99"."DIVCODE" "DIVCODE",
          "L62T99"."PANUM" "PANUM",
          "L62T99"."PARTNO" "PARTNO",
          "L62T99"."PARTREV" "PARTREV"
   FROM "L62T99" "L62T99"
   WHERE trim(BOTH
              FROM "L62T99"."DIVCODE") NOT IN ('000',
                                               '055')) "L62T999" ON "L62T18"."PARTNO"="L62T999"."PARTNO"
AND "L62T18"."PARTREV"="L62T999"."PARTREV"
AND "L62T18"."DIVCODE"="L62T999"."DIVCODE"
SELECT "A_PRICES_L62T1"."PRICE",
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