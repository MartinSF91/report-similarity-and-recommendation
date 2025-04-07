
SELECT DISTINCT "SQL1"."Trid ID" AS "Trid_ID",
                "SQL1"."DC" AS "DC",
                "SQL1"."LU_ID" AS "LU_ID",
                "SQL1"."Yard In Date" AS "Yard_In_Date",
                "SQL1"."Act Unload" AS "Act_Unload",
                "SQL1"."Unit Size" AS "Unit_Size",
                "SQL1"."Days on Site" AS "Days_on_Site",
                "SQL1"."Days Empty" AS "Days_Empty",
                "SQL1"."Carrier Code" AS "Carrier_Code",
                "SQL1"."Carrier Name" AS "Carrier_Name",
                "SQL1"."Location" AS "Location",
                "SQL1"."CNS Comments" AS "CNS_Comments",
                "SQL1"."COMMENTS" AS "COMMENTS",
                "SQL1"."Bill of Lading" AS "Bill_of_Lading"
FROM
  (SELECT AL1.BU_CODE_CRE_SHP||'-'||AL1.BU_TYPE_CRE_SHP||'-'||AL1.SHP_NO "Trid ID",
          AL1.BU_CODE_END DC,
          AL1.LU_ID,
          TO_CHAR(AL1.ACT_END_DATE, 'MM/DD/YYYY') "Yard In Date",
          TO_CHAR(AL1.ACT_UNLOAD_FINISH_TIME, 'MM/DD/YYYY') "Act Unload",
          AL1.UNIT_SIZE "Unit Size",
          ROUND(SYSDATE - AL1.ACT_END_DATE, 0) "Days on Site",
          ROUND(SYSDATE - AL1.ACT_UNLOAD_FINISH_TIME, 0) "Days Empty",
          AL2.BU_CODE_CAR "Carrier Code",
          AL2.BU_NAME_CAR "Carrier Name",
          CASE
              WHEN AL2.BUA_NO_END = 1 THEN 'Main'
              ELSE 'External'
          END "Location",
          AL1.CNS_Comments "CNS Comments",
          AL1.comments,
          AL1.Bill_of_lading_No "Bill of Lading"
   FROM GEMINI.IN_LOADING_UNIT_TRIP_UI AL1,
        GEMINI.IN_LOADING_UNIT_TRIP AL2
   WHERE AL2.SHP_NO=AL1.SHP_NO
     AND AL2.BU_CODE_CRE_SHP=AL1.BU_CODE_CRE_SHP
     AND AL2.BU_TYPE_CRE_SHP=AL1.BU_TYPE_CRE_SHP
     AND AL2.LUTR_NO=AL1.LUTR_NO
     AND AL2.BU_CODE_START=AL1.BU_CODE_START
     AND AL2.BU_TYPE_START=AL1.BU_TYPE_START
     AND AL2.BU_CODE_END=AL1.BU_CODE_END
     AND AL2.BU_TYPE_END=AL1.BU_TYPE_END
     AND AL2.LU_ID=AL1.LU_ID
     AND AL1.YARD_OUT_DATE IS NULL
     AND AL1.BU_TYPE_END='DT'
     AND AL1.BU_CODE_END !='030'
     AND AL1.ACT_UNLOAD_FINISH_TIME IS NOT NULL
     AND AL1.UNIT_SIZE NOT LIKE 'T%'
     AND AL1.SHP_STAT NOT LIKE '60%') "SQL1" /* user=Saurabh Sharadkumar Supugade reportPath= report= queryName=Empties REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=GswlyjG2yMh8h8s88y9sjyGC4yv4CMGMGqhG8wjG */
SELECT DISTINCT "SQL2"."Trid ID" AS "Trid_ID",
                "SQL2"."DC" AS "DC",
                "SQL2"."LU_ID" AS "LU_ID",
                "SQL2"."Yard In Date" AS "Yard_In_Date",
                "SQL2"."Act Unload" AS "Act_Unload",
                "SQL2"."Unit Size" AS "Unit_Size",
                "SQL2"."Days on Site" AS "Days_on_Site",
                "SQL2"."Days Empty" AS "Days_Empty",
                "SQL2"."Carrier Code" AS "Carrier_Code",
                "SQL2"."Carrier Name" AS "Carrier_Name",
                "SQL2"."Location" AS "Location",
                "SQL2"."CNS Comments" AS "CNS_Comments",
                "SQL2"."COMMENTS" AS "COMMENTS",
                "SQL2"."Bill of Lading" AS "Bill_of_Lading"
FROM
  (SELECT AL1.BU_CODE_CRE_SHP||'-'||AL1.BU_TYPE_CRE_SHP||'-'||AL1.SHP_NO "Trid ID",
          AL1.BU_CODE_END DC,
          AL1.LU_ID,
          TO_CHAR(AL1.ACT_END_DATE, 'MM/DD/YYYY') "Yard In Date",
          TO_CHAR(AL1.ACT_UNLOAD_FINISH_TIME, 'MM/DD/YYYY') "Act Unload",
          AL1.UNIT_SIZE "Unit Size",
          ROUND(SYSDATE - AL1.ACT_END_DATE, 0) "Days on Site",
          ROUND(SYSDATE - AL1.ACT_UNLOAD_FINISH_TIME, 0) "Days Empty",
          AL2.BU_CODE_CAR "Carrier Code",
          AL2.BU_NAME_CAR "Carrier Name",
          CASE
              WHEN AL2.BUA_NO_END = 1 THEN 'Main'
              ELSE 'External'
          END "Location",
          AL1.CNS_Comments "CNS Comments",
          AL1.comments,
          AL1.Bill_of_lading_No "Bill of Lading"
   FROM GEMINI.IN_LOADING_UNIT_TRIP_UI AL1,
        GEMINI.IN_LOADING_UNIT_TRIP AL2
   WHERE AL2.SHP_NO=AL1.SHP_NO
     AND AL2.BU_CODE_CRE_SHP=AL1.BU_CODE_CRE_SHP
     AND AL2.BU_TYPE_CRE_SHP=AL1.BU_TYPE_CRE_SHP
     AND AL2.LUTR_NO=AL1.LUTR_NO
     AND AL2.BU_CODE_START=AL1.BU_CODE_START
     AND AL2.BU_TYPE_START=AL1.BU_TYPE_START
     AND AL2.BU_CODE_END=AL1.BU_CODE_END
     AND AL2.BU_TYPE_END=AL1.BU_TYPE_END
     AND AL2.LU_ID=AL1.LU_ID
     AND AL1.YARD_OUT_DATE IS NULL
     AND AL1.BU_TYPE_END='DT'
     AND AL1.BU_CODE_END !='030'
     AND AL1.ACT_UNLOAD_FINISH_TIME IS NOT NULL
     AND AL1.UNIT_SIZE NOT LIKE 'T%'
     AND AL1.SHP_STAT NOT LIKE '60%') "SQL2"