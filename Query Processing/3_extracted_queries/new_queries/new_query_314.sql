/*TakedownFunction SQL*/
SELECT TRUNC(a1.datreg) "Date",
       CASE
           WHEN a1.logguser IS NOT NULL THEN '532-Takedown'
           ELSE 'Other'
       END "Function",
       TRIM (a1.logguser) "User",
            TRIM (a2.fname) "F Name",
                 TRIM (a2.lname) "L Name",
                      TRIM (a2.address3) "Shift",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                   ELSE 0
                               END) "06",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                   ELSE 0
                               END) "07",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                   ELSE 0
                               END) "08",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                   ELSE 0
                               END) "09",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                   ELSE 0
                               END) "10",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                   ELSE 0
                               END) "11",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                   ELSE 0
                               END) "12",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                   ELSE 0
                               END) "13",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                   ELSE 0
                               END) "14",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                   ELSE 0
                               END) "15",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                   ELSE 0
                               END) "16",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                   ELSE 0
                               END) "17",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                   ELSE 0
                               END) "18",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                   ELSE 0
                               END) "19",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                   ELSE 0
                               END) "20",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                   ELSE 0
                               END) "21",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                   ELSE 0
                               END) "22",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                   ELSE 0
                               END) "23",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                   ELSE 0
                               END) "00",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                   ELSE 0
                               END) "01",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                   ELSE 0
                               END) "02",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                   ELSE 0
                               END) "03",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                   ELSE 0
                               END) "04",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                   ELSE 0
                               END) "05"
FROM ast532.l16t3 a1,
     ast532.s90t1 a2
WHERE a2.dep NOT IN ('CDC TEAMLEAD')
  AND a1.logguser = a2.uname
  AND a1.datreg >= SYSDATE-7
  AND a1.l16Lcode = 18
  AND a1.fmha not like '12%OC'
  AND a1.ordtype !=14
GROUP BY TRUNC(a1.datreg),
         a1.logguser,
         TRIM (a2.fname), TRIM (a2.lname), a2.address3
ORDER BY TRUNC(a1.datreg)