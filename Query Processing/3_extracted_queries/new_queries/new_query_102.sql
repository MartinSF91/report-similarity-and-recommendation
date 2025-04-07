SELECT CASE
           WHEN NOT "Query26"."C_11PH1" IS NULL THEN "Query26"."C_11PH1"
           ELSE 0
       END "C_11PH1",
       CASE
           WHEN NOT "Query26"."C_11PH2" IS NULL THEN "Query26"."C_11PH2"
           ELSE 0
       END "C_11PH2",
       CASE
           WHEN NOT "Query26"."C_13PH1" IS NULL THEN "Query26"."C_13PH1"
           ELSE 0
       END "C_13PH1",
       CASE
           WHEN NOT "Query26"."C_13PH2" IS NULL THEN "Query26"."C_13PH2"
           ELSE 0
       END "C_13PH2",
       CASE
           WHEN NOT "Query26"."C_14PH1" IS NULL THEN "Query26"."C_14PH1"
           ELSE 0
       END "C_14PH1",
       CASE
           WHEN NOT "Query26"."C_14PH2" IS NULL THEN "Query26"."C_14PH2"
           ELSE 0
       END "C_14PH2",
       CASE
           WHEN NOT "Query26"."C_15PH1" IS NULL THEN "Query26"."C_15PH1"
           ELSE 0
       END "C_15PH1",
       CASE
           WHEN NOT "Query26"."C_15PH2" IS NULL THEN "Query26"."C_15PH2"
           ELSE 0
       END "C_15PH2",
       min(CASE
               WHEN NOT "Query26"."Rack" IS NULL THEN "Query26"."Rack"
               ELSE 0
           END) "Rack",
       min(CASE
               WHEN NOT "Query26"."F_PF" IS NULL THEN "Query26"."F_PF"
               ELSE 0
           END) "F_PF",
       min(CASE
               WHEN NOT "Query26"."Total" IS NULL THEN "Query26"."Total"
               ELSE 0
           END) "Total",
       CASE
           WHEN NOT "Query26"."C_15R2" IS NULL THEN "Query26"."C_15R2"
           ELSE 0
       END "C_15R2",
       CASE
           WHEN NOT "Query26"."C_15R1" IS NULL THEN "Query26"."C_15R1"
           ELSE 0
       END "C_15R1",
       CASE
           WHEN NOT "Query26"."C_15PF2" IS NULL THEN "Query26"."C_15PF2"
           ELSE 0
       END "C_15PF2",
       CASE
           WHEN NOT "Query26"."C_15PF1" IS NULL THEN "Query26"."C_15PF1"
           ELSE 0
       END "C_15PF1",
       CASE
           WHEN NOT "Query26"."C_14R2" IS NULL THEN "Query26"."C_14R2"
           ELSE 0
       END "C_14R2",
       CASE
           WHEN NOT "Query26"."C_14R1" IS NULL THEN "Query26"."C_14R1"
           ELSE 0
       END "C_14R1",
       CASE
           WHEN NOT "Query26"."C_14PF2" IS NULL THEN "Query26"."C_14PF2"
           ELSE 0
       END "C_14PF2",
       CASE
           WHEN NOT "Query26"."C_14PF1" IS NULL THEN "Query26"."C_14PF1"
           ELSE 0
       END "C_14PF1",
       CASE
           WHEN NOT "Query26"."C_13R2" IS NULL THEN "Query26"."C_13R2"
           ELSE 0
       END "C_13R2",
       CASE
           WHEN NOT "Query26"."C_13R1" IS NULL THEN "Query26"."C_13R1"
           ELSE 0
       END "C_13R1",
       CASE
           WHEN NOT "Query26"."C_13PF2" IS NULL THEN "Query26"."C_13PF2"
           ELSE 0
       END "C_13PF2",
       CASE
           WHEN NOT "Query26"."C_13PF1" IS NULL THEN "Query26"."C_13PF1"
           ELSE 0
       END "C_13PF1",
       CASE
           WHEN NOT "Query26"."C_13F2" IS NULL THEN "Query26"."C_13F2"
           ELSE 0
       END "C_13F2",
       CASE
           WHEN NOT "Query26"."C_13F1" IS NULL THEN "Query26"."C_13F1"
           ELSE 0
       END "C_13F1",
       CASE
           WHEN NOT "Query26"."C_11R2" IS NULL THEN "Query26"."C_11R2"
           ELSE 0
       END "C_11R2",
       CASE
           WHEN NOT "Query26"."C_11R1" IS NULL THEN "Query26"."C_11R1"
           ELSE 0
       END "C_11R1",
       CASE
           WHEN NOT "Query26"."C_11PF2" IS NULL THEN "Query26"."C_11PF2"
           ELSE 0
       END "C_11PF2",
       CASE
           WHEN NOT "Query26"."C_11PF1" IS NULL THEN "Query26"."C_11PF1"
           ELSE 0
       END "C_11PF1",
       CASE
           WHEN NOT "Query26"."C_11F2" IS NULL THEN "Query26"."C_11F2"
           ELSE 0
       END "C_11F2",
       CASE
           WHEN NOT "Query26"."C_11F1" IS NULL THEN "Query26"."C_11F1"
           ELSE 0
       END "C_11F1",
       CASE
           WHEN NOT "Query26"."C_12R1" IS NULL THEN "Query26"."C_12R1"
           ELSE 0
       END "C_12R1",
       "Query37"."WhsLoc_LocType" "WhsLoc_LocType"
FROM "Query26"
FULL OUTER JOIN "Query37" ON "Query26"."LocType"="Query37"."WhsLoc_LocType"
GROUP BY CASE
             WHEN NOT "Query26"."C_11PH1" IS NULL THEN "Query26"."C_11PH1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11PH2" IS NULL THEN "Query26"."C_11PH2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13PH1" IS NULL THEN "Query26"."C_13PH1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13PH2" IS NULL THEN "Query26"."C_13PH2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14PH1" IS NULL THEN "Query26"."C_14PH1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14PH2" IS NULL THEN "Query26"."C_14PH2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15PH1" IS NULL THEN "Query26"."C_15PH1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15PH2" IS NULL THEN "Query26"."C_15PH2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15R2" IS NULL THEN "Query26"."C_15R2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15R1" IS NULL THEN "Query26"."C_15R1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15PF2" IS NULL THEN "Query26"."C_15PF2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_15PF1" IS NULL THEN "Query26"."C_15PF1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14R2" IS NULL THEN "Query26"."C_14R2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14R1" IS NULL THEN "Query26"."C_14R1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14PF2" IS NULL THEN "Query26"."C_14PF2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_14PF1" IS NULL THEN "Query26"."C_14PF1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13R2" IS NULL THEN "Query26"."C_13R2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13R1" IS NULL THEN "Query26"."C_13R1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13PF2" IS NULL THEN "Query26"."C_13PF2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13PF1" IS NULL THEN "Query26"."C_13PF1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13F2" IS NULL THEN "Query26"."C_13F2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_13F1" IS NULL THEN "Query26"."C_13F1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11R2" IS NULL THEN "Query26"."C_11R2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11R1" IS NULL THEN "Query26"."C_11R1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11PF2" IS NULL THEN "Query26"."C_11PF2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11PF1" IS NULL THEN "Query26"."C_11PF1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11F2" IS NULL THEN "Query26"."C_11F2"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_11F1" IS NULL THEN "Query26"."C_11F1"
             ELSE 0
         END,
         CASE
             WHEN NOT "Query26"."C_12R1" IS NULL THEN "Query26"."C_12R1"
             ELSE 0
         END,
         "Query37"."WhsLoc_LocType"