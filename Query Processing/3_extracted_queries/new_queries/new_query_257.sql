SELECT TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))) "Datum",
       count("X08T33"."CARRNO") "Inventory_Units",
       "X08T33"."X08RCODE" "Sta_RsCode",
       "X08T33"."X08QUANT" "Sta_Qty",
       trim(BOTH
            FROM "X08T33"."PARTREV") "Sta_SupplierNo"
FROM "X08T33"
WHERE "X08T33"."X08RCODE" IN (437,
                              440,
                              460,
                              441,
                              457,
                              461)
  AND "X08T33"."X08QUANT" NOT IN (0)
  AND trim(BOTH
           FROM "X08T33"."PARTREV") NOT IN ('10000',
                                            '02508',
                                            '23801',
                                            '25080',
                                            '598014',
                                            '998014',
                                            '99999')
  AND TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))) BETWEEN TRUNC(cast(:PQ1 AS TIMESTAMP(9))) AND TRUNC(cast(:PQ2 AS TIMESTAMP(9)))
GROUP BY TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))),
         "X08T33"."X08RCODE",
         "X08T33"."X08QUANT",
         trim(BOTH
              FROM "X08T33"."PARTREV")