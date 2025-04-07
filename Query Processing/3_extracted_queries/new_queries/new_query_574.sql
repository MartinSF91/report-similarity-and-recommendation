SELECT CASE
           WHEN AL1.BU_CODE_DT IN ('345',
                                   '532') THEN AL3.DSP_DATE_ACT-3/24
           WHEN AL1.BU_CODE_DT IN ('017',
                                   '019') THEN AL3.DSP_DATE_ACT-1/24
           ELSE AL3.DSP_DATE_ACT
       END "Dispatch Date",
       CASE
           WHEN AL1.BU_CODE_DT IN ('345',
                                   '532') THEN TO_CHAR((AL3.DSP_DATE_ACT-3/24)+1, 'IW')
           WHEN AL1.BU_CODE_DT IN ('017',
                                   '019') THEN TO_CHAR((AL3.DSP_DATE_ACT-1/24)+1, 'IW')
           ELSE TO_CHAR(AL3.DSP_DATE_ACT+1, 'IW')
       END "Dispatch Week",
       AL3.DSP_DATE_ACT,
       TO_CHAR(AL8.ORDER_DATE, 'MM/DD/YYYY') "Order Date",
       TO_CHAR(AL8.ORDER_DATE+1, 'IW') "Order Week",
       TO_CHAR(AL8.DSP_DATE_LATEST, 'MM/DD/YYYY') "Latest Dispatch Date",
       CASE
           WHEN AL8.DSP_DATE_LATEST >= AL3.DSP_DATE_ACT THEN 'On Time'
           ELSE 'Late'
       END "Filling Status",
       AL1.BU_CODE_DT "DC",
       AL8.BU_CODE_RCV "Receiver",
       CASE
           WHEN AL8.BU_TYPE_RCV IN ('DC',
                                    'CDC') THEN AL12.Name
           ELSE AL10.Name
       END "Rec Name",
       AL10.CTY_CODE,
       CASE
           WHEN (AL1.BU_CODE_DT = '017'
                 AND AL8.BU_CODE_RCV = '023')
                OR (AL1.BU_CODE_DT = '019'
                    AND AL8.BU_CODE_RCV = '025')
                OR (AL1.BU_CODE_DT = '460'
                    AND AL8.BU_CODE_RCV = '960')
                OR (AL1.BU_CODE_DT = '345'
                    AND AL8.BU_CODE_RCV = '945')
                OR (AL1.BU_CODE_DT = '030'
                    AND AL8.BU_CODE_RCV = '930') THEN 'Stock Switch'
           WHEN (AL1.BU_CODE_DT = '017'
                 AND AL8.BU_CODE_RCV != '023'
                 AND AL8.BU_TYPE_RCV = 'CDC')
                OR (AL1.BU_CODE_DT = '019'
                    AND AL8.BU_CODE_RCV != '025'
                    AND AL8.BU_TYPE_RCV = 'CDC')
                OR (AL1.BU_CODE_DT = '460'
                    AND AL8.BU_CODE_RCV != '960'
                    AND AL8.BU_TYPE_RCV = 'CDC')
                OR (AL1.BU_CODE_DT = '345'
                    AND AL8.BU_CODE_RCV != '945'
                    AND AL8.BU_TYPE_RCV = 'CDC')
                OR (AL1.BU_CODE_DT = '030'
                    AND AL8.BU_CODE_RCV != '930'
                    AND AL8.BU_TYPE_RCV = 'CDC')
                OR (AL1.BU_CODE_DT IN ('532',
                                       '061',
                                       '490')
                    AND AL8.BU_TYPE_RCV = 'CDC') THEN 'CDC'
           WHEN AL8.BU_TYPE_RCV IN ('DT',
                                    'CDC') THEN AL12.CTY_CODE
           ELSE AL10.CTY_CODE
       END "DomExp",
       CASE
           WHEN (AL3.ASTRO_ROUTE_ID LIKE '%BB%')
                OR (AL3.ASTRO_ROUTE_ID LIKE '%BN%') THEN 'External'
           WHEN (AL3.ASTRO_ROUTE_ID NOT LIKE '%BB%')
                OR (AL3.ASTRO_ROUTE_ID NOT LIKE '%BN%') THEN 'Main Site'
           ELSE 'UNDEF'
       END "Flow Level 2",
       CASE
           WHEN (AL1.BU_CODE_DT = '017'
                 AND AL8.BU_CODE_RCV = '023')
                OR (AL1.BU_CODE_DT = '019'
                    AND AL8.BU_CODE_RCV = '025')
                OR (AL1.BU_CODE_DT = '460'
                    AND AL8.BU_CODE_RCV = '960')
                OR (AL1.BU_CODE_DT = '345'
                    AND AL8.BU_CODE_RCV = '945')
                OR (AL1.BU_CODE_DT = '030'
                    AND AL8.BU_CODE_RCV = '930') THEN 'Y'
           ELSE 'N'
       END "Stock Switch",
       AL2.SHP_NO,
       AL2.ASTRO_TRIP_ID "ShortR08",
       AL3.ASTRO_ROUTE_ID "Astro Route Schedule",
       AL1.CSM_NO "Consignment #",
       AL1.ORDER_ID "Gemini Order #",
       TRIM(AL7.ASTRO_ORD_ID) "Astro Order #",
       AL1.OP_ORD_ID,
       AL8.ORDER_TYPE,
       AL9.NAME "Order Type",
       CASE
           WHEN AL8.ORDER_TYPE IN ('CFP',
                                   'CMP',
                                   'OFP',
                                   'OMP') THEN 'TRANSIT'
           ELSE 'NORMAL'
       END "Order Line Type",
       CASE
           WHEN AL5.UL_len_pal <= 700 THEN 'HALF'
           WHEN AL5.ul_len_pal > 700
                AND AL5.ul_len_pal <= 1600 THEN 'EURO'
           WHEN AL5.ul_len_pal > 1600 THEN 'IKEA'
           ELSE 'UNDEF'
       END "Pallet Class",
       CASE
           WHEN AL8.ORDER_TYPE IN ('CFP',
                                   'CMP',
                                   'OFP',
                                   'OMP') THEN 'TRANSIT'
           WHEN AL6.pall_id_out != AL6.pall_id_pick
                AND AL6.pall_id_out IS NOT NULL
                AND AL6.pall_id_pick IS NOT NULL THEN 'Plock'
           WHEN ((AL1.BU_CODE_DT = '017'
                  AND AL8.BU_CODE_RCV = '023')
                 OR (AL1.BU_CODE_DT = '019'
                     AND AL8.BU_CODE_RCV = '025')
                 OR (AL1.BU_CODE_DT = '460'
                     AND AL8.BU_CODE_RCV = '960')
                 OR (AL1.BU_CODE_DT = '345'
                     AND AL8.BU_CODE_RCV = '945'))
                AND Al1.ITEM_QTY_DSP < AL5.UL_QTY THEN 'Plock'
           WHEN AL6.pall_id_out = AL6.pall_id_pick
                AND AL6.pall_id_out IS NOT NULL
                AND AL6.pall_id_pick IS NOT NULL THEN 'Full'
           WHEN AL6.pall_id_out IS NULL
                AND AL6.pall_id_pick IS NULL
                AND Al1.ITEM_QTY_DSP = AL5.UL_QTY THEN 'Full'
           WHEN AL6.pall_id_out IS NULL
                AND AL6.pall_id_pick IS NULL
                AND Al1.ITEM_QTY_DSP != AL5.UL_QTY THEN 'Plock'
           ELSE 'UNDEF'
       END "Pick Type MIP",
       AL1.PALLET_ID,
       AL1.ITEM_ID "Article",
       AL1.ITEM_TYPE,
       AL1.BU_CODE_SUP "Supplier",
       TRIM(AL1.ITEM_ID)||'-'||TRIM(AL1.BU_CODE_SUP) artsup,
       AL1.BU_TYPE_SUP,
       AL11.PA_NO,
       SUBSTR(AL11.PA_NO, 1, 2) HFB,
       CASE
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%01' THEN 'Living room seating'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%03' THEN 'Workspaces'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%06' THEN 'Bathroom'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%07' THEN 'Kitchen'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%08' THEN 'Dining'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%10' THEN 'Lighting'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%12' THEN 'Home textiles'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%13' THEN 'Rugs'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%14' THEN 'Cooking'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%15' THEN 'Eating'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%16' THEN 'Decoration'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%18' THEN 'Home organisation'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%20' THEN 'Other business opportunities'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%50' THEN 'Home electronics'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%70' THEN 'Home Appliances'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
           WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%96' THEN 'IKEA Food'
           ELSE 'UNDEF'
       END "HFB Definition",
       CASE
           WHEN AL4.SC_NET_VOL IS NULL THEN 'Missing ITEM_SUP_DWP_ACT'
           ELSE 'OK'
       END "ITEM_SUP_DWP_ACT",
       CASE
           WHEN AL5.UL_len_pal IS NULL THEN ' Missing ITEM_SUP_DWP_ACT_UL'
           ELSE 'OK'
       END "ITEM_SUP_DWP_ACT_UL",
       CASE
           WHEN AL13.ART_PRI_CALC_17 IS NULL THEN 'Missing Gemini Price'
           ELSE 'OK'
       END "ITEM_SUP_WS_FYT",
       CASE
           WHEN AL11.UNIT_NO = '02'
                AND AL4.SC_NET_VOL IS NOT NULL THEN AL4.SC_NET_VOL/100
           WHEN AL11.UNIT_NO != '02'
                AND AL4.SC_NET_VOL IS NOT NULL THEN AL4.SC_NET_VOL
           WHEN AL11.UNIT_NO = '02'
                AND AL4.SC_NET_VOL IS NULL THEN ((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)/100
           WHEN AL11.UNIT_NO != '02'
                AND AL4.SC_NET_VOL IS NULL THEN ((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)
           ELSE 0
       END "Unit Volume",
       CASE
           WHEN AL11.UNIT_NO = '02' THEN (AL13.ART_PRI_CALC_17/100)
           ELSE AL13.ART_PRI_CALC_17
       END "Line17 Price",
       AL13.FYT "Tertial Pricing",
       AL1.ITEM_QTY_DSP "Disp Qty",
       (CASE
            WHEN AL11.UNIT_NO = '02'
                 AND AL4.SC_NET_VOL IS NOT NULL THEN (AL4.SC_NET_VOL/100)*AL1.ITEM_QTY_DSP
            WHEN AL11.UNIT_NO != '02'
                 AND AL4.SC_NET_VOL IS NOT NULL THEN (AL4.SC_NET_VOL)*AL1.ITEM_QTY_DSP
            WHEN AL11.UNIT_NO = '02'
                 AND AL4.SC_NET_VOL IS NULL THEN (((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)/100)*AL1.ITEM_QTY_DSP
            WHEN AL11.UNIT_NO != '02'
                 AND AL4.SC_NET_VOL IS NULL THEN (((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000))*AL1.ITEM_QTY_DSP
            ELSE 0
        END)/1000 "Volume",
       AL1.ITEM_QTY_DSP*(CASE
                             WHEN AL11.UNIT_NO = '02' THEN (AL13.ART_PRI_CALC_17/100)
                             ELSE AL13.ART_PRI_CALC_17
                         END) "Price",
       '1' ORDERSUM,
           1/COUNT (*) OVER(PARTITION BY AL1.PALLET_ID
                            ORDER BY AL2.SHP_NO) PalletSum,
                       CASE
                           WHEN (AL1.BU_CODE_DT = '017'
                                 AND AL8.BU_CODE_RCV = '023')
                                OR (AL1.BU_CODE_DT = '019'
                                    AND AL8.BU_CODE_RCV = '025')
                                OR (AL1.BU_CODE_DT = '460'
                                    AND AL8.BU_CODE_RCV = '960')
                                OR (AL1.BU_CODE_DT = '345'
                                    AND AL8.BU_CODE_RCV = '945') THEN 0
                           ELSE 1/COUNT (*) OVER(PARTITION BY AL2.SHP_NO
                                                 ORDER BY AL2.SHP_NO)
                       END ShipmentSum
FROM GEMINI.OUT_CONSIGNMENT_LINE AL1 --Join  ITEM DWP FOR SCNETVOL

LEFT JOIN GEMINI.ITEM_SUP_DWP_ACT AL4 ON (AL1.ITEM_ID = AL4.ITEM_ID
                                          AND AL1.ITEM_TYPE = AL4.ITEM_TYPE
                                          AND AL1.BU_CODE_SUP = AL4.BU_CODE_SUP
                                          AND AL1.BU_TYPE_SUP = AL4.BU_TYPE_SUP
                                          AND AL1.DWP_NO = AL4.REQ_DWP_NO
                                          AND AL1.DWP_ED = AL4.REQ_DWP_ED
                                          AND AL1.DWP_FROM_DATE = AL4.FROM_PACK_DATE)--Join UL DWP for Pallet Len

LEFT JOIN GEMINI.ITEM_SUP_DWP_ACT_UL AL5 ON (AL1.ITEM_ID = AL5.ITEM_ID
                                             AND AL1.ITEM_TYPE = AL5.ITEM_TYPE
                                             AND AL1.BU_CODE_SUP = AL5.BU_CODE_SUP
                                             AND AL1.BU_TYPE_SUP = AL5.BU_TYPE_SUP
                                             AND AL1.DWP_NO = AL5.REQ_DWP_NO
                                             AND AL1.DWP_ED = AL5.REQ_DWP_ED
                                             AND AL1.DWP_FROM_DATE = AL5.FROM_PACK_DATE )--Pick pallet IDs

LEFT JOIN GEMINI.OPERATIONAL_ORDER_PICK AL6 ON AL1.OP_ORD_ID = AL6.OP_ORD_ID --Join for Astro Order #

INNER JOIN GEMINI.OPERATIONAL_ORDER_ALL AL7 ON AL1.ORDER_ID = AL7.ORDER_ID --Join for Order talbe

INNER JOIN GEMINI.ORDERS AL8 ON AL1.ORDER_ID = AL8.ORDER_ID --Store Name

LEFT JOIN GEMINI.STORE AL10 ON (AL8.BU_CODE_RCV = AL10.BU_CODE
                                AND AL8.BU_TYPE_RCV = AL10.BU_TYPE)--DC Name as Receiver

LEFT JOIN GEMINI.TERMINAL AL12 ON (AL8.BU_CODE_RCV = AL12.BU_CODE
                                   AND AL8.BU_TYPE_RCV = AL12.BU_TYPE)--Consignment

INNER JOIN GEMINI.OUT_CONSIGNMENT AL2 ON (AL2.BU_CODE_CRE_CSM=AL1.BU_CODE_CRE_CSM
                                          AND AL2.BU_TYPE_CRE_CSM=AL1.BU_TYPE_CRE_CSM
                                          AND AL2.CSM_NO=AL1.CSM_NO
                                          AND AL2.BU_CODE_DT=AL1.BU_CODE_DT
                                          AND AL2.BU_TYPE_DT=AL1.BU_TYPE_DT)--Join Trip

INNER JOIN GEMINI.OUT_LOADING_UNIT_TRIP AL3 ON (AL3.ASTRO_TRIP_ID=AL2.ASTRO_TRIP_ID
                                                AND AL3.BU_CODE_CRE_SHP=AL2.BU_CODE_CRE_SHP
                                                AND AL3.BU_TYPE_CRE_SHP=AL2.BU_TYPE_CRE_SHP
                                                AND AL3.SHP_NO=AL2.SHP_NO
                                                AND AL3.LUTR_NO=AL2.LUTR_NO
                                                AND AL3.BU_CODE_DT=AL2.BU_CODE_DT
                                                AND AL3.BU_TYPE_DT=AL2.BU_TYPE_DT
                                                AND AL3.BU_CODE_SND=AL2.BU_CODE_SND
                                                AND AL3.BU_TYPE_SND=AL2.BU_TYPE_SND)--Order Type Name

INNER JOIN GEMINI.ORDER_TYPE_DICT AL9 ON AL9.ORDER_TYPE=AL8.ORDER_TYPE --Item talbe for unit #

INNER JOIN GEMINI.ITEM AL11 ON AL1.ITEM_ID = AL11.ITEM_ID --Prices

LEFT JOIN
  (SELECT A1.ITEM_ID||'-'||A1.BU_CODE_SUP artsup,
          A1.WS_CODE,
          A1.FYT,
          A1.ART_PRI_CALC_17,
          A2.UNIT_NO,
          A2.PA_NO,
          SUBSTR(A2.PA_NO, 1, 2) "HFB"
   FROM GEMINI.ITEM_SUP_WS_FYT A1,
        GEMINI.ITEM A2,

     (SELECT A2.ITEM_ID||'-'||A2.BU_CODE_SUP artsup,
             A2.WS_CODE,
             MAX(A2.FYT) maxfyt
      FROM GEMINI.ITEM_SUP_WS_FYT A2,

        (SELECT next_day(trunc(sysdate), 'sondag') - 7 lastsunday
         FROM DUAL) D1
      WHERE --UPDATE TO LUS for EAST or LUW for West
 A2.WS_CODE IN ('LUS')
        AND A2.FYT <= (CASE
                           WHEN TO_CHAR(D1.lastsunday, 'MM') IN ('09',
                                                                 '10',
                                                                 '11',
                                                                 '12') THEN TO_CHAR(add_months(D1.lastsunday, 12), 'YYYY')
                           ELSE TO_CHAR(D1.lastsunday, 'YYYY')
                       END|| CASE
                                 WHEN TO_CHAR(D1.lastsunday, 'MM') IN ('09',
                                                                       '10',
                                                                       '11',
                                                                       '12') THEN '1'
                                 WHEN TO_CHAR(D1.lastsunday, 'MM') IN ('01',
                                                                       '02',
                                                                       '03',
                                                                       '04') THEN '2'
                                 WHEN TO_CHAR(D1.lastsunday, 'MM') IN ('05',
                                                                       '06',
                                                                       '07',
                                                                       '08') THEN '3'
                                 ELSE '0'
                             END)
      GROUP BY A2.ITEM_ID||'-'||A2.BU_CODE_SUP,
               A2.WS_CODE) A3
   WHERE --UPDATE TO LUS for EAST or LUW for West
 A1.WS_CODE IN ('LUS')
     AND A1.ITEM_ID = A2.ITEM_ID
     AND A1.ITEM_ID||'-'||A1.BU_CODE_SUP = A3.artsup
     AND A1.WS_CODE = A3.WS_CODE
     AND A1.FYT = A3.maxfyt) AL13 ON (AL1.ITEM_ID||'-'||AL1.BU_CODE_SUP = AL13.artsup)--Using ITEM SUP to populate net volume when DWP netvolume is missing

INNER JOIN ITEM_SUP AL14 ON (AL1.ITEM_ID = AL14.ITEM_ID
                             AND AL1.BU_CODE_SUP = AL14.BU_CODE_SUP)
WHERE AL1.ITEM_TYPE='ART'
  AND --UPDATE FOR DC
 AL2.BU_CODE_DT IN ('019')
  AND --COGNOS USES SWEDISH FOR DATES: Sondag = Sunday
 (AL3.DSP_DATE_ACT - 1/24) BETWEEN
    (SELECT next_day(trunc(sysdate), 'sondag') - 14 --TIME ZONE ADJUSTMENT: ADD HOURS TO ADJUST
  datstart
     FROM DUAL) AND --COGNOS USES SWEDISH FOR DATES: Sondag = Sunday

    (SELECT next_day(trunc(sysdate), 'sondag') - 7 --TIME ZONE ADJUSTMENT: ADD HOURS TO ADJUST

     FROM DUAL)
GROUP BY CASE
             WHEN AL1.BU_CODE_DT IN ('345',
                                     '532') THEN AL3.DSP_DATE_ACT-3/24
             WHEN AL1.BU_CODE_DT IN ('017',
                                     '019') THEN AL3.DSP_DATE_ACT-1/24
             ELSE AL3.DSP_DATE_ACT
         END,
         CASE
             WHEN AL1.BU_CODE_DT IN ('345',
                                     '532') THEN TO_CHAR((AL3.DSP_DATE_ACT-3/24)+1, 'IW')
             WHEN AL1.BU_CODE_DT IN ('017',
                                     '019') THEN TO_CHAR((AL3.DSP_DATE_ACT-1/24)+1, 'IW')
             ELSE TO_CHAR(AL3.DSP_DATE_ACT+1, 'IW')
         END,
         AL3.DSP_DATE_ACT,
         TO_CHAR(AL8.ORDER_DATE, 'MM/DD/YYYY'),
         TO_CHAR(AL8.ORDER_DATE+1, 'IW'),
         TO_CHAR(AL8.DSP_DATE_LATEST, 'MM/DD/YYYY'),
         CASE
             WHEN AL8.DSP_DATE_LATEST >= AL3.DSP_DATE_ACT THEN 'On Time'
             ELSE 'Late'
         END,
         AL1.BU_CODE_DT,
         AL8.BU_CODE_RCV,
         CASE
             WHEN AL8.BU_TYPE_RCV IN ('DC',
                                      'CDC') THEN AL12.Name
             ELSE AL10.Name
         END,
         AL10.CTY_CODE,
         CASE
             WHEN (AL1.BU_CODE_DT = '017'
                   AND AL8.BU_CODE_RCV = '023')
                  OR (AL1.BU_CODE_DT = '019'
                      AND AL8.BU_CODE_RCV = '025')
                  OR (AL1.BU_CODE_DT = '460'
                      AND AL8.BU_CODE_RCV = '960')
                  OR (AL1.BU_CODE_DT = '345'
                      AND AL8.BU_CODE_RCV = '945')
                  OR (AL1.BU_CODE_DT = '030'
                      AND AL8.BU_CODE_RCV = '930') THEN 'Stock Switch'
             WHEN (AL1.BU_CODE_DT = '017'
                   AND AL8.BU_CODE_RCV != '023'
                   AND AL8.BU_TYPE_RCV = 'CDC')
                  OR (AL1.BU_CODE_DT = '019'
                      AND AL8.BU_CODE_RCV != '025'
                      AND AL8.BU_TYPE_RCV = 'CDC')
                  OR (AL1.BU_CODE_DT = '460'
                      AND AL8.BU_CODE_RCV != '960'
                      AND AL8.BU_TYPE_RCV = 'CDC')
                  OR (AL1.BU_CODE_DT = '345'
                      AND AL8.BU_CODE_RCV != '945'
                      AND AL8.BU_TYPE_RCV = 'CDC')
                  OR (AL1.BU_CODE_DT = '030'
                      AND AL8.BU_CODE_RCV != '930'
                      AND AL8.BU_TYPE_RCV = 'CDC')
                  OR (AL1.BU_CODE_DT IN ('532',
                                         '061',
                                         '490')
                      AND AL8.BU_TYPE_RCV = 'CDC') THEN 'CDC'
             WHEN AL8.BU_TYPE_RCV IN ('DT',
                                      'CDC') THEN AL12.CTY_CODE
             ELSE AL10.CTY_CODE
         END,
         CASE
             WHEN (AL3.ASTRO_ROUTE_ID LIKE '%BB%')
                  OR (AL3.ASTRO_ROUTE_ID LIKE '%BN%') THEN 'External'
             WHEN (AL3.ASTRO_ROUTE_ID NOT LIKE '%BB%')
                  OR (AL3.ASTRO_ROUTE_ID NOT LIKE '%BN%') THEN 'Main Site'
             ELSE 'UNDEF'
         END,
         CASE
             WHEN (AL1.BU_CODE_DT = '017'
                   AND AL8.BU_CODE_RCV = '023')
                  OR (AL1.BU_CODE_DT = '019'
                      AND AL8.BU_CODE_RCV = '025')
                  OR (AL1.BU_CODE_DT = '460'
                      AND AL8.BU_CODE_RCV = '960')
                  OR (AL1.BU_CODE_DT = '345'
                      AND AL8.BU_CODE_RCV = '945')
                  OR (AL1.BU_CODE_DT = '030'
                      AND AL8.BU_CODE_RCV = '930') THEN 'Y'
             ELSE 'N'
         END,
         AL2.SHP_NO,
         AL2.ASTRO_TRIP_ID,
         AL3.ASTRO_ROUTE_ID,
         AL1.CSM_NO,
         AL1.ORDER_ID,
         TRIM(AL7.ASTRO_ORD_ID),
         AL1.OP_ORD_ID,
         AL8.ORDER_TYPE,
         AL9.NAME,
         CASE
             WHEN AL8.ORDER_TYPE IN ('CFP',
                                     'CMP',
                                     'OFP',
                                     'OMP') THEN 'TRANSIT'
             ELSE 'NORMAL'
         END,
         CASE
             WHEN AL5.UL_len_pal <= 700 THEN 'HALF'
             WHEN AL5.ul_len_pal > 700
                  AND AL5.ul_len_pal <= 1600 THEN 'EURO'
             WHEN AL5.ul_len_pal > 1600 THEN 'IKEA'
             ELSE 'UNDEF'
         END,
         CASE
             WHEN AL8.ORDER_TYPE IN ('CFP',
                                     'CMP',
                                     'OFP',
                                     'OMP') THEN 'TRANSIT'
             WHEN AL6.pall_id_out != AL6.pall_id_pick
                  AND AL6.pall_id_out IS NOT NULL
                  AND AL6.pall_id_pick IS NOT NULL THEN 'Plock'
             WHEN ((AL1.BU_CODE_DT = '017'
                    AND AL8.BU_CODE_RCV = '023')
                   OR (AL1.BU_CODE_DT = '019'
                       AND AL8.BU_CODE_RCV = '025')
                   OR (AL1.BU_CODE_DT = '460'
                       AND AL8.BU_CODE_RCV = '960')
                   OR (AL1.BU_CODE_DT = '345'
                       AND AL8.BU_CODE_RCV = '945'))
                  AND Al1.ITEM_QTY_DSP < AL5.UL_QTY THEN 'Plock'
             WHEN AL6.pall_id_out = AL6.pall_id_pick
                  AND AL6.pall_id_out IS NOT NULL
                  AND AL6.pall_id_pick IS NOT NULL THEN 'Full'
             WHEN AL6.pall_id_out IS NULL
                  AND AL6.pall_id_pick IS NULL
                  AND Al1.ITEM_QTY_DSP = AL5.UL_QTY THEN 'Full'
             WHEN AL6.pall_id_out IS NULL
                  AND AL6.pall_id_pick IS NULL
                  AND Al1.ITEM_QTY_DSP != AL5.UL_QTY THEN 'Plock'
             ELSE 'UNDEF'
         END,
         AL1.PALLET_ID,
         AL1.ITEM_ID,
         AL1.ITEM_TYPE,
         AL1.BU_CODE_SUP,
         TRIM(AL1.ITEM_ID)||'-'||TRIM(AL1.BU_CODE_SUP),
         AL1.BU_TYPE_SUP,
         AL11.PA_NO,
         SUBSTR(AL11.PA_NO, 1, 2),
         CASE
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%01' THEN 'Living room seating'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%03' THEN 'Workspaces'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%06' THEN 'Bathroom'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%07' THEN 'Kitchen'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%08' THEN 'Dining'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%10' THEN 'Lighting'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%12' THEN 'Home textiles'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%13' THEN 'Rugs'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%14' THEN 'Cooking'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%15' THEN 'Eating'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%16' THEN 'Decoration'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%18' THEN 'Home organisation'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%20' THEN 'Other business opportunities'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%50' THEN 'Home electronics'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%70' THEN 'Home Appliances'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
             WHEN SUBSTR(AL11.PA_NO, 1, 2) LIKE '%96' THEN 'IKEA Food'
             ELSE 'UNDEF'
         END,
         CASE
             WHEN AL4.SC_NET_VOL IS NULL THEN 'Missing ITEM_SUP_DWP_ACT'
             ELSE 'OK'
         END,
         CASE
             WHEN AL5.UL_len_pal IS NULL THEN ' Missing ITEM_SUP_DWP_ACT_UL'
             ELSE 'OK'
         END,
         CASE
             WHEN AL13.ART_PRI_CALC_17 IS NULL THEN 'Missing Gemini Price'
             ELSE 'OK'
         END,
         CASE
             WHEN AL11.UNIT_NO = '02'
                  AND AL4.SC_NET_VOL IS NOT NULL THEN AL4.SC_NET_VOL/100
             WHEN AL11.UNIT_NO != '02'
                  AND AL4.SC_NET_VOL IS NOT NULL THEN AL4.SC_NET_VOL
             WHEN AL11.UNIT_NO = '02'
                  AND AL4.SC_NET_VOL IS NULL THEN ((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)/100
             WHEN AL11.UNIT_NO != '02'
                  AND AL4.SC_NET_VOL IS NULL THEN ((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)
             ELSE 0
         END,
         CASE
             WHEN AL11.UNIT_NO = '02' THEN (AL13.ART_PRI_CALC_17/100)
             ELSE AL13.ART_PRI_CALC_17
         END,
         AL13.FYT,
         AL1.ITEM_QTY_DSP,
         (CASE
              WHEN AL11.UNIT_NO = '02'
                   AND AL4.SC_NET_VOL IS NOT NULL THEN (AL4.SC_NET_VOL/100)*AL1.ITEM_QTY_DSP
              WHEN AL11.UNIT_NO != '02'
                   AND AL4.SC_NET_VOL IS NOT NULL THEN (AL4.SC_NET_VOL)*AL1.ITEM_QTY_DSP
              WHEN AL11.UNIT_NO = '02'
                   AND AL4.SC_NET_VOL IS NULL THEN (((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000)/100)*AL1.ITEM_QTY_DSP
              WHEN AL11.UNIT_NO != '02'
                   AND AL4.SC_NET_VOL IS NULL THEN (((AL14.Item_Len*AL14.Item_Wid*AL14.Item_Hei)/1000000))*AL1.ITEM_QTY_DSP
              ELSE 0
          END)/1000,
         AL1.ITEM_QTY_DSP*(CASE
                               WHEN AL11.UNIT_NO = '02' THEN (AL13.ART_PRI_CALC_17/100)
                               ELSE AL13.ART_PRI_CALC_17
                           END),
         '1'