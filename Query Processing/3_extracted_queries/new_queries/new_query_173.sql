
SELECT "AstroInventory9"."ARTICLE" "c0",
       "AstroInventory9"."SUPPLIER" "c1",
       "AstroInventory9"."CDC" "c2",
       "AstroInventory9"."ARTSUP" "c3",
       "AstroInventory9"."Pallet_ID" "c4",
       "AstroInventory9"."Pallet_Qty" "c5",
       "AstroInventory9"."Pallet_Class" "c6",
       "AstroInventory9"."Qty" "c7",
       "AstroInventory9"."Pallets" "c8",
       "AstroInventory9"."Article_Volume" "c9",
       "AstroInventory9"."Pallet_Volume" "c10",
       "AstroInventory9"."PARTUNIT" "c11",
       "AstroInventory9"."Total_StUnits" "c12"
FROM
  (SELECT "SQL5"."ARTICLE" "ARTICLE",
          "SQL5"."SUPPLIER" "SUPPLIER",
          "SQL5"."CDC" "CDC",
          "SQL5"."ARTSUP" "ARTSUP",
          "SQL5"."Pallet ID" "Pallet_ID",
          "SQL5"."Pallet Qty" "Pallet_Qty",
          "SQL5"."Pallet Class" "Pallet_Class",
          "SQL5"."Qty" "Qty",
          "SQL5"."PARTUNIT" "PARTUNIT",
          sum("SQL5"."Pallets") "Pallets",
          sum("SQL5"."Article Volume") "Article_Volume",
          sum("SQL5"."Pallet Volume") "Pallet_Volume",
          sum(1) "Total_StUnits"
   FROM
     (SELECT trim(l62.partno) Article,
             trim(l62.partrev) Supplier,
             trim(l62.divcode) CDC,
             TRIM(l62.partno)||'-'||TRIM(l62.partrev) artsup,
             g08.ecarrno "Pallet ID",
             l62.cquant "Pallet Qty",
             SUBSTR(l62.wldct, 1, 1) "Pallet Class",
             g08.amooncr "Qty",
             l62.cquant/l62.cquant "Pallets",
             l62.partunit,
             (CASE
                  WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                  ELSE dwpact.scnetvol
              END)/1000 "Article Volume",
             (g08.amooncr*(CASE
                               WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                               ELSE dwpact.scnetvol
                           END))/1000 "Pallet Volume"
      FROM g08t1 g08
      INNER JOIN l62t1 l62 ON (g08.shortl62 = l62.shortl62)
      INNER JOIN g08t90 g089 ON (g089.carrno = g08.carrno)
      INNER JOIN dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
      INNER JOIN dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                   AND dwpk.bucodsup = dwpact.bucodsup
                                   AND dwpk.fpacdate = dwpact.fpacdate
                                   AND dwpk.reqdwpno = dwpact.reqdwpno
                                   AND dwpk.reqdwped = dwpact.reqdwped)
      WHERE l62.divcode NOT IN ('017',
                                '061',
                                '019',
                                '345',
                                '460',
                                '490')
        AND l62.parttype = 1
        AND l62.partno != '00000001'
        AND g08.carrstat = 6
        AND g08.carrtype = 0) "SQL5"
   GROUP BY "SQL5"."ARTICLE",
            "SQL5"."SUPPLIER",
            "SQL5"."CDC",
            "SQL5"."ARTSUP",
            "SQL5"."Pallet ID",
            "SQL5"."Pallet Qty",
            "SQL5"."Pallet Class",
            "SQL5"."Qty",
            "SQL5"."PARTUNIT") "AstroInventory9"
ORDER BY "c0" ASC NULLS LAST,
         "c1" ASC NULLS LAST
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
              FROM "L62T1"."DIVCODE") NOT IN ('----')) "L62T17"
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
     AND "PRICES_VW"."BU_CODE" IN ('052')
     AND "PRICES_VW"."ITEM_TYPE"='ART') "A_PRICES_L62T1"