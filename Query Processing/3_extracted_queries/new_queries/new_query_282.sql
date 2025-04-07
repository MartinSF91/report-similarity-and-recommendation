/*
    SQL returns all Inventory Adjustment data for SD based on the current work week for KPIs
    Query does not take user input.

-----------------
Update History:

-- Created by Jacob B
 published 10/15/22.

*/
SELECT l16.Datreg,
       TO_CHAR(l16.datreg+1, 'IW') "Week",
       x08.divcode "DC",
       TRIM(ecarrno) "Package ID",
       TRIM(x08.carrno) "Carrno",
       TRIM(x08.Partno) AS "Article",
       TRIM(x08.partrev) AS "Revision",
       trim(x08.partno)||'-'||trim(x08.partrev) artsup,
       X08.X08rcode AS "TT Code",
       TRIM (G62.blockdsc) "Code Desc (G62T1)",
            X08Quant "Qty",
            CASE
                WHEN dwpcp.numcp > 1 THEN 'Yes'
                ELSE 'No'
            END "Multi-box?",
            dwpcp.numcp "Num PCS",
            SUBSTR(l629.panum, 1, 2) "HFB",
            CASE
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%01' THEN 'Living room seating'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%03' THEN 'Workspaces'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%06' THEN 'Bathroom'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%07' THEN 'Kitchen'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%08' THEN 'Dining'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%10' THEN 'Lighting'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%12' THEN 'Home textiles'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%13' THEN 'Rugs'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%14' THEN 'Cooking'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%15' THEN 'Eating'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%16' THEN 'Decoration'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%18' THEN 'Home organisation'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%20' THEN 'Other business opportunities'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%50' THEN 'Home electronics'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%70' THEN 'Home Appliances'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
                WHEN SUBSTR(l629.panum, 1, 2) LIKE '%96' THEN 'IKEA Food'
                ELSE 'UNDEF'
            END "HFB Definition",
            SUBSTR(l16.ldct, 1, 1) "Pallet Class",
            l62.pmha "Pick MHA",
            l62.wmha "Buffer MHA",
            CASE
                WHEN x08rcode IN ('437',
                                  '440',
                                  '460') THEN 'Gross (+)'
                WHEN x08rcode IN ('457',
                                  '441',
                                  '461') THEN 'Gross (-)'
                WHEN x08rcode IN ('390',
                                  '391',
                                  '392',
                                  '393',
                                  '394',
                                  '395') THEN 'Damages (-)'
                WHEN x08rcode IN ('313') THEN 'Re-label (-)'
                WHEN x08rcode IN ('314') THEN 'Re-label (+)'
                WHEN x08rcode IN ('308') THEN 'Exceptional Adjustment (+)'
                WHEN x08rcode IN ('318') THEN 'Exceptional Adjustment (-)'
                WHEN x08rcode IN ('435') THEN 'Merge (+)'
                WHEN x08rcode IN ('455') THEN 'Merge (-)'
                WHEN x08rcode IN ('315') THEN 'Donations'
                WHEN x08rcode IN ('316') THEN 'Discontinued (-)'
                WHEN x08rcode IN ('320') THEN 'Shipping Correction (+)'
                WHEN x08rcode IN ('321') THEN 'Shipping Correction (-)' --WHEN x08rcode in ('103') THEN 'Supplier Damage'

                WHEN x08rcode IN ('305',
                                  '306') THEN 'Recovery (+)'
                ELSE 'Other'
            END AS "Type",
            Fmha "MHA",
            CASE
                WHEN Frack IN ' ' THEN Fmha
                ELSE Frack || '-' || fhorcoor || '-' || fvercoor
            END AS "Location",
            x08.logguser "User",
            TRIM(fname) || ' ' || TRIM(lname) AS "Full Name",
            CASE
                WHEN s90.s90accpr = '!SYSADM' THEN 'SYSTEM ADMIN'
                WHEN s90.s90accpr = 'DCPLAN' THEN 'DC PLANNER'
                WHEN s90.s90accpr = 'STOCKV3' THEN 'STOCK CONTROL'
                WHEN s90.s90accpr = 'FLRMNGV3' THEN 'TEAM LEAD'
                WHEN s90.s90accpr = 'FLOWV3' THEN 'FLOW'
                WHEN s90.s90accpr = '!REGION' THEN 'SYSTEM ADMIN'
                WHEN s90.s90accpr = 'ARTADV3' THEN 'ARTICLE ADMIN'
                WHEN s90.s90accpr = 'GWCV3' THEN 'COWORKER'
                WHEN s90.s90accpr = ' ' THEN 'CONSAFE ADMIN'
                WHEN s90.s90accpr = 'QAV3'
                     AND s90.uname IN 'ALIZI' THEN 'QUALITY'
                ELSE 'RECOVERY'
            END "Profile",
            TRIM(x08.X08seqno) AS "Log ID (X08T3)"
