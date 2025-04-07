
SELECT "Recovery_LW9"."DATREG" "c0",
       "Recovery_LW9"."Week" "c1",
       "Recovery_LW9"."CDC" "c2",
       "Recovery_LW9"."Package_ID" "c3",
       "Recovery_LW9"."Carrno" "c4",
       "Recovery_LW9"."Article" "c5",
       "Recovery_LW9"."ARTSUP" "c6",
       "Recovery_LW9"."Revision" "c7",
       "Recovery_LW9"."TT_Code" "c8",
       "Recovery_LW9"."Code_Desc__G62T1_" "c9",
       "Recovery_LW9"."Type" "c10",
       "Recovery_LW9"."Qty" "c11",
       "Recovery_LW9"."Multi_box_" "c12",
       "Recovery_LW9"."Num_PCS" "c13",
       "Recovery_LW9"."HFB" "c14",
       "Recovery_LW9"."HFB_Definition" "c15",
       "Recovery_LW9"."Pallet_Class" "c16",
       "Recovery_LW9"."Pick_MHA" "c17",
       "Recovery_LW9"."Buffer_MHA" "c18",
       "Recovery_LW9"."MHA" "c19",
       "Recovery_LW9"."Location" "c20",
       "Recovery_LW9"."User22" "c21",
       "Recovery_LW9"."Full_Name" "c22",
       "Recovery_LW9"."Profile" "c23",
       "Recovery_LW9"."Log_ID__X08T3_" "c24"
FROM
  (SELECT DISTINCT "SQL5"."DATREG" "DATREG",
                   "SQL5"."Week" "Week",
                   "SQL5"."CDC" "CDC",
                   "SQL5"."Package ID" "Package_ID",
                   "SQL5"."Carrno" "Carrno",
                   "SQL5"."Article" "Article",
                   "SQL5"."ARTSUP" "ARTSUP",
                   "SQL5"."Revision" "Revision",
                   "SQL5"."TT Code" "TT_Code",
                   "SQL5"."Code Desc (G62T1)" "Code_Desc__G62T1_",
                   "SQL5"."Type" "Type",
                   "SQL5"."Qty" "Qty",
                   "SQL5"."Multi-box?" "Multi_box_",
                   "SQL5"."Num PCS" "Num_PCS",
                   "SQL5"."HFB" "HFB",
                   "SQL5"."HFB Definition" "HFB_Definition",
                   "SQL5"."Pallet Class" "Pallet_Class",
                   "SQL5"."Pick MHA" "Pick_MHA",
                   "SQL5"."Buffer MHA" "Buffer_MHA",
                   "SQL5"."MHA" "MHA",
                   "SQL5"."Location" "Location",
                   "SQL5"."User" "User22",
                   "SQL5"."Full Name" "Full_Name",
                   "SQL5"."Profile" "Profile",
                   "SQL5"."Log ID (X08T3)" "Log_ID__X08T3_"
   FROM
     (/*
        SQL returns all Recovery inventory adjustments (TT 305 / 306) for CDC for the current week.

    -----
    Update History:


    -- Created by Jacob B
     published 10/1/22.

    */  SELECT l16.Datreg,
               TO_CHAR(l16.datreg+1, 'IW') "Week", --TO_CHAR(l16.datreg, 'Day') AS "Day Of Week",
 x08.divcode "CDC",
 TRIM(ecarrno) AS "Package ID",
 TRIM(x08.carrno) "Carrno",
 TRIM(x08.Partno) AS "Article",
 trim(x08.partno)||'-'||trim(x08.partrev) artsup,
 TRIM(x08.partrev) AS "Revision",
 X08rcode AS "TT Code",
 TRIM (blockdsc) "Code Desc (G62T1)",
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
          WHEN x08rcode IN ('316') THEN 'Discontinued (UTG)'
          WHEN x08rcode IN ('320') THEN 'Shipping Correction (+)'
          WHEN x08rcode IN ('321') THEN 'Shipping Correction (-)'
          WHEN x08rcode IN ('305',
                            '306') THEN 'Recovery (+)'
          ELSE 'Other'
      END AS "Type",
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
      WHERE x08.divcode = '025'
        AND X08quant != 0
        AND x08rcode IN (305,
                         306)
        AND g62.G62type > 1
        AND -- Cognos uses Swedish dates for certain data connections, uncomment if errors occur
 --x08.datreg >= (SELECT next_day(trunc(sysdate), 'Sondag') - 7 datstart FROM DUAL) AND
 --x08.datreg < (SELECT next_day(trunc(sysdate), 'Sondag') - 0 datend FROM DUAL)
 x08.datreg >=
          (SELECT next_day(trunc(sysdate), 'SUNDAY') - 14 datstart
           FROM DUAL)
        AND x08.datreg <
          (SELECT next_day(trunc(sysdate), 'SUNDAY') - 7 datend
           FROM DUAL)
      GROUP BY l16.Datreg,
               TO_CHAR(l16.datreg+1, 'IW') , --TO_CHAR(l16.datreg, 'Day') AS "Day Of Week",
 x08.divcode,
 TRIM(ecarrno),
 TRIM(x08.carrno),
 TRIM(x08.Partno),
 trim(x08.partno)||'-'||trim(x08.partrev),
 TRIM(x08.partrev),
 X08rcode,
 TRIM (blockdsc) , CASE
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
                       WHEN x08rcode IN ('316') THEN 'Discontinued (UTG)'
                       WHEN x08rcode IN ('320') THEN 'Shipping Correction (+)'
                       WHEN x08rcode IN ('321') THEN 'Shipping Correction (-)'
                       WHEN x08rcode IN ('305',
                                         '306') THEN 'Recovery (+)'
                       ELSE 'Other'
                   END,
                   X08Quant,
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
      ORDER BY datreg ASC) "SQL5") "Recovery_LW9"
ORDER BY "c5" ASC NULLS LAST,
         "c7" ASC NULLS LAST
SELECT substr("L62T17"."PARTNO", 1, 8),
       trim(BOTH
            FROM "L62T17"."PARTREV"),
       "L62T17"."PARTUNIT",
       trim(BOTH
            FROM "L62T17"."PARTNO")
FROM
  (SELECT "L62T1"."PARTNO" "PARTNO",
          "L62T1"."PARTREV" "PARTREV",
          "L62T1"."PARTUNIT" "PARTUNIT"
   FROM "L62T1" "L62T1"
   WHERE trim(BOTH
              FROM "L62T1"."DIVCODE") NOT IN ('000',
                                              '055')) "L62T17"
SELECT "A_PRICES_L62T1"."PRICE",
       "A_PRICES_L62T1"."ITEM_NO",
       "A_PRICES_L62T1"."BU_CODE_SUP", (coalesce("A_PRICES_L62T1"."BU_TYPE_SUP", 'SUP'))
FROM
  (SELECT "PRICES_VW"."ITEM_TYPE" "ITEM_TYPE",
          "PRICES_VW"."ITEM_NO" "ITEM_NO",
          "PRICES_VW"."BU_TYPE_SUP" "BU_TYPE_SUP",
          "PRICES_VW"."BU_CODE_SUP" "BU_CODE_SUP",
          "PRICES_VW"."PRICE" "PRICE"
   FROM "PRICES_VW" "PRICES_VW"
   WHERE "PRICES_VW"."BU_TYPE"='CDC'
     AND "PRICES_VW"."BU_CODE" IN ('003')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"