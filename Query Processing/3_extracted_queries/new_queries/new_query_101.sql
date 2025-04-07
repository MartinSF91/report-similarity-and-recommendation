SELECT "Query13"."LocType" "LocType",
       "Query13"."Loc_Zone" "Loc_Zone",
       CASE
           WHEN "Query13"."C_11F1" IS NULL THEN 0
           ELSE "Query13"."C_11F1"
       END "C_11F1",
       CASE
           WHEN "Query13"."C_11F2" IS NULL THEN 0
           ELSE "Query13"."C_11F2"
       END "C_11F2",
       CASE
           WHEN "Query13"."C_13F1" IS NULL THEN 0
           ELSE "Query13"."C_13F1"
       END "C_13F1",
       CASE
           WHEN "Query13"."C_13F2" IS NULL THEN 0
           ELSE "Query13"."C_13F2"
       END "C_13F2",
       (CASE
            WHEN "Query13"."C_11F1" IS NULL THEN 0
            ELSE "Query13"."C_11F1"
        END +CASE
                 WHEN "Query13"."C_11F2" IS NULL THEN 0
                 ELSE "Query13"."C_11F2"
             END)+(CASE
                       WHEN "Query13"."C_13F1" IS NULL THEN 0
                       ELSE "Query13"."C_13F1"
                   END +CASE
                            WHEN "Query13"."C_13F2" IS NULL THEN 0
                            ELSE "Query13"."C_13F2"
                        END) "Total"
FROM "Query13"