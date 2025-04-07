SELECT P1.closed_date,
       P1.divcode,
       COUNT(P1.ordno) cross_dock_resteer,
       MAX(C1.Resteer_Orders) total_resteer_orders
FROM
  (SELECT TO_CHAR(L16.DATREG, 'MM/DD/YYYY') Pick_Date,
          TO_CHAR(C1.closed_date, 'MM/DD/YYYY') closed_date,
          TO_CHAR (C1.closed_date+1,
                   'IW') week_no,
                  L16.ordno,
                  trim(L16.PARTNO) article,
                  trim(L16.partrev) supplier,
                  trim(L16.divcode) divcode,
                  L16.FMHA from_mha,
                  FP.MHA to_mha,
                  L16.ADMUNIT queue,
                  trim(L16.ecarrno) pallet_id,
                  L16.LDCT pallet_type,
                  L62.PARTDSC1 article_desc,
                  L16.ORDTYPE astro_ord_type,
                  CASE
                      WHEN L16.ORDTYPE = 16 THEN 'Resteer Crossdock'
                      WHEN L16.ORDTYPE = 14 THEN 'Transit Crossdock'
                      ELSE 'Normal Crossdock'
                  END cross_dock_type,
                  CASE
                      WHEN L16.ORDTYPE = 14 THEN 'Transit Crossdock'
                      ELSE 'Normal Crossdock'
                  END mip_cross_dock_type,
                  l16.l16qty qty,
                  ROUND((CASE
                             WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                             ELSE dwpact.scnetvol
                         END)/1000, 2) article_net_vol,
                  l16.l16qty * (CASE
                                    WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol/1000
                                    ELSE dwpact.scnetvol
                                END) ship_net_vol,
                  ROUND(L62.PARTVOL/1000, 2) art_gross_vol,
                  l16.l16vol ship_gross_vol
   FROM --Nested query to limit to closed shipments

     (SELECT shortr08,
             MIN(DATREG) closed_date
      FROM astro.L16T3
      WHERE l16lcode = 52
        AND divcode IN ('345',
                        '532',
                        '017',
                        '019',
                        '460',
                        '490',
                        '061')
        AND DATREG BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
      GROUP BY shortr08) C1 --Ops log only full pallet log codes

   INNER JOIN astro.L16T3 L16 ON (C1.shortr08 = L16.shortr08
                                  AND L16.L16LCODE = 18)
   INNER JOIN astro.L16T3 FP ON (L16.ecarrno = FP.ecarrno
                                 AND FP.L16LCODE = 3
                                 AND FP.l54movet = 7)
   INNER JOIN astro.L62T1 L62 ON L16.shortl62 = L62.shortl62
   INNER JOIN astro.w08t1 w08 ON (FP.mha = w08.member)--Limit to gate groups

   INNER JOIN astro.W04T1 W04 ON (w08.ma_group = w04.ma_group
                                  AND w04.gtype = 1)
   LEFT JOIN astro.o42t90 o42 ON (l16.ocarrno = o42.ocarrno)
   LEFT JOIN astro.dwpkey dwpk ON (o42.shortdwp = dwpk.shortdwp)--DWP connection for SCNETVOL

   LEFT JOIN astro.dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                     AND dwpk.bucodsup = dwpact.bucodsup
                                     AND dwpk.fpacdate = dwpact.fpacdate
                                     AND dwpk.reqdwpno = dwpact.reqdwpno
                                     AND dwpk.reqdwped = dwpact.reqdwped)
   WHERE --Limiting moves coming from dock doors or specified x-block areas
 --Add specific x-block MHAs here
 (L16.FMHA IN ('MHAS HERE')--Nested Query for moves coming from doors

  OR L16.FMHA IN
    (SELECT DISTINCT w08.member
     FROM astro.w08t1 w08
     INNER JOIN astro.W04T1 W04 ON (w08.ma_group = w04.ma_group
                                    AND w04.gtype = 1)))
     AND L16.ORDTYPE = 16
   ORDER BY TRUNC (L16.DATREG)) P1
LEFT JOIN
  (SELECT TO_CHAR(C1.closed_date, 'MM/DD/YYYY') closed_date,
          COUNT(DISTINCT l16.ORDNO) Resteer_Orders
   FROM
     (SELECT shortr08,
             MIN(DATREG) closed_date
      FROM astro.L16T3
      WHERE l16lcode = 52
        AND divcode IN ('345',
                        '532',
                        '017',
                        '019',
                        '460',
                        '490',
                        '061')
        AND DATREG BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
      GROUP BY shortr08) C1
   INNER JOIN astro.L16T3 L16 ON (l16.shortr08 = C1.shortr08)
   WHERE L16.l16lcode = 4
     AND l16.ordtype = 16
   GROUP BY TO_CHAR(C1.closed_date, 'MM/DD/YYYY')) C1 ON (C1.closed_date = P1.closed_date)
GROUP BY P1.closed_date,
         P1.divcode