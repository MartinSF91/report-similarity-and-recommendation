SELECT O08T1.pickdate,
       O08T1.ordno,
       O08T1.shortl62,
       O08T1.partno,
       O08T1.partrev,
       O08T1.reqquant
FROM O08T1,
     R08T1
WHERE O08t1.shortr08=R08T1.shortr08
  AND r08t1.tripstat IN ('0',
                         '1',
                         '2',
                         '24',
                         '26',
                         '27')
  AND R08t1.routeno='017CDC'