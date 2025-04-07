SELECT DISTINCT "Query514"."ArtFea_RefKey_L62" "ArtFea_RefKey_L62",
                "Query514"."DspLine_CDU_Id" "DspLine_CDU_Id",
                "Query514"."DspLine_CDU_ArticleNo" "DspLine_CDU_ArticleNo",
                "Query514"."DspLine_CDU_SupNo" "DspLine_CDU_SupNo",
                "Query514"."DspLine_CDU_Loc" "DspLine_CDU_Loc",
                "Query514"."StoBal_PickBal" "StoBal_PickBal",
                "Query514"."DspDet_PickDateTime" "DspDet_PickDateTime",
                "Query514"."ArtLoc_PrefPickArea" "ArtLoc_PrefPickArea",
                "Query514"."OrdLine_ReqQunat" "OrdLine_ReqQunat",
                "Query514"."IMR_UserGroup" "IMR_UserGroup",
                "Query514"."ArtLoc_Pickzone" "ArtLoc_Pickzone",
                "Query514"."StoBal_TotBal" "StoBal_TotBal",
                "Query514"."StoBal_NotAvailBal" "StoBal_NotAvailBal",
                "Query514"."DspDet_ViCoLoadSpec" "DspDet_ViCoLoadSpec",
                "Query514"."DspLine_CDU_Type" "DspLine_CDU_Type",
                "Query514"."DspLine_CDU_PickedContStat" "DspLine_CDU_PickedContStat",
                "Query514"."IMR_RefKeyL62__Art_" "IMR_RefKeyL62__Art_",
                "Query514"."IMR_AssignStatus" "IMR_AssignStatus",
                "Query514"."IMR_Admunit" "IMR_Admunit",
                "Query514"."IMR_StartDate" "IMR_StartDate",
                "Query514"."IMR_Prio" "IMR_Prio",
                "Query514"."IMR_UniAssignNo" "IMR_UniAssignNo",
                "Query315"."IMR_Pall_ID" "IMR_Pall_ID",
                "Query315"."IMR_ToDestType" "IMR_ToDestType",
                substr("Query514"."DspDet_ViCoLoadSpec", -8) "TRIP",
                substr("Query514"."DspLine_CDU_Id", 1, 18) "TRPAC",
                "Query514"."DspLine_CDU_Type" "CDU_Type",
                substr("Query514"."DspLine_CDU_SupNo", 1, 5) "SUP",
                substr("Query514"."ArtLoc_PrefPickArea", 1, 4) "MHA",
                CASE
                    WHEN "Query315"."IMR_ToDestType"=3 THEN '3 Repl. Pick-MHA'
                    WHEN "Query315"."IMR_ToDestType"=9 THEN '9 Maintenance'
                    WHEN "Query315"."IMR_ToDestType"=16 THEN '16 Move of returned TrPac'
                END "to_dest",
                CASE
                    WHEN "Query514"."IMR_AssignStatus"=1 THEN '1 to be carried out'
                    WHEN "Query514"."IMR_AssignStatus"=2 THEN '2 under processing'
                    WHEN "Query514"."IMR_AssignStatus"=5 THEN '5 Shortage'
                END "var_Ass_Status",
                ' ' "Space32",
                    count(DISTINCT "Query514"."DspLine_CDU_Id") OVER () "ID_count"
FROM "Query514"
LEFT OUTER JOIN "Query315" ON "Query514"."IMR_UniAssignNo"="Query315"."IMR_UniAssignNo"