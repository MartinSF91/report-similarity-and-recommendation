SELECT MU_ID,
       CUSTOMER_ID,
       FACILITY_ID,
       SVC_AREA,
       ORD_PICKTICKET_NBR,
       ORD_NBR,
       SUM(ORD_UNITS) AS ORD_UNITS,
       CASE
           WHEN NBR_ORD_LINES > 1 THEN 0
           ELSE 1
       END AS ORD_SINGLE_FLAG,
       ROUTE_DESC,
       NBR_ORD_LINES,
       ROUTE_TYPE,
       IKEA_CDC_NBR,
       ORD_MISC_05,
       ORD_MISC_06,
       ORD_MISC_07,
       ORD_MISC_08,
       ORD_MISC_09,
       ORD_MISC_10,
       ORD_MISC_11,
       ORD_MISC_12,
       ORD_MISC_13,
       ORD_MISC_14,
       ORD_MISC_15,
       ORD_STATUS,
       ORD_ORDER_TYPE,
       ORD_SHIP_TO_CUSTOMER,
       ORD_STATE,
       ORD_ZIP,
       ORD_COUNTRY,
       ORD_SHIP_VIA,
       ORD_WAVE_NBR,
       ORD_SERVICE_LEVEL,
       ORD_CUSTOMER_NBR,
       ORD_PRIORITY,
       ORD_PRIORITY_CODE,
       ORD_GENERAL_MERCH_CATEGORY,
       ORD_ADV_DATE,
       ORD_SCHEDULED_DELIVERY_DATE,
       ORD_GENERATE_DATE,
       ORD_ORDER_DATE,
       CASE
           WHEN ORD_STATUS IN ('0') THEN ORD_DATE_LAST_MODIFIED
           ELSE ''
       END AS ORD_CANCEL_DATE,
       ORD_START_SHIP_DATE,
       ORD_STOP_SHIP_DATE,
       ORD_ALLOCATED_SHIP_DATE,
       ORD_DISCOUNT_DATE,
       ORD_DELIVERY_DATE,
       ORD_SHIP_DATE,
       ORD_SHIP_TIME,
       ORD_CREATE_DATE,
       ORD_CREATE_TIME,
       ORD_DATE_LAST_MODIFIED,
       ORD_TIME_LAST_MODIFIED,
       DWH_INSERT_DATE
