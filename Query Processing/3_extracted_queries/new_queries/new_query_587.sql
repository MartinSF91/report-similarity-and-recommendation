SELECT MU_ID,
       CUSTOMER_ID,
       FACILITY_ID,
       SVC_AREA,
       CRTN_NBR,
       CRTN_PICKTICKET,
       CRTN_TRACKING_NBR,
       CRTN_MANIFEST_NBR,
       CRTN_CARRIER_CHARGE,
       CRTN_FIRST_PICK_LOCATION,
       CRTN_CURR_LOCATION,
       CRTN_CURR_ZONE,
       CRTN_CURR_AISLE,
       CRTN_CURR_BAY,
       CRTN_CURR_LEVEL,
       CRTN_CURR_POSITION,
       CRTN_DEST_LOCATION,
       CRTN_SHIPMENT_NBR,
       CRTN_LOAD_NBR,
       CRTN_TYPE,
       CRTN_SIZE,
       CRTN_STATUS,
       SUM(CRTN_QTY) AS CRTN_QTY,
       CRTN_PALLET,
       CRTN_STORE_NBR,
       CRTN_PUTWALL_TYPE,
       CRTN_PUTWALL_SLOT_TYPE,
       CRTN_SHIP_VIA,
       CRTN_ROUTE_TYPE,
       IKEA_CDC_NBR,
       CRTN_MISC_03,
       CRTN_MISC_04,
       CRTN_MISC_05,
       CRTN_DATE_CREATED,
       CRTN_TIME_CREATED,
       CRTN_SHIP_DATE,
       CRTN_SHIP_TIME,
       CRTN_DATE_LAST_MODIFIED,
       CRTN_TIME_LAST_MODIFIED,
       DWH_INSERT_DATE
