SELECT "SQL2"."HHM_No" "HHM_No",
       "SQL2"."HHM_Name" "HHM_Name",
       sum("SQL2"."Send_Qty") "Send_Qty"
FROM "SQL2"
WHERE "SQL2"."Datum" BETWEEN CAST((:PQ1) AS TIMESTAMP) AND CAST((:PQ2) AS TIMESTAMP)
GROUP BY "SQL2"."HHM_No",
         "SQL2"."HHM_Name"