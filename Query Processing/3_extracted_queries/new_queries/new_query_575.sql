SELECT CASE
           WHEN o40.divgroup = '051' THEN 'SMRU80005'
           WHEN o40.divgroup = '052' THEN 'SMRU73416'
           WHEN o40.divgroup = '062' THEN 'SMRU80152'
           ELSE NULL
       END AS MU_ID,
       'CID001786' AS CUSTOMER_ID,
       CASE
           WHEN o40.divgroup = '051' THEN 'US_3198'
           WHEN o40.divgroup = '052' THEN 'US_5099'
           WHEN o40.divgroup = '062' THEN 'CA_0370'
           ELSE NULL
       END AS FACILITY_ID,
       'Warehousing' AS SVC_AREA,
       TO_CHAR(o40.regdate, 'mm/dd/yyyy') AS MANIFEST_DATE,
       TO_CHAR (o40.regdate,
                'hh:mi:ss AM') AS MANIFEST_TIME,
               o40.ecarrno AS CARTON_NBR,
               o06.shorto04 AS ORDER_NBR,
               o40.o40user AS "USER",
               SUM(o42.ocquant) AS UNIT_QTY,
               '' AS "DWH_INSERT_DATE"
FROM ast052.O40T2 o40
INNER JOIN ast052.O42T2 o42 ON o40.ocarrno = o42.ocarrno
INNER JOIN ast052.O06T1 o06 ON o40.shorto06 = o06.shorto06
WHERE o06.statdate >= sysdate - 1
GROUP BY CASE
             WHEN o40.divgroup = '051' THEN 'SMRU80005'
             WHEN o40.divgroup = '052' THEN 'SMRU73416'
             WHEN o40.divgroup = '062' THEN 'SMRU80152'
             ELSE NULL
         END,
         CASE
             WHEN o40.divgroup = '051' THEN 'US_3198'
             WHEN o40.divgroup = '052' THEN 'US_5099'
             WHEN o40.divgroup = '062' THEN 'CA_0370'
             ELSE NULL
         END,
         o40.regdate,
         o40.ecarrno,
         o06.shorto04,
         o40.o40user