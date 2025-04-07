
SELECT MU_ID,
       CUSTOMER_ID,
       FACILITY_ID,
       SVC_AREA,
       TO_CHAR(datreg, 'yyyy-mm-dd') AS "DATE",
       TO_CHAR(datreg, 'hh:mi:ss AM') AS "TIME",
       "FUNCTION",
       "USER",
       SKU,
       DISTRO_NBR,
       LPN,
       CARTON_NBR,
       PICKTICKET_NBR,
       TASK_NBR,
       "_LOCATION",
       "_UOM",
       QTY
FROM
  (SELECT CASE
              WHEN l16.divcode = '051' THEN 'SMRU80005'
              WHEN l16.divcode = '052' THEN 'SMRU73416'
              WHEN l16.divcode = '062' THEN 'SMRU80152'
              ELSE NULL
          END AS MU_ID,
          'CID001786' AS CUSTOMER_ID,
          CASE
              WHEN l16.divcode = '051' THEN 'US_3198'
              WHEN l16.divcode = '052' THEN 'US_5099'
              WHEN l16.divcode = '062' THEN 'CA_0370'
              ELSE NULL
          END AS FACILITY_ID,
          'Warehousing' AS SVC_AREA,
          l16.l16seqno SEQNO,
          l16.datreg,
          CASE
              WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '100'
          AND l16.ocarrno != 0 THEN 'Breakdown, Receive and Verify Plock Articles'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600'
          AND l16.ordtype = 12 THEN 'Parcel Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600'
          AND l16.ordtype != 12
          AND l16.ocarrtyp = 'VSP' THEN 'Check and Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '2600' THEN 'Unload'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('310',
                                                       '311',
                                                       '313',
                                                       '390',
                                                       '391',
                                                       '3100') THEN CASE
                                                                        WHEN l62.cquant = l16.l16qty THEN 'Pallet'
                                                                        ELSE 'Case'
                                                                    END ||' '||'Putaway'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '333',
                                                       '393')
          AND TRIM(l16.admunit) != 'CASE' THEN 'Replenishment - Reach'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '333',
                                                       '393')
          AND TRIM(l16.admunit) = 'CASE' THEN 'Replenishment - Order Picker'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683') THEN 'Loading: LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Loading: Parcel'
 END
              WHEN l16.divcode = '052' THEN --Staten Island Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '100'
          AND l16.ocarrno != 0 THEN 'Breakdown, Receive and Verify Plock Articles'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '2600' THEN 'Unload'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('310',
                                                       '311',
                                                       '313',
                                                       '390',
                                                       '391',
                                                       '3100') THEN 'Putaway'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '331',
                                                       '333',
                                                       '393') THEN 'Replenishment - Reach'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND l16.ocarrtyp NOT LIKE ('V%') THEN 'Loading: LSC'
 END
              WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '100'
          AND l16.ocarrno != 0 THEN 'Breakdown, Receive and Verify Plock Articles'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT')THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600'
          AND l16.ordtype = 12 THEN 'Parcel Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'Check & Pack' --When l16.l16lcode||l16.l54movet||l16.l16destc in ('6100','6200') THEN 'Parcel Audit'

     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '2600' THEN 'Unload'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('310',
                                                       '311',
                                                       '390',
                                                       '391',
                                                       '3100') THEN 'Putaway'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '331',
                                                       '333',
                                                       '393') THEN 'Replenishment - Reach'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Loading: LSC' --This is indirect for Kleinburg

     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Loading: Parcel'
 END
          END "FUNCTION", --KRONOS DESCRIPTION
