SELECT TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))) "Datum",
       count("X08T33"."CARRNO") "Inventory_Units",
       "X08T33"."X08RCODE" "Sta_RsCode",
       "X08T33"."X08QUANT" "Sta_Qty"
FROM "X08T33"
WHERE TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-18' AND DATE '2025-03-25'
  AND "X08T33"."X08RCODE" IN (437,
                              440,
                              460,
                              441,
                              457,
                              461,
                              308,
                              318)
  AND "X08T33"."X08QUANT" NOT BETWEEN 0 AND 0
GROUP BY TRUNC(cast("X08T33"."DATREG" AS TIMESTAMP(9))),
         "X08T33"."X08RCODE",
         "X08T33"."X08QUANT"