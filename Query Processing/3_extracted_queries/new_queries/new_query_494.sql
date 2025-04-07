SELECT TO_CHAR(x08.datreg, 'MM/DD/YYYY') "Date",
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
                          '532',
                          '021',
                          '030')
  AND x08.datreg BETWEEN
    (SELECT next_day(trunc(sysdate), 'Sunday') - 14
     FROM DUAL) AND
    (SELECT next_day(trunc(sysdate), 'Sunday') - 7
     FROM DUAL)
  AND x08.x08quant != 0