CASE
    WHEN LENGTH(TRIM(s90.uname))=5 THEN substr(TRIM(s90.uname), 2, 4)
    ELSE TRIM(s90.uname)
                                              END AS "USER",
                                              l16.shortl62 AS SKU,
                                              l16.shortr08 AS DISTRO_NBR,
                                              l16.ecarrno AS LPN,
                                              l16.ocarrno AS CARTON_NBR,
                                              l16.shorto04 AS PICKTICKET_NBR,
                                              l16.l54uniq AS TASK_NBR,
                                              CASE
                                                  WHEN (TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor) IS NULL
                                                        AND TRIM(l16.rack)||TRIM(l16.horcoor)||TRIM(l16.vercoor) IS NULL) THEN l16.fmha
                                                  WHEN TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor) IS NULL THEN TRIM(l16.rack)||TRIM(l16.horcoor)||TRIM(l16.vercoor)
                                                  ELSE TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor)
                                              END AS "_LOCATION",
                                              CASE
                                                  WHEN l16.divcode = '051' THEN --Lakeland Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '331',
                                                       '333',
                                                       '393')
          AND TRIM(l16.admunit) = 'CASE' THEN 'Cases'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('310',
                                                       '311',
                                                       '313',
                                                       '390',
                                                       '391',
                                                       '3100')
          AND l62.cquant != l16.l16qty THEN 'Cases'
     ELSE 'Pallets'
 END
                                                  WHEN l16.divcode = '052' THEN --Staten Island Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     ELSE 'Pallets'
 END
                                                  WHEN l16.divcode = '062' THEN --Kleinburg Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     ELSE 'Pallets'
 END
                                              END AS "_UOM",
                                              COUNT(*) AS QTY
   FROM ast051.ASTRO_VIEW_CNT_SVL16001 l16
   INNER JOIN ast051.s90t1 s90 ON l16.logguser = s90.uname
   FULL OUTER JOIN ast051.l62t1 l62 ON l16.shortl62 = l62.shortl62
   WHERE l16.divcode != ' '
     AND s90.utype = 9
     AND l16.datreg >= sysdate -1 --Removed AND LENGTH(TRIM(s90.uname))<5

   HAVING l16.l16lcode||l16.l54movet||l16.l16destc IN ('100',
                                                       '310',
                                                       '311',
                                                       '330',
                                                       '331',
                                                       '333',
                                                       '390',
                                                       '391',
                                                       '393',
                                                       '2600',
                                                       '3100',
                                                       '4000',
                                                       '4600')
   GROUP BY l16.l16seqno,
            l16.divcode,
            l16.datreg,
            l16.l16lcode||l16.l54movet||l16.l16destc,
            l16.ordtype,
            l16.ocarrtyp,
            l16.routeno,
            l16.admunit,
            TRIM(s90.uname),
            l16.shortl62,
            l16.shortr08,
            l16.ecarrno,
            l16.ocarrno,
            l16.shorto04,
            l16.l54uniq,
            CASE
                WHEN (TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor) IS NULL
                      AND TRIM(l16.rack)||TRIM(l16.horcoor)||TRIM(l16.vercoor) IS NULL) THEN l16.fmha
                WHEN TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor) IS NULL THEN TRIM(l16.rack)||TRIM(l16.horcoor)||TRIM(l16.vercoor)
                ELSE TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor)
            END,
            l62.cquant,
            l16.l16qty)
WHERE "FUNCTION" IS NOT NULL
GROUP BY SEQNO,
         MU_ID,
         CUSTOMER_ID,
         FACILITY_ID,
         SVC_AREA,
         TO_CHAR(datreg, 'yyyy-mm-dd'),
         TO_CHAR(datreg, 'hh:mi:ss AM'),
         "FUNCTION",
         "USER",
         SKU,
         DISTRO_NBR,
         LPN,
         CARTON_NBR,
         PICKTICKET_NBR,
         TASK_NBR,
         "_LOCATION",
         "_UOM",
         QTY
UNION ALL ------------------Picking Only FA Query------------------

SELECT MU_ID,
       CUSTOMER_ID,
       FACILITY_ID,
       SVC_AREA,
       TO_CHAR(datreg, 'yyyy-mm-dd') AS "DATE",
       TO_CHAR(datreg, 'hh:mi:ss AM') AS "TIME",
       "FUNCTION",
       "USER",
       SKU,
       DISTRO_NBR,
       LPN,
       CARTON_NBR,
       PICKTICKET_NBR,
       TASK_NBR,
       "_LOCATION",
       "_UOM",
       SUM(QTY) AS QTY
