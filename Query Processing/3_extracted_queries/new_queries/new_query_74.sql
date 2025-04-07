
SELECT "Outbound_Volume9"."Plan_Date" "c0",
       "Outbound_Volume9"."C__Week" "c1",
       "Outbound_Volume9"."Day_Of_Week" "c2",
       "Outbound_Volume9"."Close_Date" "c3",
       "Outbound_Volume9"."Route_Name" "c4",
       "Outbound_Volume9"."SHORTR08" "c5",
       "Outbound_Volume9"."SHORTO08" "c6",
       "Outbound_Volume9"."OCARRNO" "c7",
       "Outbound_Volume9"."Package_ID" "c8",
       "Outbound_Volume9"."SHORTO42" "c9",
       "Outbound_Volume9"."Astro_Order__" "c10",
       "Outbound_Volume9"."ISOM_Order__" "c11",
       "Outbound_Volume9"."Article" "c12",
       "Outbound_Volume9"."Supplier" "c13",
       "Outbound_Volume9"."Division" "c14",
       "Outbound_Volume9"."Pick_MHA" "c15",
       "Outbound_Volume9"."Article_Volume" "c16",
       "Outbound_Volume9"."PA__" "c17",
       "Outbound_Volume9"."HFB__" "c18",
       "Outbound_Volume9"."HFB_Definition" "c19",
       "Outbound_Volume9"."Article_Pieces" "c20",
       "Outbound_Volume9"."Shipment__" "c21",
       "Outbound_Volume9"."Astro_Order_Type" "c22",
       "Outbound_Volume9"."Receiver" "c23",
       "Outbound_Volume9"."Receiver__" "c24",
       "Outbound_Volume9"."Flow" "c25",
       "Outbound_Volume9"."Ship_Qty" "c26",
       "Outbound_Volume9"."Orders" "c27",
       "Outbound_Volume9"."Shipped_Volume" "c28",
       "Outbound_Volume9"."Order_Lines" "c29",
       "Outbound_Volume9"."Packages" "c30",
       "Outbound_Volume9"."Shipments" "c31",
       "Outbound_Volume9"."Total_Pieces" "c32",
       "Outbound_Volume9"."Total_Order_Lines" "c33",
       "Outbound_Volume9"."Water_Volume__Shipments___114_" "c34"
