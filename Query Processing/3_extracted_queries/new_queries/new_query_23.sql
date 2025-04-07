/*

This query returns all orders for DC 019 that have not yet been delivered.

*/
SELECT A1.ORDER_ID "Gemini Order #",
       TRIM(A3.ASTRO_ORD_ID) "Astro Order#",
       A1.ORDER_TYPE,
       OT.NAME "Order Type Desc",
       A1.BU_CODE_DT_FILL "Filling Terminal",
       A1.BU_TYPE_DT_FILL "Filling BU Type",
       A1.BU_CODE_RCV "Receiving Location",
       CASE
           WHEN A1.BU_TYPE_RCV IN ('DC',
                                   'CDC') THEN T1.Name
           ELSE S1.Name
       END "Rec Name",
       A1.BU_TYPE_RCV,
       CASE
           WHEN (A1.BU_CODE_DT_FILL = '017'
                 AND A1.BU_CODE_RCV = '023')
                OR (A1.BU_CODE_DT_FILL = '019'
                    AND A1.BU_CODE_RCV = '025')
                OR (A1.BU_CODE_DT_FILL = '460'
                    AND A1.BU_CODE_RCV = '960')
                OR (A1.BU_CODE_DT_FILL = '345'
                    AND A1.BU_CODE_RCV = '945')
                OR (A1.BU_CODE_DT_FILL = '030'
                    AND A1.BU_CODE_RCV = '930') THEN 'Stock Switch'
           WHEN (A1.BU_CODE_DT_FILL = '017'
                 AND A1.BU_CODE_RCV != '023'
                 AND A1.BU_TYPE_RCV = 'CDC')
                OR (A1.BU_CODE_DT_FILL = '019'
                    AND A1.BU_CODE_RCV != '025'
                    AND A1.BU_TYPE_RCV = 'CDC')
                OR (A1.BU_CODE_DT_FILL = '460'
                    AND A1.BU_CODE_RCV != '960'
                    AND A1.BU_TYPE_RCV = 'CDC')
                OR (A1.BU_CODE_DT_FILL = '345'
                    AND A1.BU_CODE_RCV != '945'
                    AND A1.BU_TYPE_RCV = 'CDC')
                OR (A1.BU_CODE_DT_FILL = '030'
                    AND A1.BU_CODE_RCV != '930'
                    AND A1.BU_TYPE_RCV = 'CDC')
                OR (A1.BU_CODE_DT_FILL IN ('532',
                                           '061',
                                           '490')
                    AND A1.BU_TYPE_RCV = 'CDC') THEN 'CDC'
           WHEN A1.BU_TYPE_RCV IN ('DT',
                                   'CDC') THEN T1.CTY_CODE
           ELSE S1.CTY_CODE
       END "Flow",
       CASE
           WHEN (A1.BU_CODE_DT_FILL = '017'
                 AND A1.BU_CODE_RCV = '023')
                OR (A1.BU_CODE_DT_FILL = '019'
                    AND A1.BU_CODE_RCV = '025')
                OR (A1.BU_CODE_DT_FILL = '460'
                    AND A1.BU_CODE_RCV = '960')
                OR (A1.BU_CODE_DT_FILL = '345'
                    AND A1.BU_CODE_RCV = '945')
                OR (A1.BU_CODE_DT_FILL = '030'
                    AND A1.BU_CODE_RCV = '930') THEN 'Yes'
           ELSE 'No'
       END "Stock Switch",
       TO_CHAR(A1.ORDER_DATE, 'MM/DD/YYYY')"Order Date",
       TO_CHAR(A1.ORDER_DATE+1, 'IW') "Order Week",
       TO_CHAR(A1.DSP_DATE_LATEST, 'MM/DD/YYYY') "Latest Dispatch Date",
       TO_CHAR(A1.CREATE_DATE, 'MM/DD/YYYY HH:MM:SS PM') "Order Creation Date",
       TRIM(A1.ITEM_ID) "Article",
       A1.ITEM_TYPE , --A1.BU_CODE_SUP ,
 A3.BU_CODE_SUP "Supplier",
 TRIM(A1.ITEM_ID)||'-'||TRIM(A3.BU_CODE_SUP) artsup, --CASE WHEN A1.BU_CODE_SUP  IS NULL AND  A1.BU_TYPE_SUP IS NULL THEN DWP.BU_CODE_SUP ELSE A1.BU_CODE_SUP END "Supplier",
 --A1.BU_TYPE_SUP,
 A3.BU_TYPE_SUP "BU_TYPE_SUP",
 A1.ITEM_QTY_ORD "Gemini Order Qty",
 A1.ITEM_QTY_REMAINING,
 A1.ITEM_QTY_DSP,
 A1.ASTRO_SM_CODE,
 A1.ASTRO_PICK_GROUP "Pick Group Astro",
 A1.LATE_ORDER_FLAG,
 A1.STATUS "Order Status Code",
 A2.NAME " Gemini Order Status",
 CASE
     WHEN A1.DSP_DATE_LATEST > TRUNC(SYSDATE -1) + 1/24 THEN 'OK'
     ELSE 'Late'
 END "Filling Status",
 A1.DSP_DATE_EARLIEST,
 A1.PICK_GROUP "Pick Group Gemini",
 TRIM(A1.COMMENTS) "Order Comments", ---A1.ARRIVAL_DATE_EARLIEST,
 ---A1.ARRIVAL_DATE_LATEST,
 --A1.ROW_VERSION
 --A1.CANCEL_DATE,
 --A1.CANCEL_REASON,
 --A1.BU_CODE_INVO,
 --A1.ORDER_CRE,
 --A1.BU_TYPE_INVO,
 --A1.BU_CODE_CRE,
 --A1.BU_TYPE_CRE,
 --A1.BU_CODE_MHS,
 --A1.MHS_ORD_TYPE,
 --A1.MHS_ORD_INDX,
 --A1.MHS_DEL_TYPE,
 --A1.MHS_DEL_MARK,
 --A1.MHS_WISH_WEEK,
 --A1.BU_CODE_CRE,
 -- A1.BU_TYPE_CRE,
 --A1.MHS_PRIO,
 --A1.ITEM_QTY_ORD_ORIG,
 --A1.DEL_GROUP_NO,l
 --A1.DEL_GROUP_CRE,
 --A1.CUSORD_LINE_NO,
 --A1.PROMO_ID,
 --A1.ADJ_REASON,
 --A1.ADJ_CODE,
 --A1.EXECUTE_FLAG,
 --A1.UNFILL_ACTION,
 --A1.RULE_CODE,
 --AVAIL_TIME_CUSORD,
 --A1.FILL_DIRECTION,
 --A1.SPECIAL_STOCK_CODE,
 --A1.REROUTE_PRIORITY,
 --A1.PARENT_ORDER_ID,
 --A1.PARENT_ORDER_CRE,
 --A1.ORIG_ORDER_ID,
 --A1.ORIG_ORDER_CRE,
 --A1.AUDIT_DATE,
 --A1.CLOSED_DATE,
 --A1.AUDIT_USER,
 --A1.AUDIT_ACTION,
 --A1.AUDIT_REASON,
 --A1.APPROVE_FLAG,
 --A1.ITEM_QTY_APPROVE,
 --A1.CUSORD_NO,
 --A1.CUSORD_NO_SRC,
 --A1.SEND_DATE_DISAPPROVAL,
 -- A1.REASON_CODE_DELAY,
 --A1.BUA_NO_RCV,
 --LOCATION_PRIO,
 --NEED_CALC_DATE,
 --A1.REASON_CODE_OMS,
 --A1.ORD_PROP_DATE_EXP,
 --A1.COV_FROM_DATE,
 --A1.COV_TO_DATE,
 --A1.BCK_ORD_PROP_DATE,
 --A1.ORD_PROP_QTY,
 --A1.DEL_QTY_MAX,
 --A1.SM_CODE,
 --A1.BACKUP_ORDER_FLAG,
 --A1.ORD_PROP_ID,
 --A1.DSP_DATE_NEED,
 --A1.BU_CODE_MID_RCV_PREV,
 --A1.BU_TYPE_MID_RCV_PREV,
 --A1.BU_CODE_MID_RCV,
 --A1.BU_TYPE_MID_RCV,
 --A1.DSP_DATE_EARLIEST_ORIG,
 --A1.DSP_DATE_LATEST_ORIG,
  1/COUNT (*) OVER(PARTITION BY A1.ORDER_ID
                   ORDER BY A1.ORDER_ID) "Orders"