FROM
  (SELECT -- Add to case statement below if new business added
 CASE
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
 o40.ecarrno CRTN_NBR,
 o06.shorto04 CRTN_PICKTICKET,
 '' CRTN_TRACKING_NBR,
    o40.ocarrno AS CRTN_MANIFEST_NBR,
    '' CRTN_CARRIER_CHARGE,
       '' CRTN_FIRST_PICK_LOCATION,
          '' CRTN_CURR_LOCATION,
             '' CRTN_CURR_ZONE,
                '' CRTN_CURR_AISLE,
                   '' CRTN_CURR_BAY,
                      '' CRTN_CURR_LEVEL,
                         '' CRTN_CURR_POSITION,
                            '' CRTN_DEST_LOCATION,
                               o40.shortr08 AS CRTN_SHIPMENT_NBR,
                               '' CRTN_LOAD_NBR,
                                  o40.ocarrtyp AS CRTN_TYPE,
                                  '' CRTN_SIZE,
                                     TRIM(o40.stato40) AS CRTN_STATUS,
                                     SUM(o42.ocquant) AS CRTN_QTY,
                                     '' CRTN_PALLET,
                                        '' CRTN_STORE_NBR,
                                           '' CRTN_PUTWALL_TYPE,
                                              '' CRTN_PUTWALL_SLOT_TYPE,
                                                 '' AS CRTN_SHIP_VIA, -- Add to case statement below if new routes added
 CASE
     WHEN TRIM(o40.divgroup) = '051' THEN CASE
                                              WHEN substr(o40.deladr, 1, 4) IN ('2583') THEN 'Parcel'
                                              WHEN substr(o40.deladr, 1, 4) IN ('1940',
                                                                                '1941') THEN 'Yellow Line'
                                              WHEN substr(o40.deladr, 1, 4) IN ('2683') THEN 'Customer PU'
                                              ELSE 'LSC'
                                          END
     WHEN TRIM(o40.divgroup) = '052' THEN CASE
                                              WHEN substr(o40.deladr, 1, 4) IN ('1943',
                                                                                '1944',
                                                                                '2499') THEN 'Yellow Line'
                                              WHEN substr(o40.deladr, 1, 4) IN ('2629') THEN 'Customer PU'
                                              ELSE 'LSC'
                                          END
     WHEN TRIM(o40.divgroup) = '062' THEN CASE
                                              WHEN substr(o40.deladr, 1, 4) IN ('2270') THEN 'Parcel'
                                              WHEN substr(o40.deladr, 1, 4) IN ('1829',
                                                                                '1833') THEN 'Yellow Line'
                                              WHEN substr(o40.deladr, 1, 2) IN ('24',
                                                                                '25',
                                                                                '26',
                                                                                '27') THEN 'Penguin'
                                              ELSE 'LSC'
                                          END
     ELSE NULL
 END AS CRTN_ROUTE_TYPE,
 TRIM(o40.divgroup) AS IKEA_CDC_NBR,
 o06.ordstat AS CRTN_MISC_03,
 '' CRTN_MISC_04,
    '' CRTN_MISC_05,
       to_char(o40.regdate, 'yyyy-mm-dd') AS CRTN_DATE_CREATED,
       to_char(o40.regdate, 'hh:mi:ss AM') AS CRTN_TIME_CREATED,
       CASE
           WHEN o06.ordstat = 9 THEN MAX(to_char(o06.statdate, 'yyyy-mm-dd'))
           ELSE ' '
       END AS CRTN_SHIP_DATE,
       CASE
           WHEN o06.ordstat = 9 THEN MAX(to_char(o06.statdate, 'HH:MI:SS AM'))
           ELSE ' '
       END AS CRTN_SHIP_TIME,
       MAX(to_char(o06.statdate, 'yyyy-mm-dd')) AS CRTN_DATE_LAST_MODIFIED,
       MAX(to_char(o06.statdate, 'hh:mi:ss AM')) AS CRTN_TIME_LAST_MODIFIED,
       '' DWH_INSERT_DATE
   FROM ast052.o40t2 o40
   INNER JOIN ast052.o42t2 o42 ON o40.ocarrno = o42.ocarrno
   INNER JOIN ast052.o06t1 o06 ON o40.shorto06 = o06.shorto06
   WHERE o06.statdate >= sysdate-1
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
            CASE
                WHEN TRIM(o40.divgroup) = '051' THEN CASE
                                                         WHEN substr(o40.deladr, 1, 4) IN ('2583') THEN 'Parcel'
                                                         WHEN substr(o40.deladr, 1, 4) IN ('1940',
                                                                                           '1941') THEN 'Yellow Line'
                                                         WHEN substr(o40.deladr, 1, 4) IN ('2683') THEN 'Customer PU'
                                                         ELSE 'LSC'
                                                     END
                WHEN TRIM(o40.divgroup) = '052' THEN CASE
                                                         WHEN substr(o40.deladr, 1, 4) IN ('1943',
                                                                                           '1944',
                                                                                           '2499') THEN 'Yellow Line'
                                                         WHEN substr(o40.deladr, 1, 4) IN ('2629') THEN 'Customer PU'
                                                         ELSE 'LSC'
                                                     END
                WHEN TRIM(o40.divgroup) = '062' THEN CASE
                                                         WHEN substr(o40.deladr, 1, 4) IN ('2270') THEN 'Parcel'
                                                         WHEN substr(o40.deladr, 1, 4) IN ('1829',
                                                                                           '1833') THEN 'Yellow Line'
                                                         WHEN substr(o40.deladr, 1, 2) IN ('24',
                                                                                           '25',
                                                                                           '26',
                                                                                           '27') THEN 'Penguin'
                                                         ELSE 'LSC'
                                                     END
                ELSE NULL
            END,
            o40.ecarrno,
            o06.shorto04,
            o40.ocarrno,
            o40.shortr08,
            o40.ocarrtyp,
            TRIM(o40.stato40),
            TRIM(o40.divgroup),
            o06.ordstat,
            to_char(o40.regdate, 'yyyy-mm-dd'),
            to_char(o40.regdate, 'hh:mi:ss AM'),
            CASE
                WHEN o06.ordstat = 9 THEN to_char(o06.statdate, 'yyyy-mm-dd')
                ELSE ' '
            END,
            CASE
                WHEN o06.ordstat = 9 THEN to_char(o06.statdate, 'HH:MI:SS AM')
                ELSE ' '
            END,
            to_char(o06.statdate, 'yyyy-mm-dd'),
            to_char(o06.statdate, 'hh:mi:ss AM'))
GROUP BY MU_ID,
         CUSTOMER_ID,
         FACILITY_ID,
         SVC_AREA,
         CRTN_NBR,
         CRTN_PICKTICKET,
         CRTN_MANIFEST_NBR,
         CRTN_SHIPMENT_NBR,
         CRTN_LOAD_NBR,
         CRTN_TYPE,
         CRTN_SIZE,
         CRTN_STATUS,
         CRTN_QTY,
         CRTN_PALLET,
         CRTN_SHIP_VIA,
         CRTN_ROUTE_TYPE,
         IKEA_CDC_NBR,
         CRTN_MISC_03,
         CRTN_DATE_CREATED,
         CRTN_TIME_CREATED,
         CRTN_SHIP_DATE,
         CRTN_SHIP_TIME,
         CRTN_DATE_LAST_MODIFIED,
         CRTN_TIME_LAST_MODIFIED