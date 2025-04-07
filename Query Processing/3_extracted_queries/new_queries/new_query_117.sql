SELECT DISTINCT "SQL_Order__Orderlines_daily"."_StatUpDate" "C__StatUpDate",
                "SQL_Order__Orderlines_daily"."_Anzahl Ordern ges" "C__Anzahl_Ordern_ges",
                "SQL_Order__Orderlines_daily"."_Anzahl Orderlines ges" "C__Anzahl_Orderlines_ges",
                "SQL_Order__Orderlines_daily"."_Anzahl Ordern SSI only" "C__Anzahl_Ordern_SSI_only",
                "SQL_Order__Orderlines_daily"."_Anzahl OL SSI only" "C__Anzahl_OL_SSI_only",
                "SQL_Order__Orderlines_daily"."_Anzahl Ordern Flow 3 und 5" "C__Anzahl_Ordern_Flow_3_und_5",
                "SQL_Order__Orderlines_daily"."_Anzahl OL Flow 3 und 5" "C__Anzahl_OL_Flow_3_und_5",
                "SQL_Order__Orderlines_daily"."_Anzahl Ordern Merge" "C__Anzahl_Ordern_Merge",
                "SQL_Order__Orderlines_daily"."_Anzahl OL Merge" "C__Anzahl_OL_Merge"
FROM "SQL_Order__Orderlines_daily"