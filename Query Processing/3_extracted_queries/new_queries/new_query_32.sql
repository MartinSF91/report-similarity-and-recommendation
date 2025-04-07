SELECT CASE
           WHEN l16.divcode = '051' THEN 'SMRU80005'
           WHEN l16.divcode = '052' THEN 'SMRU73416'
           WHEN l16.divcode = '062' THEN 'SMRU80152'
           ELSE NULL
       END AS MU_ID ,
       'CID001786' AS CUSTOMER_ID ,
       CASE
           WHEN l16.divcode = '051' THEN 'US_3198'
           WHEN l16.divcode = '052' THEN 'US_5099'
           WHEN l16.divcode = '062' THEN 'CA_0370'
           ELSE NULL
       END AS FACILITY_ID ,
       'Warehousing' AS SVC_AREA --PICK_TYPE Logic for each IKEA Warehouse. Yellow Line, LSC, Parcel, and Customer Pick-up. PICK_MISC_2 has more granular data about Pick Flow (Discrete, Cluster, Etc.)
 ,
       CASE
           WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2683') THEN 'Parcel'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Customer Pick-Up'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683') THEN 'LSC'
 END
           WHEN l16.divcode = '052' THEN --Staten Island Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629') THEN 'LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Customer Pick-up'
 END
           WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 3) = 'PEN' THEN 'Penguin'
 END
       END AS PICK_TYPE ,
       TO_CHAR(l16.datreg, 'yyyy-mm-dd') AS PICK_DATE ,
       TO_CHAR(l16.datreg, 'hh:mi:ss AM') AS PICK_TIME ,
       CASE
           WHEN o40.ecarrno IS NULL THEN l16.ecarrno
           ELSE o40.ecarrno
       END AS CRTN_NBR ,
       o04.shorto04 AS ORD_PICKTICKET_NBR ,
       SUM(l16.l16qty) AS PICK_QTY ,
       TRIM(l16.frack)||TRIM(l16.Fhorcoor)||(TRIM(fvercoor)) AS LOCATION ,
       l16.partno AS SKU ,
       l16.shortr08 AS WAVE_NBR ,
       l16.logguser AS USER_ID ,
       NULL AS PICK_MENU_OPTION ,
       l16.ocarrno AS PICK_MISC_1 --Picking Flow logic for each IKEA Warehouse. (Discrete, Cluster, Check and Pack, Etc.)
 ,
       CASE
           WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) NOT IN ('CLUS',
                                        'C&P-Y') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) LIKE ('CLUS%') THEN 'Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) IN ('C&P-Y') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Check & Pack'
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
                                        'C&P-N') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('CARTX',
                                    'CARTN') THEN 'Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('GRN-X',
                                    'GRN-N') THEN 'Green Dot'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('C&P-X',
                                    'C&P-N') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2629') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Discrete'
 END
           WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12 THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'Discrete'
 END
       END AS PICK_MISC_2 ,
       TRIM(l16.Emha) AS PICK_MISC_3 ,
       l16.partrev AS PICK_MISC_4 ,
       l16.ocarrtyp AS PICK_MISC_5
FROM ast051.ASTRO_VIEW_CNT_SVL16001 l16
FULL OUTER JOIN ast051.O40T2 o40 ON l16.ocarrno = o40.ocarrno
FULL OUTER JOIN ast051.O04T1 o04 ON l16.ordno = o04.ordno
WHERE l16.l16lcode = '4'
  AND (l16.datreg >= sysdate -1)
GROUP BY CASE
             WHEN l16.divcode = '051' THEN 'SMRU80005'
             WHEN l16.divcode = '052' THEN 'SMRU73416'
             WHEN l16.divcode = '062' THEN 'SMRU80152'
             ELSE NULL
         END ,
         CASE
             WHEN l16.divcode = '051' THEN 'US_3198'
             WHEN l16.divcode = '052' THEN 'US_5099'
             WHEN l16.divcode = '062' THEN 'CA_0370'
             ELSE NULL
         END --PICK_TYPE Logic for each IKEA Warehouse. Yellow Line, LSC, Parcel, and Customer Pick-up. PICK_MISC_2 has more granular data about Pick Flow (Discrete, Cluster, Etc.)
 ,
         CASE
             WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2683') THEN 'Parcel'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Customer Pick-Up'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683') THEN 'LSC'
 END
             WHEN l16.divcode = '052' THEN --Staten Island Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629') THEN 'LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Customer Pick-up'
 END
             WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT') THEN 'Yellow Line'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'LSC'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('400')
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 3) = 'PEN' THEN 'Penguin'
 END
         END ,
         TO_CHAR(l16.datreg, 'yyyy-mm-dd') ,
         TO_CHAR(l16.datreg, 'hh:mi:ss AM') ,
         CASE
             WHEN o40.ecarrno IS NULL THEN l16.ecarrno
             ELSE o40.ecarrno
         END ,
         o04.shorto04 ,
         TRIM(l16.frack)||TRIM(l16.Fhorcoor)||(TRIM(fvercoor)) ,
         l16.partno ,
         l16.shortr08 ,
         l16.logguser ,
         NULL ,
         l16.ocarrno --Picking Flow logic for each IKEA Warehouse. (Discrete, Cluster, Check and Pack, Etc.)
 ,
         CASE
             WHEN l16.divcode = '051' THEN --Lakeland Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) NOT IN ('CLUS',
                                        'C&P-Y') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) LIKE ('CLUS%') THEN 'Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1940',
                                            '1941')
          AND TRIM(l16.admunit) IN ('C&P-Y') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2683') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1940',
                                                '1941',
                                                '2683')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Check & Pack'
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
                                        'C&P-N') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('CARTX',
                                    'CARTN') THEN 'Cluster'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('GRN-X',
                                    'GRN-N') THEN 'Green Dot'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('1943',
                                            '1944')
          AND TRIM(l16.admunit) IN ('C&P-X',
                                    'C&P-N') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) NOT IN ('C&P-L') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype != 12
          AND substr(l16.routeno, 1, 4) NOT IN ('1943',
                                                '1944',
                                                '2629')
          AND TRIM(l16.admunit) IN ('C&P-L') THEN 'Check & Pack'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) NOT IN ('2629') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12
          AND substr(l16.routeno, 1, 4) IN ('2629') THEN 'Discrete'
 END
             WHEN l16.divcode = '062' THEN --Kleinburg Kronos Description
 CASE
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) IN ('LOC,TAT') THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype = 12 THEN 'Discrete'
     WHEN l16.l16lcode||l16.l54movet||l16.l16destc = '400'
          AND l16.ordtype !=12
          AND substr(l16.routeno, 1, 3) NOT IN ('LOC,TAT,PEN') THEN 'Discrete'
 END
         END ,
         TRIM(l16.Emha) ,
         l16.partrev ,
         l16.ocarrtyp