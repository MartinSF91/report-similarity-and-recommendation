SELECT DISTINCT NULL AS PRODUCT_SK,
                NULL AS SITE_SK,
                CASE
                    WHEN l62.divcode = '051' THEN 'SMRU80005'
                    WHEN l62.divcode = '052' THEN 'SMRU73416'
                    WHEN l62.divcode = '062' THEN 'SMRU80152'
                    ELSE NULL
                END AS MU_ID,
                'CID001786' AS CUSTOMER_ID,
                CASE
                    WHEN l62.divcode = '051' THEN 'US_3198'
                    WHEN l62.divcode = '052' THEN 'US_5099'
                    WHEN l62.divcode = '062' THEN 'CA_0370'
                    ELSE NULL
                END AS FACILITY_ID,
                'Warehousing' AS SVC_AREA,
                l62.partno AS SKU,
                l62.wldct AS PRD_SIZE_DESC,
                l62.pmha AS PRD_PRODUCT_GROUP,
                l62.pzone AS PRD_PRODUCT_SUBGROUP,
                l62.parttype AS PRD_PRODUCT_TYPE,
                NULL AS PRD_SHIP_ALONE,
                l62.partunit AS PRD_UNIT_OF_MEASURE,
                l62.partdscu AS PRD_DESCRIPTION,
                NULL AS PRD_CARTON_TYPE,
                NULL AS PRD_PRICE,
                NULL AS PRD_RETL_PRICE,
                MAX(l62.huqty) AS PRD_STD_CASE_QUANTITY,
                MAX(l62.hulength) AS PRD_STD_CASE_LENGTH,
                MAX(l62.huwidth) AS PRD_STD_CASE_WIDTH,
                MAX(l62.huheight) AS PRD_STD_CASE_HEIGHT,
                MAX(l62.suwght) AS PRD_UNIT_WEIGHT,
                MAX(l62.suvol) AS PRD_UNIT_VOLUME,
                NULL AS PRD_STD_CASE_VOLUME,
                NULL AS PRD_CONVEYABLE,
                MAX(l62.sulength) AS PRD_STD_UNIT_LENGTH,
                MAX(l62.suwidth) AS PRD_STD_UNIT_WIDTH,
                MAX(l62.suheight) AS PRD_STD_UNIT_HEIGHT,
                NULL AS PRD_STATUS_FLAG,
                NULL AS PRD_VOLATILITY_CODE,
                NULL AS PRD_PACKAGE_TYPE,
                l62.partrev AS PRD_VENDOR_NUMBER,
                NULL AS PRD_VENDOR_PRODUCT_NBR,
                NULL AS PRD_HARMONIZED_CODE,
                l62.divcode AS PRD_MISC_01,
                TRIM(l62.partgrp8) AS PRD_MISC_02,
                CASE
                    WHEN TRIM(l62.partgrp8) LIKE '01%' THEN 'Living Room Seating'
                    WHEN TRIM(l62.partgrp8) LIKE '02%' THEN 'Store & Organize Furniture'
                    WHEN TRIM(l62.partgrp8) LIKE '03%' THEN 'Workspaces'
                    WHEN TRIM(l62.partgrp8) LIKE '04%' THEN 'Bedroom Furniture'
                    WHEN TRIM(l62.partgrp8) LIKE '05%' THEN 'Mattresses'
                    WHEN TRIM(l62.partgrp8) LIKE '06%' THEN 'Bathroom'
                    WHEN TRIM(l62.partgrp8) LIKE '07%' THEN 'Kitchen'
                    WHEN TRIM(l62.partgrp8) LIKE '08%' THEN 'Dining'
                    WHEN TRIM(l62.partgrp8) LIKE '09%' THEN 'Children Ikea'
                    WHEN TRIM(l62.partgrp8) LIKE '10%' THEN 'Lighting'
                    WHEN TRIM(l62.partgrp8) LIKE '11%' THEN 'Bed & Bath Textiles'
                    WHEN TRIM(l62.partgrp8) LIKE '12%' THEN 'Home Textiles'
                    WHEN TRIM(l62.partgrp8) LIKE '13%' THEN 'Rugs'
                    WHEN TRIM(l62.partgrp8) LIKE '14%' THEN 'Cooking'
                    WHEN TRIM(l62.partgrp8) LIKE '15%' THEN 'Eating'
                    WHEN TRIM(l62.partgrp8) LIKE '16%' THEN 'Decoration'
                    WHEN TRIM(l62.partgrp8) LIKE '17%' THEN 'Outdoor'
                    WHEN TRIM(l62.partgrp8) LIKE '18%' THEN 'Home Organization'
                    WHEN TRIM(l62.partgrp8) LIKE '19%' THEN 'Secondary Storage'
                    WHEN TRIM(l62.partgrp8) LIKE '20%' THEN 'Other Business Opportunities'
                    WHEN TRIM(l62.partgrp8) LIKE '70%' THEN 'Home Appliances'
                    WHEN TRIM(l62.partgrp8) LIKE '92%' THEN 'Family'
                    WHEN TRIM(l62.partgrp8) LIKE '94%' THEN 'Administrative Area 94'
                    WHEN TRIM(l62.partgrp8) LIKE '95%' THEN 'Administrative Area 95'
                    ELSE 'Other'
                END AS PRD_MISC_03,
                NULL AS PRD_BRAND,
                NULL AS PRD_COLOR,
                NULL AS PRD_HIER_CATEGORY,
                NULL AS PRD_HIER_DEPARTMENT,
                NULL AS PRD_HIER_GENDER,
                NULL AS PRD_HIER_CUSTOMER_DIVISION,
                TO_CHAR(l62.regdate, 'mm/dd/yyyy') AS PRD_DATE_CREATED,
                TO_CHAR(l62.regdate, 'hh:mi:ss AM') AS PRD_TIME_CREATED,
                TO_CHAR(l62.stkdate, 'mm/dd/yyyy') AS PRD_DATE_LAST_MODIFIED,
                TO_CHAR(l62.stkdate, 'hh:mi:ss AM') AS PRD_TIME_LAST_MODIFIED,
                NULL AS DWH_INSERT_DATE