FROM ast019.x08t3 x08
INNER JOIN ast019.l16t3 l16 ON l16.x08seqno = x08.x08seqno
AND l16.datreg = x08.datreg
INNER JOIN ast019.l62t1 l62 ON l62.partno = x08.partno
AND l62.partrev = x08.partrev
AND l62.divcode = x08.divcode
INNER JOIN ast019.l62t99 l629 ON l629.partno = l62.partno
AND l629.partrev = l62.partrev
AND l629.divcode = l62.divcode
INNER JOIN ast019.s90t1 s90 ON x08.logguser=s90.uname
LEFT JOIN ast019.dwpkey dwpk ON (l629.shortdwp = dwpk.shortdwp)
LEFT JOIN ast019.dwpactcp dwpcp ON (dwpk.itemno = dwpcp.itemno
                                    AND dwpk.bucodsup = dwpcp.bucodsup
                                    AND dwpk.fpacdate = dwpcp.fpacdate
                                    AND dwpk.reqdwpno = dwpcp.reqdwpno
                                    AND dwpk.reqdwped = dwpcp.reqdwped)
LEFT JOIN ast019.dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                   AND dwpk.bucodsup = dwpact.bucodsup
                                   AND dwpk.fpacdate = dwpact.fpacdate
                                   AND dwpk.reqdwpno = dwpact.reqdwpno
                                   AND dwpk.reqdwped = dwpact.reqdwped)
LEFT JOIN ast019.dwpactul dwpul ON (dwpk.itemno = dwpul.itemno
                                    AND dwpk.bucodsup = dwpul.bucodsup
                                    AND dwpk.fpacdate = dwpul.fpacdate
                                    AND dwpk.reqdwpno = dwpul.reqdwpno
                                    AND dwpk.reqdwped = dwpul.reqdwped)
LEFT JOIN ast019.g62t1 g62 ON g62.blocked = x08.X08rcode
WHERE x08.divcode = '019'
  AND X08quant != 0
  AND --    (g62.blocked=x08.X08rcode OR x08rcode = 308 or x08rcode = 318) AND
 X08.x08rcode > 90
  AND X08.x08rcode != 1
  AND X08.x08rcode != 90
  AND X08.x08rcode != 443
  AND X08.x08rcode != 445
  AND X08.x08rcode != 553
  AND X08.x08rcode != 512
  AND X08.x08rcode != 16
  AND --g62.G62type > 1 AND
(dwpcp.numcp != 0
                            OR dwpcp.numcp IS NULL)
  AND x08.datreg >=
    (SELECT next_day(trunc(sysdate), 'Sondag') - 14 datstart
     FROM DUAL)
  AND x08.datreg <
    (SELECT next_day(trunc(sysdate), 'Sondag') - 7 datend
     FROM DUAL) --x08.datreg >= (SELECT next_day(trunc(sysdate), 'SUNDAY') - 7 datstart FROM DUAL) AND
--x08.datreg < (SELECT next_day(trunc(sysdate), 'SUNDAY') - 0 datend FROM DUAL)

