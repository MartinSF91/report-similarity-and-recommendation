SELECT DISTINCT "Query515"."Type" "Type",
                "Query515"."Pref_LdCT" "Pref_LdCT",
                "Query515"."BufferStrategy" "BufferStrategy",
                "Query515"."Zone4" "Zone4",
                count("Query515"."StoPal_Pallid") OVER (PARTITION BY "Query515"."Pref_LdCT", "Query515"."BufferStrategy", "Query515"."Zone4") "Nr_Pall"
FROM "Query515"