FROM
  (SELECT "SQL1"."Close Date" "Close_Date",
          "SQL1"." Week" "C__Week",
          "SQL1"."Day Of Week" "Day_Of_Week",
          "SQL1"."Plan Date" "Plan_Date",
          "SQL1"."Route Name" "Route_Name",
          "SQL1"."SHORTR08" "SHORTR08",
          "SQL1"."SHORTO08" "SHORTO08",
          "SQL1"."OCARRNO" "OCARRNO",
          "SQL1"."Package ID" "Package_ID",
          "SQL1"."SHORTO42" "SHORTO42",
          "SQL1"."Astro Order #" "Astro_Order__",
          "SQL1"."ISOM Order #" "ISOM_Order__",
          "SQL1"."Article" "Article",
          "SQL1"."Supplier" "Supplier",
          "SQL1"."Division" "Division",
          "SQL1"."Pick MHA" "Pick_MHA",
          "SQL1"."Article Volume" "Article_Volume",
          "SQL1"."PA #" "PA__",
          "SQL1"."HFB #" "HFB__",
          "SQL1"."HFB Definition" "HFB_Definition",
          "SQL1"."Article Pieces" "Article_Pieces",
          "SQL1"."Shipment #" "Shipment__",
          "SQL1"."Astro Order Type" "Astro_Order_Type",
          "SQL1"."Receiver" "Receiver",
          "SQL1"."Receiver #" "Receiver__",
          CASE
              WHEN "SQL1"."Astro Order Type"=12 THEN N'Parcel'
              WHEN "SQL1"."Receiver #" IN (9999,
                                           1784) THEN N'Yellow Line'
              ELSE N'Truck'
          END "Flow",
          "SQL1"."Ship Qty" "Ship_Qty",
          sum("SQL1"."Shipped Volume") "Shipped_Volume",
          sum("SQL1"."Order Lines") "Order_Lines",
          sum("SQL1"."Order Sum") "Orders",
          sum("SQL1"."Shipment Sum") "Shipments",
          sum("SQL1"."Packages Sum") "Packages",
          sum("SQL1"."Shipment Sum"*114) "Water_Volume__Shipments___114_",
          sum("SQL1"."Article Pieces"*"SQL1"."Ship Qty") "Total_Pieces",
          sum("SQL1"."OrderLine Sum") "Total_Order_Lines"
   FROM
     (SELECT C1.ClosedDate "Close Date",
             TO_CHAR(C1.ClosedDate +1, 'IW') " Week",
             TO_CHAR(C1.ClosedDate, 'Day') "Day Of Week",
             TO_CHAR(r08.pickdate, 'MM/DD/YYYY') "Plan Date",
             r08.routeno "Route Name",
             r08.shortr08,
             o08.shorto08,
             o40.ocarrno,
             TRIM(o40.ecarrno) "Package ID",
             o42.shorto42,
             o06.ordno "Astro Order #",
             TRIM(o06.eorderid) "ISOM Order #",
             Trim(o08.partno) "Article",
             TRIM(o08.partrev) "Supplier",
             TRIM(o08.divcode) "Division",
             TRIM(l62.pmha) "Pick MHA",
             CASE
                 WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                 ELSE dwpact.scnetvol
             END "Article Volume",
             L629.panum "PA #",
             SUBSTR(L629.panum, 1, 2) "HFB #",
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
             dwpcp.numcp "Article Pieces",
             r08.etripid "Shipment #",
             o06.ordtype "Astro Order Type",
             TRIM(r23.deladr) "Receiver",
             r231.rcvbucod "Receiver #",
             o42.ocquant "Ship Qty",
             o42.ocquant*(CASE
                              WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                              ELSE dwpact.scnetvol
                          END) "Shipped Volume",
             COUNT(DISTINCT o08.shorto08) "Order Lines",
             1/COUNT (*) OVER(PARTITION BY o06.ordno
                              ORDER BY o06.ordno) "Order Sum",
                         1/COUNT (*) OVER(PARTITION BY r08.shortr08
                                          ORDER BY r08.shortr08) "Shipment Sum",
                                     1/COUNT (*) OVER(PARTITION BY o40.ocarrno
                                                      ORDER BY o40.ocarrno) "Packages Sum",
                                                 1/COUNT (*) OVER(PARTITION BY o08.shorto08
                                                                  ORDER BY o08.shorto08) "OrderLine Sum"
      FROM o06t1 o06
      INNER JOIN o08t1 o08 ON (o06.ordno = o08.ordno)
      INNER JOIN l62t1 l62 ON (o08.shortl62 = l62.shortl62)
      INNER JOIN r23t1 r23 ON (o06.shortr23 = r23.shortr23)
      INNER JOIN r08t1 r08 ON (r08.shortr08 = r23.shortr08)
      INNER JOIN o42t2 o42 ON (o42.shorto08 = o08.shorto08)
      INNER JOIN o40t2 o40 ON (o42.ocarrno = o40.ocarrno)
      INNER JOIN o42t90 o421 ON (o42.shorto42 = o421.shorto42)--DWP key connected to package contents

      INNER JOIN dwpkey dwpk ON (o421.shortdwp = dwpk.shortdwp)--DWP connection for SCNETVOL

      INNER JOIN dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                   AND dwpk.bucodsup = dwpact.bucodsup
                                   AND dwpk.fpacdate = dwpact.fpacdate
                                   AND dwpk.reqdwpno = dwpact.reqdwpno
                                   AND dwpk.reqdwped = dwpact.reqdwped)
      INNER JOIN r23t90 r231 ON (r23.shortr23 = r231.shortr23)--DWP connection for boxes per article

      INNER JOIN dwpactcp dwpcp ON (dwpk.itemno = dwpcp.itemno
                                    AND dwpk.bucodsup = dwpcp.bucodsup
                                    AND dwpk.fpacdate = dwpcp.fpacdate
                                    AND dwpk.reqdwpno = dwpcp.reqdwpno
                                    AND dwpk.reqdwped = dwpcp.reqdwped)--Close Routes

      INNER JOIN
        (SELECT shortr08,
                min(datreg) ClosedDate
         FROM l16t3
         WHERE L16lcode = 52
           AND divcode NOT IN ('345',
                               '017',
                               '019',
                               '460')--sondag or Sunday

           AND datreg BETWEEN
             (SELECT next_day(trunc(sysdate), 'Sunday') - 7
              FROM DUAL) AND
             (SELECT next_day(trunc(sysdate), 'Sunday') - 0
              FROM DUAL)
         GROUP BY shortr08) C1 ON (c1.shortr08 = R08.shortr08)
      LEFT JOIN L62T99 L629 ON (o08.partno= L629.partno
                                AND o08.partrev = L629.partrev
                                AND o08.divcode = L629.divcode)
      WHERE o06.ordstat = 9
        AND o08.linestat = 7
      GROUP BY C1.ClosedDate,
               TO_CHAR(C1.ClosedDate +1, 'IW'),
               TO_CHAR(C1.ClosedDate, 'Day'),
               TO_CHAR(r08.pickdate, 'MM/DD/YYYY'),
               r08.routeno,
               r08.shortr08,
               o08.shorto08,
               o40.ocarrno,
               o40.ecarrno,
               o42.shorto42,
               o06.ordno,
               TRIM(o06.eorderid),
               Trim(o08.partno),
               TRIM(o08.partrev),
               TRIM(o08.divcode),
               TRIM(l62.pmha),
               CASE
                   WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                   ELSE dwpact.scnetvol
               END,
               L629.panum,
               SUBSTR(L629.panum, 1, 2),
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
               dwpcp.numcp,
               r08.etripid,
               o06.ordtype,
               r23.deladr,
               r231.rcvbucod,
               o42.ocquant,
               o42.ocquant*(CASE
                                WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                                ELSE dwpact.scnetvol
                            END)) "SQL1"
   GROUP BY "SQL1"."Close Date",
            "SQL1"." Week",
            "SQL1"."Day Of Week",
            "SQL1"."Plan Date",
            "SQL1"."Route Name",
            "SQL1"."SHORTR08",
            "SQL1"."SHORTO08",
            "SQL1"."OCARRNO",
            "SQL1"."Package ID",
            "SQL1"."SHORTO42",
            "SQL1"."Astro Order #",
            "SQL1"."ISOM Order #",
            "SQL1"."Article",
            "SQL1"."Supplier",
            "SQL1"."Division",
            "SQL1"."Pick MHA",
            "SQL1"."Article Volume",
            "SQL1"."PA #",
            "SQL1"."HFB #",
            "SQL1"."HFB Definition",
            "SQL1"."Article Pieces",
            "SQL1"."Shipment #",
            "SQL1"."Astro Order Type",
            "SQL1"."Receiver",
            "SQL1"."Receiver #",
            CASE
                WHEN "SQL1"."Astro Order Type"=12 THEN N'Parcel'
                WHEN "SQL1"."Receiver #" IN (9999,
                                             1784) THEN N'Yellow Line'
                ELSE N'Truck'
            END,
            "SQL1"."Ship Qty") "Outbound_Volume9"
ORDER BY "c12" ASC NULLS LAST,
         "c13" ASC NULLS LAST
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
       "A_PRICES_L62T1"."PRICE"/100,
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