FROM ast052.L62T1 l62
WHERE l62.stkdate > sysdate -1
GROUP BY CASE
             WHEN l62.divcode = '051' THEN 'SMRU80005'
             WHEN l62.divcode = '052' THEN 'SMRU73416'
             WHEN l62.divcode = '062' THEN 'SMRU80152'
             ELSE NULL
         END,
         CASE
             WHEN l62.divcode = '051' THEN 'US_3198'
             WHEN l62.divcode = '052' THEN 'US_5099'
             WHEN l62.divcode = '062' THEN 'CA_0370'
             ELSE NULL
         END,
         l62.partno,
         l62.wldct,
         l62.pmha,
         l62.pzone,
         l62.parttype,
         l62.partunit,
         l62.partdscu,
         l62.partrev,
         l62.divcode,
         TRIM(l62.partgrp8),
         CASE
             WHEN TRIM(l62.partgrp8) LIKE '01%' THEN 'Living Room Seating'
             WHEN TRIM(l62.partgrp8) LIKE '02%' THEN 'Store & Organize Furniture'
             WHEN TRIM(l62.partgrp8) LIKE '03%' THEN 'Workspaces'
             WHEN TRIM(l62.partgrp8) LIKE '04%' THEN 'Bedroom Furniture'
             WHEN TRIM(l62.partgrp8) LIKE '05%' THEN 'Mattresses'
             WHEN TRIM(l62.partgrp8) LIKE '06%' THEN 'Bathroom'
             WHEN TRIM(l62.partgrp8) LIKE '07%' THEN 'Kitchen'
             WHEN TRIM(l62.partgrp8) LIKE '08%' THEN 'Dining'
             WHEN TRIM(l62.partgrp8) LIKE '09%' THEN 'Children Ikea'
             WHEN TRIM(l62.partgrp8) LIKE '10%' THEN 'Lighting'
             WHEN TRIM(l62.partgrp8) LIKE '11%' THEN 'Bed & Bath Textiles'
             WHEN TRIM(l62.partgrp8) LIKE '12%' THEN 'Home Textiles'
             WHEN TRIM(l62.partgrp8) LIKE '13%' THEN 'Rugs'
             WHEN TRIM(l62.partgrp8) LIKE '14%' THEN 'Cooking'
             WHEN TRIM(l62.partgrp8) LIKE '15%' THEN 'Eating'
             WHEN TRIM(l62.partgrp8) LIKE '16%' THEN 'Decoration'
             WHEN TRIM(l62.partgrp8) LIKE '17%' THEN 'Outdoor'
             WHEN TRIM(l62.partgrp8) LIKE '18%' THEN 'Home Organization'
             WHEN TRIM(l62.partgrp8) LIKE '19%' THEN 'Secondary Storage'
             WHEN TRIM(l62.partgrp8) LIKE '20%' THEN 'Other Business Opportunities'
             WHEN TRIM(l62.partgrp8) LIKE '70%' THEN 'Home Appliances'
             WHEN TRIM(l62.partgrp8) LIKE '92%' THEN 'Family'
             WHEN TRIM(l62.partgrp8) LIKE '94%' THEN 'Administrative Area 94'
             WHEN TRIM(l62.partgrp8) LIKE '95%' THEN 'Administrative Area 95'
             ELSE 'Other'
         END,
         l62.regdate,
         l62.stkdate