FROM
  (SELECT CASE
              WHEN o04.divcode = '051' THEN 'SMRU80005'
              WHEN o04.divcode = '052' THEN 'SMRU73416'
              WHEN o04.divcode = '062' THEN 'SMRU80152'
              ELSE NULL
          END AS MU_ID,
          'CID001786' AS CUSTOMER_ID,
          CASE
              WHEN o04.divcode = '051' THEN 'US_3198'
              WHEN o04.divcode = '052' THEN 'US_5099'
              WHEN o04.divcode = '062' THEN 'CA_0370'
              ELSE NULL
          END AS FACILITY_ID,
          'Warehousing' AS SVC_AREA,
          TRIM (o04.shorto04) AS ORD_PICKTICKET_NBR,
               TRIM(o06.eorderid) ORD_NBR,
               CASE
                   WHEN o06.ordstat = 9 THEN SUM(o08.delquant)
                   ELSE SUM(o08.reqquant)
               END AS ORD_UNITS,
               '' ORD_SINGLE_FLAG,
                  o04.deladr AS ROUTE_DESC,
                  o06.noordl AS NBR_ORD_LINES,
                  CASE
                      WHEN o04.divcode = '051' THEN CASE
                                                        WHEN substr(o04.deladr, 1, 4) IN ('2583',
                                                                                          '3090') THEN 'Parcel'
                                                        WHEN substr(o04.deladr, 1, 4) IN ('1940',
                                                                                          '1941') THEN 'Yellow Line'
                                                        WHEN substr(o04.deladr, 1, 4) IN ('2683') THEN 'Customer PU'
                                                        ELSE 'LSC'
                                                    END
                      WHEN o04.divcode = '052' THEN CASE
                                                        WHEN substr(o04.deladr, 1, 4) IN ('1943',
                                                                                          '1944',
                                                                                          '2499') THEN 'Yellow Line'
                                                        WHEN substr(o04.deladr, 1, 4) IN ('2629') THEN 'Customer PU'
                                                        ELSE 'LSC'
                                                    END
                      WHEN o04.divcode = '062' THEN CASE
                                                        WHEN substr(o04.deladr, 1, 4) IN ('2270') THEN 'Parcel'
                                                        WHEN substr(o04.deladr, 1, 4) IN ('1829',
                                                                                          '1833') THEN 'Yellow Line'
                                                        WHEN substr(o04.deladr, 1, 2) IN ('24',
                                                                                          '25',
                                                                                          '26',
                                                                                          '27') THEN 'Penguin'
                                                        ELSE 'LSC'
                                                    END
                      ELSE NULL
                  END AS ROUTE_TYPE,
                  o04.divcode AS IKEA_CDC_NBR,
                  o04.delway ORD_MISC_05,
                  '' ORD_MISC_06,
                     '' ORD_MISC_07,
                        '' ORD_MISC_08,
                           '' ORD_MISC_09,
                              '' ORD_MISC_10,
                                 '' ORD_MISC_11,
                                    '' ORD_MISC_12,
                                       '' ORD_MISC_13,
                                          '' ORD_MISC_14,
                                             '' ORD_MISC_15,
                                                TRIM(o06.ordstat) AS ORD_STATUS,
                                                TRIM(o06.ordtype) AS ORD_ORDER_TYPE,
                                                o04.custnam1 AS ORD_SHIP_TO_CUSTOMER,
                                                '' ORD_STATE,
                                                   o042.custpc AS ORD_ZIP,
                                                   o042.custcoun AS ORD_COUNTRY,
                                                   r08.plandesc AS ORD_SHIP_VIA,
                                                   o06.shortr08 AS ORD_WAVE_NBR,
                                                   '' AS ORD_SERVICE_LEVEL,
                                                   o06.eorderid AS ORD_CUSTOMER_NBR,
                                                   '' ORD_PRIORITY,
                                                      '' ORD_PRIORITY_CODE,
                                                         '' ORD_GENERAL_MERCH_CATEGORY,
                                                            to_char(o06.regdate, 'yyyy-mm-dd') AS ORD_ADV_DATE,
                                                            to_char(o06.deldate, 'yyyy-mm-dd') AS ORD_SCHEDULED_DELIVERY_DATE,
                                                            to_char(o06.regdate, 'yyyy-mm-dd') AS ORD_GENERATE_DATE,
                                                            to_char(o06.regdate, 'yyyy-mm-dd') AS ORD_ORDER_DATE,
                                                            '' AS ORD_CANCEL_DATE,
                                                            '' AS ORD_START_SHIP_DATE,
                                                            '' AS ORD_STOP_SHIP_DATE,
                                                            '' ORD_ALLOCATED_SHIP_DATE,
                                                               '' ORD_DISCOUNT_DATE,
                                                                  '' ORD_DELIVERY_DATE,
                                                                     CASE
                                                                         WHEN o06.ordstat = 9 THEN MAX(to_char(o06.statdate, 'yyyy-mm-dd'))
                                                                         ELSE ' '
                                                                     END AS ORD_SHIP_DATE,
                                                                     CASE
                                                                         WHEN o06.ordstat = 9 THEN MAX(to_char(o06.statdate, 'HH:MI:SS AM'))
                                                                         ELSE ' '
                                                                     END AS ORD_SHIP_TIME,
                                                                     to_char(o06.regdate, 'yyyy-mm-dd') AS ORD_CREATE_DATE,
                                                                     to_char(o06.regdate, 'hh:mi:ss AM') AS ORD_CREATE_TIME,
                                                                     MAX(to_char(o06.statdate, 'yyyy-mm-dd')) AS ORD_DATE_LAST_MODIFIED,
                                                                     MAX(to_char(o06.statdate, 'hh:mi:ss AM')) AS ORD_TIME_LAST_MODIFIED,
                                                                     '' DWH_INSERT_DATE
   FROM ast051.o06t1 o06
   INNER JOIN ast051.o08t1 o08 ON o06.shorto06 = o08.shorto06
   INNER JOIN ast051.o04t1 o04 ON o06.shorto04 = o04.shorto04
   INNER JOIN ast051.o04t2 o042 ON o04.shorto04 = o042.shorto04
   INNER JOIN ast051.astro_view_cnt_r08100 r08 ON o06.shortr08 = r08.shortr08
   WHERE o06.statdate>= sysdate -1
   GROUP BY o04.shorto04,
            o06.eorderid,
            o08.reqquant,
            o04.deladr,
            o04.divcode,
            o06.noordl,
            o06.ordstat,
            o06.ordtype,
            o04.custnam1,
            o042.custpc,
            o042.custcoun,
            o04.delway,
            r08.plandesc,
            o06.shortr08,
            o06.eorderid,
            to_char(o06.regdate, 'yyyy-mm-dd'),
            to_char(o06.deldate, 'yyyy-mm-dd'),
            CASE
                WHEN o06.ordstat = 9 THEN to_char(o06.statdate, 'yyyy-mm-dd')
                ELSE ' '
            END,
            CASE
                WHEN o06.ordstat = 9 THEN to_char(o06.statdate, 'HH:MI:SS AM')
                ELSE ' '
            END,
            to_char(o06.regdate, 'yyyy-mm-dd'),
            to_char(o06.regdate, 'hh:mi:ss AM'),
            to_char(o06.statdate, 'yyyy-mm-dd'),
            to_char(o06.statdate, 'hh:mi:ss AM')
   ORDER BY o06.statdate ASC)
