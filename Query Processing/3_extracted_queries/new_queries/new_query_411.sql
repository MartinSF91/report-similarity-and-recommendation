SELECT "T0"."C0" "OrdGi_OrdStatus",
       "T0"."C1" "OrdGi_StatDate",
       "T0"."C2" "OrdGi_Ordtype",
       "T0"."C3" "nbr_order_closed",
       "T0"."C3" "Total_OrdGi_CountOrder_",
       "T0"."C4" "type",
       "T0"."C5" "Week"
FROM
  (SELECT "O04T13"."ORDSTAT" "C0",
          TRUNC(cast("O04T13"."STATDATE" AS TIMESTAMP(9))) "C1",
          "O04T13"."ORDTYPE" "C2",
          count("O04T13"."ORDNO") "C3",
          CASE
              WHEN "O04T13"."ORDTYPE"=12 THEN 'Parcel'
              ELSE 'Truck'
          END "C4",
          TO_NUMBER(TO_CHAR(TRUNC(cast("O04T13"."STATDATE" AS TIMESTAMP(9))), 'IW')) "C5"
   FROM "O04T13"
   WHERE "O04T13"."ORDSTAT" IN (9)
     AND TRUNC(cast("O04T13"."STATDATE" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-19' AND DATE '2025-03-26'
   GROUP BY "O04T13"."ORDSTAT",
            TRUNC(cast("O04T13"."STATDATE" AS TIMESTAMP(9))),
            "O04T13"."ORDTYPE",
            CASE
                WHEN "O04T13"."ORDTYPE"=12 THEN 'Parcel'
                ELSE 'Truck'
            END,
            TO_NUMBER(TO_CHAR(TRUNC(cast("O04T13"."STATDATE" AS TIMESTAMP(9))), 'IW'))) "T0"