FROM GEMINI.ORDERS A1
INNER JOIN GEMINI.ORDER_STATUS_DICT A2 ON A1.STATUS = A2.ORDER_STATUS
INNER JOIN GEMINI.OPERATIONAL_ORDER_ALL A3 ON A1.ORDER_ID = A3.ORDER_ID
INNER JOIN GEMINI.ORDER_TYPE_DICT OT ON OT.ORDER_TYPE = A1.ORDER_TYPE
LEFT JOIN GEMINI.TERMINAL T1 ON T1.BU_CODE = A1.BU_CODE_RCV
AND T1.BU_TYPE = A1.BU_TYPE_RCV
LEFT JOIN GEMINI.STORE S1 ON (A1.BU_CODE_RCV = S1.BU_CODE
                              AND A1.BU_TYPE_RCV = S1.BU_TYPE)
WHERE A1.BU_CODE_DT_FILL = '019'
  AND A1.STATUS != 70
  AND A1.STATUS != 60
  AND A1.STATUS != 99
  AND A1.ITEM_TYPE = 'ART'
  AND DSP_DATE_LATEST > TO_DATE('08/01/2022', 'MM/DD/YYYY')
GROUP BY A1.ORDER_ID,
         TRIM(A3.ASTRO_ORD_ID),
         A1.ORDER_TYPE,
         OT.NAME,
         A1.BU_CODE_DT_FILL,
         A1.BU_TYPE_DT_FILL,
         A1.BU_CODE_RCV,
         CASE
             WHEN A1.BU_TYPE_RCV IN ('DC',
                                     'CDC') THEN T1.Name
             ELSE S1.Name
         END,
         A1.BU_TYPE_RCV,
         CASE
             WHEN (A1.BU_CODE_DT_FILL = '017'
                   AND A1.BU_CODE_RCV = '023')
                  OR (A1.BU_CODE_DT_FILL = '019'
                      AND A1.BU_CODE_RCV = '025')
                  OR (A1.BU_CODE_DT_FILL = '460'
                      AND A1.BU_CODE_RCV = '960')
                  OR (A1.BU_CODE_DT_FILL = '345'
                      AND A1.BU_CODE_RCV = '945')
                  OR (A1.BU_CODE_DT_FILL = '030'
                      AND A1.BU_CODE_RCV = '930') THEN 'Stock Switch'
             WHEN (A1.BU_CODE_DT_FILL = '017'
                   AND A1.BU_CODE_RCV != '023'
                   AND A1.BU_TYPE_RCV = 'CDC')
                  OR (A1.BU_CODE_DT_FILL = '019'
                      AND A1.BU_CODE_RCV != '025'
                      AND A1.BU_TYPE_RCV = 'CDC')
                  OR (A1.BU_CODE_DT_FILL = '460'
                      AND A1.BU_CODE_RCV != '960'
                      AND A1.BU_TYPE_RCV = 'CDC')
                  OR (A1.BU_CODE_DT_FILL = '345'
                      AND A1.BU_CODE_RCV != '945'
                      AND A1.BU_TYPE_RCV = 'CDC')
                  OR (A1.BU_CODE_DT_FILL = '030'
                      AND A1.BU_CODE_RCV != '930'
                      AND A1.BU_TYPE_RCV = 'CDC')
                  OR (A1.BU_CODE_DT_FILL IN ('532',
                                             '061',
                                             '490')
                      AND A1.BU_TYPE_RCV = 'CDC') THEN 'CDC'
             WHEN A1.BU_TYPE_RCV IN ('DT',
                                     'CDC') THEN T1.CTY_CODE
             ELSE S1.CTY_CODE
         END,
         CASE
             WHEN (A1.BU_CODE_DT_FILL = '017'
                   AND A1.BU_CODE_RCV = '023')
                  OR (A1.BU_CODE_DT_FILL = '019'
                      AND A1.BU_CODE_RCV = '025')
                  OR (A1.BU_CODE_DT_FILL = '460'
                      AND A1.BU_CODE_RCV = '960')
                  OR (A1.BU_CODE_DT_FILL = '345'
                      AND A1.BU_CODE_RCV = '945')
                  OR (A1.BU_CODE_DT_FILL = '030'
                      AND A1.BU_CODE_RCV = '930') THEN 'Yes'
             ELSE 'No'
         END,
         TO_CHAR(A1.ORDER_DATE, 'MM/DD/YYYY'),
         TO_CHAR(A1.ORDER_DATE+1, 'IW'),
         TO_CHAR(A1.DSP_DATE_LATEST, 'MM/DD/YYYY'),
         TO_CHAR(A1.CREATE_DATE, 'MM/DD/YYYY HH:MM:SS PM'),
         A1.ITEM_ID,
         A1.ITEM_TYPE,
         A3.BU_CODE_SUP,
         A3.BU_TYPE_SUP,
         A1.ITEM_QTY_ORD,
         A1.ITEM_QTY_REMAINING,
         A1.ITEM_QTY_DSP,
         TRIM(A1.ITEM_ID)||'-'||TRIM(A3.BU_CODE_SUP),
         A1.ASTRO_SM_CODE,
         A1.ASTRO_PICK_GROUP,
         A1.LATE_ORDER_FLAG,
         A1.STATUS,
         A2.NAME,
         CASE
             WHEN A1.DSP_DATE_LATEST > TRUNC(SYSDATE -1) + 1/24 THEN 'OK'
             ELSE 'Late'
         END,
         A1.DSP_DATE_EARLIEST,
         A1.PICK_GROUP,
         TRIM(A1.COMMENTS)
ORDER BY TO_CHAR(A1.DSP_DATE_LATEST, 'MM/DD/YYYY') ASC