GROUP BY l16.Datreg,
         TO_CHAR(l16.datreg+1, 'IW'),
         x08.divcode,
         TRIM(ecarrno) ,
         TRIM(x08.carrno) ,
         TRIM(X08.Partno),
         TRIM(X08.partrev),
         trim(x08.partno)||'-'||trim(x08.partrev),
         X08rcode,
         TRIM (G62.blockdsc) , X08Quant,
                               CASE
                                   WHEN dwpcp.numcp > 1 THEN 'Yes'
                                   ELSE 'No'
                               END,
                               dwpcp.numcp,
                               SUBSTR(l629.panum, 1, 2),
                               CASE
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%01' THEN 'Living room seating'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%03' THEN 'Workspaces'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%06' THEN 'Bathroom'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%07' THEN 'Kitchen'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%08' THEN 'Dining'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%10' THEN 'Lighting'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%12' THEN 'Home textiles'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%13' THEN 'Rugs'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%14' THEN 'Cooking'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%15' THEN 'Eating'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%16' THEN 'Decoration'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%18' THEN 'Home organisation'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%20' THEN 'Other business opportunities'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%50' THEN 'Home electronics'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%70' THEN 'Home Appliances'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
                                   WHEN SUBSTR(l629.panum, 1, 2) LIKE '%96' THEN 'IKEA Food'
                                   ELSE 'UNDEF'
                               END,
                               SUBSTR(l16.ldct, 1, 1),
                               l62.pmha,
                               l62.wmha,
                               CASE
                                   WHEN x08rcode IN ('437',
                                                     '440',
                                                     '460') THEN 'Gross (+)'
                                   WHEN x08rcode IN ('457',
                                                     '441',
                                                     '461') THEN 'Gross (-)'
                                   WHEN x08rcode IN ('390',
                                                     '391',
                                                     '392',
                                                     '393',
                                                     '394',
                                                     '395') THEN 'Damages (-)'
                                   WHEN x08rcode IN ('313') THEN 'Re-label (-)'
                                   WHEN x08rcode IN ('314') THEN 'Re-label (+)'
                                   WHEN x08rcode IN ('308') THEN 'Exceptional Adjustment (+)'
                                   WHEN x08rcode IN ('318') THEN 'Exceptional Adjustment (-)'
                                   WHEN x08rcode IN ('435') THEN 'Merge (+)'
                                   WHEN x08rcode IN ('455') THEN 'Merge (-)'
                                   WHEN x08rcode IN ('315') THEN 'Donations'
                                   WHEN x08rcode IN ('316') THEN 'Discontinued (-)'
                                   WHEN x08rcode IN ('320') THEN 'Shipping Correction (+)'
                                   WHEN x08rcode IN ('321') THEN 'Shipping Correction (-)' --WHEN x08rcode in ('103') THEN 'Supplier Damage'

                                   WHEN x08rcode IN ('305',
                                                     '306') THEN 'Recovery (+)'
                                   ELSE 'Other'
                               END,
                               Fmha,
                               CASE
                                   WHEN Frack IN ' ' THEN Fmha
                                   ELSE Frack || '-' || fhorcoor || '-' || fvercoor
                               END,
                               x08.logguser,
                               TRIM(fname) || ' ' || TRIM(lname),
                               CASE
                                   WHEN s90.s90accpr = '!SYSADM' THEN 'SYSTEM ADMIN'
                                   WHEN s90.s90accpr = 'DCPLAN' THEN 'DC PLANNER'
                                   WHEN s90.s90accpr = 'STOCKV3' THEN 'STOCK CONTROL'
                                   WHEN s90.s90accpr = 'FLRMNGV3' THEN 'TEAM LEAD'
                                   WHEN s90.s90accpr = 'FLOWV3' THEN 'FLOW'
                                   WHEN s90.s90accpr = '!REGION' THEN 'SYSTEM ADMIN'
                                   WHEN s90.s90accpr = 'ARTADV3' THEN 'ARTICLE ADMIN'
                                   WHEN s90.s90accpr = 'GWCV3' THEN 'COWORKER'
                                   WHEN s90.s90accpr = ' ' THEN 'CONSAFE ADMIN'
                                   WHEN s90.s90accpr = 'QAV3'
                                        AND s90.uname IN 'ALIZI' THEN 'QUALITY'
                                   ELSE 'RECOVERY'
                               END,
                               TRIM(x08.X08seqno)
ORDER BY datreg ASC