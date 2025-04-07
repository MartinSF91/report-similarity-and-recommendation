
SELECT "YMH12T1"."ESHPID" "Shipment_Number",
       "YMH12T1"."PLANSDT" "Loading_Date",
       "YMT10T1"."REQELUID" "Loading_Unit",
       "YMH12T1"."DELSTAT" "Delivery_Status",
       "YMH12T1"."CARRIER" "Carrier",
       min("YMT10T1"."REQELUID") "c6",
       "YMH12T1"."SHPTO" "Destination"
FROM "YMH12T1" "YMH12T1",
     "YMT10T1" "YMT10T1"
WHERE "YMH12T1"."INOUT"='1'
  AND "YMH12T1"."DELSTAT" IN (30)
  AND "YMH12T1"."CARRIER" IN ('BARRON WOOD DIS')
  AND "YMH12T1"."PLANSDT" like SYSDATE
  AND "YMT10T1"."CNSID"="YMH12T1"."CNSID"
GROUP BY "YMH12T1"."ESHPID",
         "YMH12T1"."PLANSDT",
         "YMT10T1"."REQELUID",
         "YMH12T1"."DELSTAT",
         "YMH12T1"."CARRIER",
         "YMH12T1"."SHPTO"