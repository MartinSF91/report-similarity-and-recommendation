SELECT TO_CHAR("Close Date", 'MM/DD/YYYY') CloseDate,
       "Plan Date",
       "Division",
       "Route Name",
       "Shipment #",
       "Receiver",
       SUM("Shipped Gross Volume") GrossVol,
       SUM("Shipped Net Volume") NetVolume,
       ROUND(SUM("Order Sum"), 0) Orders,
       ROUND(SUM("Packages Sum"), 0) Packages,
       ROUND(SUM("OrderLine Sum"), 0) OrderLines,
       COUNT("Receiver") OVER (PARTITION BY "Shipment #"
                               ORDER BY "Shipment #") CSM
FROM
  (SELECT C1.ClosedDate "Close Date",
          TO_CHAR(r08.pickdate, 'MM/DD/YYYY') "Plan Date",
          r08.routeno "Route Name",
          r08.shortr08,
          o08.shorto08,
          o40.ocarrno,
          o40.ecarrno "Package ID",
          o42.shorto42,
          o06.ordno "Astro Order #",
          o06.eorderid "ISOM Order #",
          Trim(o08.partno) "Article",
          TRIM(o08.partrev) "Supplier",
          TRIM(o08.divcode) "Division",
          CASE
              WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
              ELSE dwpact.scnetvol
          END "Article Volume",
          L629.panum "PA #",
          SUBSTR(L629.panum, 1, 2) "HFB #",
          dwpcp.numcp "Article Pieces",
          r08.etripid "Shipment #",
          o06.ordtype "Astro Order Type",
          r23.deladr "Receiver",
          r231.rcvbucod "Receiver #",
          o42.ocquant "Ship Qty",
          o42.ocquant*(CASE
                           WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                           ELSE dwpact.scnetvol
                       END) "Shipped Net Volume",
          o42.ocquant*(CASE
                           WHEN l62.partunit = 'CMT' THEN dwpact.scgrovol/1000
                           ELSE dwpact.scgrovol
                       END) "Shipped Gross Volume",
          COUNT(DISTINCT o08.shorto08) "Order Lines",
          1/COUNT (*) OVER(PARTITION BY o06.ordno
                           ORDER BY o06.ordno) "Order Sum",
                      1/COUNT (*) OVER(PARTITION BY r08.etripid
                                       ORDER BY r08.etripid) "Shipment Sum",
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
                            '460')
        AND trim(etripid) IS NOT NULL --sondag or Sunday

        AND datreg BETWEEN
          (SELECT next_day(trunc(sysdate), 'Sunday') - 14
           FROM DUAL) AND
          (SELECT next_day(trunc(sysdate), 'Sunday') - 7
           FROM DUAL)
      GROUP BY shortr08) C1 ON (c1.shortr08 = R08.shortr08)
   LEFT JOIN L62T99 L629 ON (o08.partno= L629.partno
                             AND o08.partrev = L629.partrev
                             AND o08.divcode = L629.divcode)
   WHERE o06.ordstat = 9
     AND o08.linestat = 7
     AND r23.deladr NOT LIKE ('%STO%')
   GROUP BY C1.ClosedDate,
            TO_CHAR(r08.pickdate, 'MM/DD/YYYY'),
            r08.routeno,
            r08.shortr08,
            o08.shorto08,
            o40.ocarrno,
            o40.ecarrno,
            o42.shorto42,
            o06.ordno,
            o06.eorderid,
            Trim(o08.partno),
            TRIM(o08.partrev),
            TRIM(o08.divcode),
            CASE
                WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                ELSE dwpact.scnetvol
            END,
            L629.panum,
            SUBSTR(L629.panum, 1, 2),
            dwpcp.numcp,
            r08.etripid,
            o06.ordtype,
            r23.deladr,
            r231.rcvbucod,
            o42.ocquant,
            o42.ocquant*(CASE
                             WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                             ELSE dwpact.scnetvol
                         END),
            o42.ocquant*(CASE
                             WHEN l62.partunit = 'CMT' THEN dwpact.scgrovol/1000
                             ELSE dwpact.scgrovol
                         END))
GROUP BY TO_CHAR("Close Date", 'MM/DD/YYYY'),
         "Plan Date",
         "Division",
         "Route Name",
         "Shipment #",
         "Receiver"
UNION
SELECT NULL CloseDate,
            NULL "Plan Date",
                 NULL "Division",
                      NULL "Route Name",
                           NULL "Shipment #",
                                NULL "Receiver",
                                     NULL GrossVol,
                                          NULL NetVolume,
                                               NULL Orders,
                                                    NULL Packages,
                                                         NULL OrderLines,
                                                              NULL CSM
FROM DUAL