FROM
  (SELECT CASE
              WHEN l16.divcode = '051' THEN 'SMRU80005'
              WHEN l16.divcode = '052' THEN 'SMRU73416'
              WHEN l16.divcode = '062' THEN 'SMRU80152'
              ELSE NULL
          END AS MU_ID,
          'CID001786' AS CUSTOMER_ID,
          CASE
              WHEN l16.divcode = '051' THEN 'US_3198'
              WHEN l16.divcode = '052' THEN 'US_5099'
              WHEN l16.divcode = '062' THEN 'CA_0370'
              ELSE NULL
          END AS FACILITY_ID,
          'Warehousing' AS SVC_AREA,
          l16.datreg,
          CASE
              WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2683') THEN 'Order Pick: Parcel'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) NOT IN ('CLUS4',
                                        'CLUS6',
                                        'C&P-Y') THEN 'Order Pick: Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) LIKE ('CLUS%') THEN 'Order Pick: Yellow Line Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) IN ('C&P-Y') THEN 'Order Pick: Yellow Line Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Order Pick: Customer Pick-Up'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Order Pick: Customer Pick-Up'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Order Pick: LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Order Pick: LSC Check & Pack'
 END
              WHEN l16.divcode = '052' THEN --Staten Island Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) NOT IN ('CARTX',
                                        'CARTN',
                                        'GRN-X',
                                        'GRN-N',
                                        'C&P-X',
                                        'C&P-N') THEN 'Order Pick: Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('CARTX',
                                    'CARTN') THEN 'Order Pick: Yellow Line Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('GRN-X',
                                    'GRN-N') THEN 'Order Pick: Yellow Line Green Dot'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('C&P-X',
                                    'C&P-N') THEN 'Order Pick: Yellow Line Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Order Pick: Customer Pick-Up'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Order Pick: LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Order Pick: LSC Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2629') THEN 'Parcel Picking'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Order Pick: Customer Pick-Up'
 END
              WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT') THEN 'Order Pick: Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12 THEN 'Order Pick: Penguin'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'Order Pick: LSC'
 END
          END "FUNCTION", --KRONOS DESCRIPTION
CASE
    WHEN LENGTH(TRIM(s90.uname))=5 THEN substr(TRIM(s90.uname), 2, 4)
    ELSE TRIM(s90.uname)
                                              END AS "USER",
                                              l16.shortl62 AS SKU,
                                              l16.shortr08 AS DISTRO_NBR,
                                              l16.ecarrno AS LPN,
                                              l16.ocarrno AS CARTON_NBR,
                                              l16.shorto04 AS PICKTICKET_NBR,
                                              l16.l54uniq AS TASK_NBR,
                                              CASE
                                                  WHEN (TRIM(l16.frack) = ' '
                                                        OR TRIM(l16.fhorcoor) = ' '
                                                        OR TRIM(l16.fvercoor) = ' ') THEN NULL
                                                  ELSE TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor)
                                              END AS "_LOCATION",
                                              CASE
                                                  WHEN l16.divcode = '051' THEN --Lakeland Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('330',
                                                       '331',
                                                       '333',
                                                       '393')
          AND TRIM(l16.admunit) = 'CASE' THEN 'Cases'
     ELSE 'Pallets'
 END
                                                  WHEN l16.divcode = '052' THEN --Staten Island Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     ELSE 'Pallets'
 END
                                                  WHEN l16.divcode = '062' THEN --Kleinburg Units
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400') THEN 'Lines'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4600' THEN 'Cartons'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype != 12 THEN 'Pallets'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '4000'
          AND l16.ordtype = 12 THEN 'Cartons'
     ELSE 'Pallets'
 END
                                              END AS "_UOM",
                                              COUNT(*) AS QTY
   FROM ast051.ASTRO_VIEW_CNT_SVL16001 l16
   INNER JOIN ast051.s90t1 s90 ON l16.logguser = s90.uname
   WHERE l16.divcode != ' '
     AND s90.utype = 9
     AND l16.datreg >= sysdate -1 --Removed AND LENGTH(TRIM(s90.uname))<5

   HAVING l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
   GROUP BY l16.l16seqno,
            l16.divcode,
            l16.datreg,
            l16.l16lcode||l16.l54movet||l16.l16destc,
            l16.ordtype,
            l16.ocarrtyp,
            l16.routeno,
            l16.admunit,
            TRIM(s90.uname),
            l16.shortl62,
            l16.shortr08,
            l16.ecarrno,
            l16.ocarrno,
            l16.shorto04,
            l16.l54uniq,
            CASE
                WHEN (TRIM(l16.frack) = ' '
                      OR TRIM(l16.fhorcoor) = ' '
                      OR TRIM(l16.fvercoor) = ' ') THEN NULL
                ELSE TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor)
            END,
            l16.l16qty)
GROUP BY MU_ID,
         CUSTOMER_ID,
         FACILITY_ID,
         SVC_AREA,
         TO_CHAR(datreg, 'yyyy-mm-dd'),
         TO_CHAR(datreg, 'hh:mi:ss AM'),
         "FUNCTION",
         "USER",
         SKU,
         DISTRO_NBR,
         LPN,
         CARTON_NBR,
         PICKTICKET_NBR,
         TASK_NBR,
         "_LOCATION",
         "_UOM"