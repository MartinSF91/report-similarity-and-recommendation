
SELECT "Astro6"."Date1" "c0",
       "Astro6"."Transaction_Group" "c1",
       "Astro6"."Trans_Type" "c2",
       "Astro6"."Division" "c3",
       "Astro6"."Article" "c4",
       "Astro6"."Supplier" "c5",
       "Astro6"."Adj_Qty" "c6",
       "Astro6"."Log_Id" "c7",
       "Astro6"."Buffer_MHA" "c8",
       "Astro6"."Pick_MHA" "c9",
       "Astro6"."Pallet_Class" "c10",
       "Astro6"."Previous_Touch" "c11",
       "Astro6"."Last_User" "c12",
       "Astro6"."HFB" "c13",
       "Astro6"."PANUM" "c14",
       "Astro6"."Carrno" "c15",
       "Astro6"."Pallet_ID" "c16",
       "Astro6"."ARTKEY" "c17"
FROM
  (SELECT DISTINCT "SQL2"."Date" "Date1",
                   "SQL2"."Transaction Group" "Transaction_Group",
                   "SQL2"."Trans Type" "Trans_Type",
                   "SQL2"."Division" "Division",
                   "SQL2"."Article" "Article",
                   "SQL2"."Supplier" "Supplier",
                   "SQL2"."ARTKEY" "ARTKEY",
                   "SQL2"."Adj Qty" "Adj_Qty",
                   "SQL2"."Log Id" "Log_Id",
                   "SQL2"."Buffer MHA" "Buffer_MHA",
                   "SQL2"."Pick MHA" "Pick_MHA",
                   "SQL2"."Pallet Class" "Pallet_Class",
                   "SQL2"."Previous Touch" "Previous_Touch",
                   "SQL2"."Last User" "Last_User",
                   "SQL2"."HFB" "HFB",
                   "SQL2"."PANUM" "PANUM",
                   "SQL2"."Carrno" "Carrno",
                   "SQL2"."Pallet ID" "Pallet_ID"
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
                A1.ARTKEY,
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
                   x1.ARTKEY,
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
                      TRIM(x08.partno)||'-'||TRIM(x08.partrev) ARTKEY,
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
                                      306)--AND x08.divcode NOT IN ('017','019','061','345','460','490','532')

                 AND x08.datreg >= next_day(trunc(sysdate), 'Sunday') - 7
                 AND x08.x08quant != 0) x1
            LEFT JOIN l16t3 l16 ON (l16.carrno = x1.carrno
                                    AND l16.l16lcode IN (3,
                                                         4)
                                    AND l16.datreg < x1.dat)
            ORDER BY x1.carrno,
                     l16.datreg DESC) a1
         WHERE rnk = 1
           OR rnk IS NULL
         ORDER BY a1.dat DESC) A1
      UNION SELECT NULL "Date",
                        123 "Carrno",
                        '456' "Pallet ID",
                              'Temp' "Transaction Group",
                                     123 "Trans Type",
                                     '000' "Division",
                                           '00000000' "Article",
                                                      '00000' "Supplier",
                                                              '00000000-00000' "ARTKEY",
                                                                               0 "Adj Qty",
                                                                               0 "Log Id",
                                                                               'Temp' "Buffer MHA",
                                                                                      'Temp' "Pick MHA",
                                                                                             'XX' "Pallet Class",
                                                                                                  NULL "Previous Touch",
                                                                                                       'Temp' "Last User",
                                                                                                              '00' "HFB",
                                                                                                                   '0000' "PANUM"
      FROM DUAL) "SQL2") "Astro6"
ORDER BY "c17" ASC NULLS LAST
SELECT "Gemini7"."ART_PRI_CALC_17",
       "Gemini7"."ARTSUP"
FROM
  (SELECT DISTINCT "SQL1"."ARTSUP" "ARTSUP",
                   "SQL1"."WS_CODE" "WS_CODE",
                   "SQL1"."FYT" "FYT",
                   "SQL1"."ART_PRI_CALC_17" "ART_PRI_CALC_17",
                   "SQL1"."UNIT_NO" "UNIT_NO",
                   "SQL1"."PA_NO" "PA_NO",
                   "SQL1"."HFB" "HFB"
   FROM
     (SELECT A1.ITEM_ID||'-'||A1.BU_CODE_SUP artsup,
             A1.WS_CODE,
             A1.FYT,
             CASE
                 WHEN A2.UNIT_NO = '02' THEN A1.ART_PRI_CALC_17/100
                 ELSE A1.ART_PRI_CALC_17
             END ART_PRI_CALC_17,
             A2.UNIT_NO,
             A2.PA_NO,
             SUBSTR(A2.PA_NO, 1, 2) HFB
      FROM GEMINI.ITEM_SUP_WS_FYT A1,
           GEMINI.ITEM A2,

        (SELECT A2.ITEM_ID||'-'||A2.BU_CODE_SUP artsup,
                A2.WS_CODE,
                MAX(A2.FYT) maxfyt
         FROM GEMINI.ITEM_SUP_WS_FYT A2,

           (SELECT trunc(sysdate - 1) tday
            FROM DUAL) D1
         WHERE --UPDATE TO LUS for EAST or LUW for West
 A2.WS_CODE IN ('LUS')
           AND A2.FYT <= (CASE
                              WHEN TO_CHAR(D1.tday, 'MM') IN ('09',
                                                              '10',
                                                              '11',
                                                              '12') THEN TO_CHAR(add_months(D1.tday, 12), 'YYYY')
                              ELSE TO_CHAR(D1.tday, 'YYYY')
                          END|| CASE
                                    WHEN TO_CHAR(D1.tday, 'MM') IN ('09',
                                                                    '10',
                                                                    '11',
                                                                    '12') THEN '1'
                                    WHEN TO_CHAR(D1.tday, 'MM') IN ('01',
                                                                    '02',
                                                                    '03',
                                                                    '04') THEN '2'
                                    WHEN TO_CHAR(D1.tday, 'MM') IN ('05',
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
        AND A1.FYT = A3.maxfyt) "SQL1") "Gemini7"