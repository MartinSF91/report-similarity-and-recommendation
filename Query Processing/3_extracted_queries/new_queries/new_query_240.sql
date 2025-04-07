SELECT CASE
           WHEN L16Lcode=29
                AND admunit IN ('RNBP1',
                                'RNBP2',
                                'RNBP3',
                                'RNBP4') THEN 'Pick Run NBB'
           WHEN L16Lcode=3
                AND mha IN ('13SP1') THEN 'Verraumen shelf'
       END "_Halle         ",
       logguser,
       fname,
       lname,
       COUNT(CASE
                 WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                       AND to_char(datreg, 'hh24:mi') <= '23:59')
                      OR (to_char(datreg, 'hh24:mi') >= '00:00'
                          AND to_char(datreg, 'hh24:mi') <= '06:00') THEN l16seqno
             END)"_Nachtschicht",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '06:00'
                      AND to_char(datreg, 'hh24:mi') <= '14:00' THEN l16seqno
             END)"_Fruhschicht",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '14:00'
                      AND to_char(datreg, 'hh24:mi') <= '22:00' THEN l16seqno
             END)"_Spatschicht",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '22:00'
                      AND to_char(datreg, 'hh24:mi') < '23:00' THEN l16seqno
             END)"22:00-22:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '23:00'
                      AND to_char(datreg, 'hh24:mi') < '23:59' THEN l16seqno
             END)"23:00-23:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '00:00'
                      AND to_char(datreg, 'hh24:mi') < '01:00' THEN l16seqno
             END)"00:00-00:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '01:00'
                      AND to_char(datreg, 'hh24:mi') < '02:00' THEN l16seqno
             END)"01:00-01:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '02:00'
                      AND to_char(datreg, 'hh24:mi') < '03:00' THEN l16seqno
             END)"02:00-02:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '03:00'
                      AND to_char(datreg, 'hh24:mi') < '04:00' THEN l16seqno
             END)"03:00-03:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '04:00'
                      AND to_char(datreg, 'hh24:mi') < '05:00' THEN l16seqno
             END)"04:00-04:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '05:00'
                      AND to_char(datreg, 'hh24:mi') < '06:00' THEN l16seqno
             END)"05:00-05:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '06:00'
                      AND to_char(datreg, 'hh24:mi') < '07:00' THEN l16seqno
             END)"06:00-06:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '07:00'
                      AND to_char(datreg, 'hh24:mi') < '08:00' THEN l16seqno
             END)"07:00-07:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '08:00'
                      AND to_char(datreg, 'hh24:mi') < '09:00' THEN l16seqno
             END)"08:00-08:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '09:00'
                      AND to_char(datreg, 'hh24:mi') < '10:00' THEN l16seqno
             END)"09:00-09:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '10:00'
                      AND to_char(datreg, 'hh24:mi') < '11:00' THEN l16seqno
             END)"10:00-10:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '11:00'
                      AND to_char(datreg, 'hh24:mi') < '12:00' THEN l16seqno
             END)"11:00-11:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '12:00'
                      AND to_char(datreg, 'hh24:mi') < '13:00' THEN l16seqno
             END)"12:00-12:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '13:00'
                      AND to_char(datreg, 'hh24:mi') < '14:00' THEN l16seqno
             END)"13:00-13:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '14:00'
                      AND to_char(datreg, 'hh24:mi') < '15:00' THEN l16seqno
             END)"14:00-14:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '15:00'
                      AND to_char(datreg, 'hh24:mi') < '16:00' THEN l16seqno
             END)"15:00-15:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '16:00'
                      AND to_char(datreg, 'hh24:mi') < '17:00' THEN l16seqno
             END)"16:00-16:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '17:00'
                      AND to_char(datreg, 'hh24:mi') < '18:00' THEN l16seqno
             END)"17:00-17:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '18:00'
                      AND to_char(datreg, 'hh24:mi') < '19:00' THEN l16seqno
             END)"18:00-18:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '19:00'
                      AND to_char(datreg, 'hh24:mi') < '20:00' THEN l16seqno
             END)"19:00-19:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '20:00'
                      AND to_char(datreg, 'hh24:mi') < '21:00' THEN l16seqno
             END)"20:00-20:59",
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '21:00'
                      AND to_char(datreg, 'hh24:mi') < '22:00' THEN l16seqno
             END)"21:00-21:59",
       S90T1.hphone --COUNT(distinct l16seqno)"ALL"

FROM L16T3
LEFT JOIN S90T1 ON S90T1.uname = L16T3.logguser --(Select L16T3.*,t1.o40type from  L16T3 left join (select ecarrno,o40type from O40T2)t1 on L16T3.ecarrno=t1.ecarrno)t

WHERE datreg >= (sysdate-1)
  AND logguser NOT IN ('L79CRANE')
GROUP BY logguser,
         fname,
         lname,
         S90T1.hphone,
         CASE
             WHEN L16Lcode=29
                  AND admunit IN ('RNBP1',
                                  'RNBP2',
                                  'RNBP3',
                                  'RNBP4') THEN 'Pick Run NBB'
             WHEN L16Lcode=3
                  AND mha IN ('13SP1') THEN 'Verraumen shelf'
         END
HAVING CASE
           WHEN L16Lcode=29
                AND admunit IN ('RNBP1',
                                'RNBP2',
                                'RNBP3',
                                'RNBP4') THEN 'Pick Run NBB'
           WHEN L16Lcode=3
                AND mha IN ('13SP1') THEN 'Verraumen shelf'
       END IS NOT NULL
ORDER BY CASE
             WHEN L16Lcode=29
                  AND admunit IN ('RNBP1',
                                  'RNBP2',
                                  'RNBP3',
                                  'RNBP4') THEN 'Pick Run NBB'
             WHEN L16Lcode=3
                  AND mha IN ('13SP1') THEN 'Verraumen shelf'
         END,
         logguser