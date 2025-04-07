
SELECT T1.logguser,
       T1.Shift,
       T1.fname,
       T1.lname,
       CASE
           WHEN l16lcode IN (930,
                             4) THEN 'Picking'
           WHEN l16lcode=2 THEN 'Stocktake'
           WHEN l16lcode=61 THEN 'Audit'
           WHEN l16lcode=1 THEN 'St.Unit Creation'
           WHEN l16lcode=26 THEN 'Unloading'
           WHEN l16lcode=3 THEN 'PutAway or replen'
           ELSE 'Other'
       END FUNCTION,
           admunit,
           "Last Transaction",
           "_Minutes to shift end",
           "_Comments"
FROM l16t3
INNER JOIN
  (SELECT logguser,
          trim(s90t1.email) Shift,
          trim(s90t1.fname) fname,
          trim(s90t1.lname) lname,
          min(l16seqno) seq,
          max(datreg) "Last Transaction",
          ABS(ROUND((sysdate-max(datreg))*1440, 1)) "_Minutes to shift end",
          '' "_Comments"
   FROM ast052.l16t3
   INNER JOIN ast052.s90t1 ON s90t1.uname=l16t3.logguser
   WHERE l16lcode IN(1,
                     2,
                     930,
                     3,
                     4,
                     61)
     AND datreg>(sysdate- NUMTODSINTERVAL(1, 'Hour'))
   GROUP BY logguser,
            trim(s90t1.email),
            trim(s90t1.fname),
            trim(s90t1.lname)
   ORDER BY ABS(ROUND((sysdate-max(datreg))*1440, 1)))T1 ON l16t3.l16seqno=T1.seq
AND l16t3.logguser=T1.logguser
WHERE l16seqno=T1.seq
ORDER BY "_Minutes to shift end" DESC