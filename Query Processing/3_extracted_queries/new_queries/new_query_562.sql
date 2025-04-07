SELECT DISTINCT t7.auditweek AS "_Audit Week",
                t1.pickdate AS "_Pick Date",
                t7.deltype AS "_Flow",
                t7.eorderid,
                t7.ecarrno,
                t1.logguser AS "_Picker",
                t7.logguser AS "_Auditor",
                t1.partno,
                t1.partrev,
                t7.reqquant,
                ABS(t7.l16qty) AS "_Discrepancies",
                CASE
                    WHEN t7.l16qty <0 THEN 'Overpick'
                    WHEN t7.l16qty > 0 THEN 'Shortage'
                    ELSE ''
                END AS "_Type",
                '' AS "_Legit?",
                '' AS "_Comment",
                '' AS "_Damage?",
                '' AS "_Wrong Article?"
FROM
  (SELECT TO_CHAR(l16.datreg + 1, 'YYYY-IW') AS auditweek,
          CASE
              WHEN l16.ROUTENO LIKE 'LOC%'
                   OR l16.ROUTENO LIKE 'RXO%' THEN 'YL'
              WHEN l16.ROUTENO LIKE 'F%' THEN 'Parcel'
              WHEN l16.ROUTENO LIKE 'EMOS%' THEN 'Parcel'
              WHEN l16.ROUTENO LIKE 'BIKE%' THEN 'Parcel'
              WHEN l16.ROUTENO LIKE 'PEN%' THEN 'Collection Point'
              WHEN l16.ROUTENO LIKE 'CPAU%' THEN 'Collection Point'
              WHEN l16.ROUTENO LIKE 'MAN%' THEN 'Truck'
              WHEN l16.ROUTENO LIKE 'WINDP%' THEN 'Truck'
              WHEN l16.ROUTENO LIKE 'LONDP%' THEN 'Truck'
              WHEN l16.ROUTENO LIKE 'BAR%' THEN 'Truck'
              WHEN l16.ROUTENO LIKE 'SCCP%' THEN 'Collection Point'
              ELSE 'Truck'
          END AS deltype,
          o08.shortl62,
          l16.logguser,
          o08.ordno,
          o08.partno,
          o08.partrev,
          l16.ecarrno,
          o08.reqquant,
          l16.l16lcode,
          l16.l16qty,
          l16.l16eorderid AS eorderid
   FROM ASTRO.O08T1 o08,
        ASTRO.L16T3 l16
   WHERE o08.ordno = l16.ordno
     AND o08.shortl62 = l16.shortl62
     AND l16.l16lcode IN ('61',
                          '62')
     AND o08.linestat NOT IN ('0')) t7
LEFT OUTER JOIN
  (SELECT DISTINCT TO_CHAR(l16.datreg, 'YYYY-MM-DD') AS pickdate,
                   l16.logguser,
                   l16.partno,
                   l16.partrev,
                   l16.l16qty,
                   l16.shortl62,
                   l16.ordno,
                   l16.l16eorderid
   FROM ASTRO.L16T3 l16
   WHERE l16.l16lcode = '4') T1 ON t7.ordno = t1.ordno
AND t7.shortl62 = t1.shortl62
WHERE t7.reqquant ! = t7.l16qty
  AND t7.l16qty != 0
  AND ABS(t7.l16qty) <10000
ORDER BY t7.auditweek,
         t1.pickdate