GROUP BY MU_ID,
         CUSTOMER_ID,
         FACILITY_ID,
         SVC_AREA,
         ORD_PICKTICKET_NBR,
         ORD_NBR,
         ORD_SINGLE_FLAG,
         ROUTE_DESC,
         NBR_ORD_LINES,
         ROUTE_TYPE,
         IKEA_CDC_NBR,
         ORD_MISC_05,
         ORD_MISC_06,
         ORD_MISC_07,
         ORD_MISC_08,
         ORD_MISC_09,
         ORD_MISC_10,
         ORD_MISC_11,
         ORD_MISC_12,
         ORD_MISC_13,
         ORD_MISC_14,
         ORD_MISC_15,
         ORD_STATUS,
         ORD_ORDER_TYPE,
         ORD_SHIP_TO_CUSTOMER,
         ORD_STATE,
         ORD_ZIP,
         ORD_COUNTRY,
         ORD_SHIP_VIA,
         ORD_WAVE_NBR,
         ORD_SERVICE_LEVEL,
         ORD_CUSTOMER_NBR,
         ORD_PRIORITY,
         ORD_PRIORITY_CODE,
         ORD_GENERAL_MERCH_CATEGORY,
         ORD_ADV_DATE,
         ORD_SCHEDULED_DELIVERY_DATE,
         ORD_GENERATE_DATE,
         ORD_ORDER_DATE,
         ORD_START_SHIP_DATE,
         ORD_STOP_SHIP_DATE,
         ORD_ALLOCATED_SHIP_DATE,
         ORD_DISCOUNT_DATE,
         ORD_DELIVERY_DATE,
         ORD_SHIP_DATE,
         ORD_SHIP_TIME,
         ORD_CREATE_DATE,
         ORD_CREATE_TIME,
         ORD_DATE_LAST_MODIFIED,
         ORD_TIME_LAST_MODIFIED,
         DWH_INSERT_DATE
ORDER BY ORD_DATE_LAST_MODIFIED ASC