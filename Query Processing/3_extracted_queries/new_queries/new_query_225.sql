SELECT TO_CHAR(O06T1.deldate, 'dd.mm.yyyy')"_DelDate",
       COUNT(DISTINCT CASE
                          WHEN O40T2.stato40 NOT IN ('90', '0') THEN O40T2.shorto06
                      END)"_Ordern not ready"
FROM O06T1
LEFT JOIN O04T90 ON O04T90.shorto04 = O06T1.shorto04
LEFT JOIN O40T2 ON O40T2.shorto06 = O06T1.shorto06
WHERE TRUNC(O06T1.deldate) <= TRUNC(sysdate)
  AND O04T90.rcvbucod IN (596,
                          2648)
  AND O06T1.ordstat IN (1,
                        21,
                        22,
                        23,
                        25,
                        2,
                        30,
                        4,
                        5,
                        6,
                        7,
                        8,
                        9)
GROUP BY TO_CHAR(O06T1.deldate, 'dd.mm.yyyy'),
         TO_CHAR(O06T1.deldate, 'yyyy.mm.dd')
HAVING COUNT(DISTINCT CASE
                          WHEN O40T2.stato40 NOT IN ('90', '0') THEN O40T2.shorto06
                      END) > 0
ORDER BY TO_CHAR(O06T1.deldate, 'yyyy.mm.dd') ASC