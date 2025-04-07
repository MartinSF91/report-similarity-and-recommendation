
SELECT "T0"."C0" "ORDFALL_Bu_Code_Send",
       "T0"."C1" "ORDFALL_Bu_Type_End_Rcv",
       "T0"."C2" "ORDFALL_Art_No",
       "T0"."C3" "ORDFALL_Bu_Code_End_Rcv",
       "T0"."C4" "ORDFALL_Art_Qty",
       "T0"."C5" "ARTSupNo",
       "T0"."C6" "ARTVolGroLoc",
       ("T0"."C7"*"T0"."C8")/1000 "C__ARTVolGroLoc___1000_",
       "T0"."C9" "ARTQtyMPackLoc",
       "T0"."C10" "ARTQtyPallLoc",
       "T0"."C11" "STOAvailable_Stock",
       "T0"."C12" "ORDFALL_Bu_Type_Send",
       "T0"."C13" "Dispatch_Date_Plan",
       "T0"."C14" "Concentate",
       "T0"."C15" "Dividing"
FROM
  (SELECT "ORDER_FALL"."BU_CODE_SEND" "C0",
          "ORDER_FALL"."BU_TYPE_END_RCV" "C1",
          "ORDER_FALL"."ART_NO" "C2",
          "ORDER_FALL"."BU_CODE_END_RCV" "C3",
          "ORDER_FALL"."ART_QTY_ORIG" "C4",
          trim(BOTH
               FROM "SUPPLIER"."SUP_NO") "C5",
          "ART_SUP"."ART_VOL_GRO" "C6",
          min("ORDER_FALL"."ART_QTY_ORIG") "C7",
          min("ART_SUP"."ART_VOL_GRO") "C8",
          "ART_SUP"."ART_QTY_MPACK" "C9",
          "ART_SUP"."ART_QTY_PALL" "C10",
          sum("STOCK_INFO"."AVAILABLE_QTY") "C11",
          "ORDER_FALL"."BU_TYPE_SEND" "C12",
          "ORDER_FALL"."DSP_DATE_PLAN" "C13",
          CASE
              WHEN "ORDER_FALL"."BU_CODE_END_RCV" IS NULL
                   OR "ORDER_FALL"."ART_NO" IS NULL
                   OR "ORDER_FALL"."ART_QTY_ORIG" IS NULL THEN NULL
              ELSE "ORDER_FALL"."BU_CODE_END_RCV" || "ORDER_FALL"."ART_NO" || "ORDER_FALL"."ART_QTY_ORIG"
          END "C14",
          "ORDER_FALL"."ART_QTY_ORIG"/nullif("ART_SUP"."ART_QTY_PALL", 0) "C15"
   FROM "ORDER_FALL" "ORDER_FALL",
        "SUPPLIER" "SUPPLIER",
        "ART_SUP" "ART_SUP",
        "STOCK_INFO" "STOCK_INFO",
        "ARTICLE" "ARTICLE"
   WHERE "ORDER_FALL"."DSP_DATE_PLAN">TRUNC(CURRENT_DATE)+2
     AND "ARTICLE"."ART_NO"="ORDER_FALL"."ART_NO"
     AND "ARTICLE"."ART_NO"="ART_SUP"."ART_NO"
     AND "ART_SUP"."ART_NO"="STOCK_INFO"."ART_NO"
     AND "ART_SUP"."SUP_NO"="STOCK_INFO"."SUP_NO"
     AND "SUPPLIER"."SUP_NO"="ART_SUP"."SUP_NO"
   GROUP BY "ORDER_FALL"."BU_CODE_SEND",
            "ORDER_FALL"."BU_TYPE_END_RCV",
            "ORDER_FALL"."ART_NO",
            "ORDER_FALL"."BU_CODE_END_RCV",
            "ORDER_FALL"."ART_QTY_ORIG",
            trim(BOTH
                 FROM "SUPPLIER"."SUP_NO"),
            "ART_SUP"."ART_VOL_GRO",
            "ART_SUP"."ART_QTY_MPACK",
            "ART_SUP"."ART_QTY_PALL",
            "ORDER_FALL"."BU_TYPE_SEND",
            "ORDER_FALL"."DSP_DATE_PLAN",
            CASE
                WHEN "ORDER_FALL"."BU_CODE_END_RCV" IS NULL
                     OR "ORDER_FALL"."ART_NO" IS NULL
                     OR "ORDER_FALL"."ART_QTY_ORIG" IS NULL THEN NULL
                ELSE "ORDER_FALL"."BU_CODE_END_RCV" || "ORDER_FALL"."ART_NO" || "ORDER_FALL"."ART_QTY_ORIG"
            END,
            "ORDER_FALL"."ART_QTY_ORIG"/nullif("ART_SUP"."ART_QTY_PALL", 0)
   HAVING sum("STOCK_INFO"."AVAILABLE_QTY")>1) "T0"