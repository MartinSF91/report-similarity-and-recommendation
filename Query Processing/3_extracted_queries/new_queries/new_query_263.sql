SELECT "SQL1"."HHM_No" "HHM_No",
       "SQL1"."HHM_Name" "HHM_Name",
       sum("SQL1"."Rcv_Qty") "Rcv_Qty"
FROM "SQL1"
WHERE "SQL1"."Datum" BETWEEN CAST((:PQ1) AS TIMESTAMP) AND CAST((:PQ2) AS TIMESTAMP)
  AND "SQL1"."Rcv_Qty"<>0
GROUP BY "SQL1"."HHM_No",
         "SQL1"."HHM_Name"