SELECT CASE
           WHEN o08.divcode = '051' THEN 'SMRU80005'
           WHEN o08.divcode = '052' THEN 'SMRU73416'
           WHEN o08.divcode = '062' THEN 'SMRU80152'
           ELSE NULL
       END AS MU_ID,
       'CID001786' AS CUSTOMER_ID,
       CASE
           WHEN o08.divcode = '051' THEN 'US_3198'
           WHEN o08.divcode = '052' THEN 'US_5099'
           WHEN o08.divcode = '062' THEN 'CA_0370'
           ELSE NULL
       END AS FACILITY_ID,
       'Warehousing' AS SVC_AREA,
       TRIM(o08.shorto04) AS ORD_PICKTICKET_NBR,
       o08.ordline AS ORD_DTL_PICKTICKET_LINE,
       o08.partno AS SKU,
       o08.reqquant AS ORD_DTL_ORIG_ORDER_QTY,
       o08.reqquant AS ORD_DTL_ORIG_PKT_QTY,
       CASE
           WHEN o08.linestat IN ('7') THEN o08.reqquant - o08.delquant
           ELSE 0
       END AS ORD_DTL_SHORTAGE_QTY,
       o08.delquant AS ORD_DTL_PKT_QTY,
       CASE
           WHEN o08.linestat IN ('0') THEN o08.reqquant
           ELSE 0
       END AS ORD_DTL_CANCEL_QTY,
       CASE
           WHEN o06.ordstat IN ('9') THEN o08.delquant
           ELSE 0
       END AS ORD_DTL_SHIP_QTY,
       '' AS LOT,
       TRIM(o08.shortr08) AS WAVE_NBR,
       CASE
           WHEN o06.ordstat = '9' THEN o06.ordstat
           ELSE o08.linestat
       END AS ORD_DTL_LINE_STATUS_FLAG,
       '' AS ORD_DTL_PRICE,
       '' AS ORD_DTL_RTL_PRICE,
       o08.divcode AS IKEA_CDC_NBR,
       o08.shorto08 AS ORD_DTL_REF_NBR,
       '' AS ORD_DTL_MISC_03,
       '' AS ORD_DTL_MISC_04,
       '' AS ORD_DTL_MISC_05,
       to_char(o08.regdate, 'yyyy-mm-dd') AS ORD_DTL_DROP_DATE,
       to_char(o08.regdate, 'hh:mi:ss AM') AS ORD_DTL_DROP_TIME,
       to_char(o08.upddate, 'yyyy-mm-dd') AS ORD_DTL_DATE_LAST_MODIFIED,
       to_char(o08.upddate, 'hh:mi:ss AM') AS ORD_DTL_TIME_LAST_MODIFIED,
       '' DWH_INSERT_DATE
FROM ast052.o08t1 o08
INNER JOIN ast052.o06t1 o06 ON o08.shorto06=o06.shorto06
WHERE o06.statdate>= sysdate -1
GROUP BY TRIM(o08.shorto04),
         o08.ordline,
         o08.partno,
         TRIM(o08.shortr08),
         o06.ordstat,
         o08.linestat,
         TRIM(o08.shorto06),
         o08.reqquant,
         o08.delquant,
         o08.divcode,
         o08.shorto08,
         to_char(o08.regdate, 'yyyy-mm-dd'),
         to_char(o08.regdate, 'hh:mi:ss AM'),
         to_char(o08.upddate, 'yyyy-mm-dd'),
         to_char(o08.upddate, 'hh:mi:ss AM')