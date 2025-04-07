SELECT C1.shortr08,
       TRIM(C1.divcode) "CDC",
       TRIM(o06.eorderid) "Sales Order #",
       o06.ordno "Astro Order #",
       C1.ClosedDate "Closed Date",
       TO_CHAR(r08.depdate, 'MM/DD/YYYY HH:MI:SS AM') "Planned Dispatch Date",
       TO_CHAR(o06.deldate, 'MM/DD/YYYY HH:MI:SS AM') "Required Dispatch Date",
       TRIM(r08.routeno)||'-'||TRIM(r08.tripno) "Route Name",
       CASE
           WHEN o06.ordtype = 12 THEN 'Parcel'
           WHEN C1.etripid IS NULL THEN 'Yellow Line/Customer PU'
           ELSE 'Truck'
       END "Flow",
       o04.deladr "Receiver",
       CASE
           WHEN TRUNC(C1.ClosedDate) > TRUNC(o06.deldate) THEN 'Late'
           ELSE 'On Time'
       END Status,
       CASE
           WHEN TRUNC(C1.ClosedDate) <= TRUNC(o06.deldate) THEN 1/COUNT (*) OVER(PARTITION BY o06.ordno
                                                                                 ORDER BY o06.ordno)
           ELSE 0
       END "On Time",
       CASE
           WHEN TRUNC(C1.ClosedDate) > TRUNC(o06.deldate) THEN 1/COUNT (*) OVER(PARTITION BY o06.ordno
                                                                                ORDER BY o06.ordno)
           ELSE 0
       END "Late",
       1/COUNT (*) OVER(PARTITION BY o06.ordno
                        ORDER BY o06.ordno) TotalOrders
FROM
  (SELECT l16.shortr08,
          l16.oppdate,
          l16.routeno,
          l16.etripid,
          l16.divcode,
          o40.ocarrno,
          o40.ecarrno,
          o42.shorto42,
          o42.shortl62,
          o42.ocquant,
          o42.shorto08,
          o42.shorto06,
          datreg ClosedDate
   FROM l16t3 l16
   INNER JOIN o40t2 o40 ON (l16.ocarrno = o40.ocarrno)
   INNER JOIN o42t2 o42 ON (o42.ocarrno = o40.ocarrno)
   INNER JOIN o42t90 o421 ON (o42.shorto42 = o421.shorto42)
   WHERE --sondag or Sunday
 l16.datreg BETWEEN
       (SELECT next_day(trunc(sysdate), 'Sunday') - 14
        FROM DUAL) AND
       (SELECT next_day(trunc(sysdate), 'Sunday') - 7
        FROM DUAL)
     AND l16.l16lcode = 52
     AND l16.divcode NOT IN ('345',
                             '017',
                             '019',
                             '460')
     AND o42.o42stat = 65) C1
INNER JOIN o08t1 o08 ON (C1.shorto08 = o08.shorto08)
INNER JOIN o06t1 o06 ON (o06.shorto06 = o08.shorto06)
INNER JOIN o04t1 o04 ON (o06.ordno = o04.ordno)
INNER JOIN r08t1 r08 ON (o06.shortr08 = r08.shortr08)
WHERE o06.ordstat = 9
  AND o08.linestat = 7
GROUP BY C1.shortr08,
         C1.divcode,
         o06.eorderid,
         o06.ordno,
         C1.ClosedDate,
         TO_CHAR(r08.depdate, 'MM/DD/YYYY HH:MI:SS AM'),
         TO_CHAR(o06.deldate, 'MM/DD/YYYY'),
         r08.routeno,
         CASE
             WHEN o06.ordtype = 12 THEN 'Parcel'
             WHEN C1.etripid IS NULL THEN 'Yellow Line/Customer PU'
             ELSE 'Truck'
         END,
         r08.tripno,
         o06.ordtype,
         o04.deladr,
         o06.statdate,
         o06.deldate
ORDER BY TO_CHAR(o06.statdate, 'mm/dd/yyyy') ASC