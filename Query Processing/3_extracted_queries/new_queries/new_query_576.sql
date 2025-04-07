SELECT NULL AS SITE_SK,
       NULL AS PRODUCT_SK,
       CASE
           WHEN FIRST_VALUE(g08.divcode) OVER (
                                               ORDER BY g08.divcode) = '051' THEN 'SMRU80005'
           WHEN FIRST_VALUE(g08.divcode) OVER (
                                               ORDER BY g08.divcode) = '052' THEN 'SMRU73416'
           WHEN FIRST_VALUE(g08.divcode) OVER (
                                               ORDER BY g08.divcode) = '062' THEN 'SMRU80152'
           ELSE NULL
       END AS MU_ID, -- Needs to be hard coded for each site
 'CID001786' AS CUSTOMER_ID,
 CASE
     WHEN FIRST_VALUE(g08.divcode) OVER (
                                         ORDER BY g08.divcode) = '051' THEN 'US_3198'
     WHEN FIRST_VALUE(g08.divcode) OVER (
                                         ORDER BY g08.divcode) = '052' THEN 'US_5099'
     WHEN FIRST_VALUE(g08.divcode) OVER (
                                         ORDER BY g08.divcode) = '062' THEN 'CA_0370'
     ELSE NULL
 END AS FACILITY_ID, -- Needs to be hard coded for each site
 'Warehousing' AS SVC_AREA,
 CASE --Need new logic for this

     WHEN L30.mha LIKE '%P%'
          OR L30.mha LIKE 'P3%'
          OR L30.mha LIKE 'LC%' THEN 'Active'
     WHEN L30.mha LIKE '%R%' THEN 'Reserve' --WHEN L30.mha LIKE '%W%' THEN 'Westampton'

     ELSE 'Other'
 END AS LOCN_TYPE,
 TRIM(L30.rack) ||TRIM(L30.horcoor)||TRIM(L30.vercoor) AS LOCATION,
 TRIM(L30.mha) AS LOCN_AREA,
 TRIM(L30.zone) AS LOCN_ZONE,
 TRIM(L30.rack) AS LOCN_AISLE,
 TRIM(L30.horcoor) AS LOCN_BAY,
 TRIM(L30.vercoor) AS LOCN_LEVEL,
 NULL AS LOCN_POSITION,
 TRIM(L30.shorcoor) AS LOCN_SEQUENCE,
 NULL AS LOCN_SEQUENCE_CODE,
 G08.partno AS LOCN_SKU,
 NULL AS LOCN_LOT_CODE,
 G08.ldct AS LOCN_SIZE_TYPE,
 G08.ma_lock AS LOCN_LOCKED_FLAG,
 G08.reserved AS LOCN_WORK_GROUP,
 NULL AS LOCN_VELOCITY,
 G08.depth AS LOCN_LENGTH,
 G08.width AS LOCN_WIDTH,
 G08.height AS LOCN_HEIGHT,
 NULL AS LOCN_TO_BE_PICKED,
 NULL AS LOCN_TO_BE_FILLED,
 G08.amooncr AS LOCN_ACTUAL_INVENTORY,
 G08.minval AS LOCN_MIN_INVENTORY,
 G08.maxval AS LOCN_MAX_INVENTORY,
 G08.carrvol AS LOCN_ACTUAL_VOLUME,
 NULL AS LOCN_MIN_VOLUME,
 G08.g08huqty AS LOCN_MAX_VOLUME,
 G08.carrwght AS LOCN_ACTUAL_WEIGHT,
 NULL AS LOCN_MAX_WEIGHT,
 NULL AS LOCN_ACTUAL_NBR_CASES,
 NULL AS LOCN_MIN_NBR_CASES,
 NULL AS LOCN_MAX_NBR_CASES,
 l30.noinloc AS LOCN_ACTUAL_NBR_PALLETS,
 NULL AS LOCN_MIN_NBR_PALLETS,
 l30.minloc AS LOCN_MAX_NBR_PALLETS,
 CASE
     WHEN TRIM(G08.mha) IS NULL THEN 0
     ELSE G08.lockcode
 END AS LOCN_INV_LOCK_CODE,
 NULL AS LOCN_WORK_AREA,
 NULL AS LOCN_X_COORD,
 NULL AS LOCN_Y_COORD,
 NULL AS LOCN_Z_COORD,
 NULL AS LOCN_COUNT_IN_PROGRESS,
 L30.locstat AS LOCN_MISC_01,
 CASE
     WHEN L30.locstat = 0 THEN 'Undefined'
     WHEN L30.locstat = 1 THEN 'Free'
     WHEN L30.locstat = 2 THEN 'Occupied'
     WHEN L30.locstat = 4 THEN 'Blocked In'
     WHEN L30.locstat = 6 THEN 'Occupied + Blocked In'
     WHEN L30.locstat = 8 THEN ' Blocked Out'
     WHEN L30.locstat = 10 THEN 'Occupied + Blocked Out'
     WHEN L30.locstat = 12 THEN 'Blocked In + Out'
     WHEN L30.locstat = 14 THEN 'Occupied Blocked In + Out'
     ELSE NULL
 END AS LOCN_MISC_02,
 NULL AS LOCN_MISC_03,
 NULL AS LOCN_MISC_04,
 NULL AS LOCN_MISC_05,
 TO_CHAR(G08.stkdate, 'mm/dd/yyyy') AS LOCN_LAST_CC_DATE,
 TO_CHAR(G08.stkdate, 'hh:mi:ss AM') AS LOCN_LAST_CC_TIME,
 TO_CHAR(G08.regdate, 'mm/dd/yyyy') AS LOCN_CREATE_CC_DATE,
 TO_CHAR(G08.regdate, 'hh:mi:ss AM') AS LOCN_CREATE_CC_TIME,
 TO_CHAR(G08.statdate, 'mm/dd/yyyy') AS LOCN_DATE_LAST_MODIFIED,
 TO_CHAR(G08.statdate, 'hh:mi:ss AM') AS LOCN_TIME_LAST_MODIFIED,
 NULL AS DWH_INSERT_DATE
FROM ast051.ASTRO_VIEW_CNT_G08T1 G08
FULL OUTER JOIN ast051.ASTRO_VIEW_CNT_L30T1 L30 ON G08.mha = L30.mha
AND G08.rack = L30.rack
AND G08.horcoor = L30.horcoor
AND G08.vercoor = L30.vercoor
WHERE TRIM(L30.rack) ||TRIM(L30.horcoor)||TRIM(L30.vercoor) IS NOT NULL --SI Has this portion changed in the initial query, please reference COGNOS 052 Location Dim for Details
AND TRIM(L30.mha) NOT LIKE 'L49%'
  AND G08.g08stkch >= sysdate -1