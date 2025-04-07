SELECT CASE when(CASE
                     WHEN l46adr < 3000
                          AND l46adr > 2000
                          AND l16lcode = 4
                          AND l16qty > 0
                          AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                          AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 'Picking Automation'
                     WHEN l46adr < 3000
                          AND l46adr > 2000
                          AND l16lcode = 4
                          AND l16qty > 0
                          AND fmha IN ('13PL') THEN 'Picking Logimat'
                     WHEN l46adr < 3000
                          AND l46adr > 2000
                          AND l16lcode = 4
                          AND l16qty > 0
                          AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                          AND L16T3.frack IN ('014', '019', '035', '038', '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

                     WHEN l16lcode IN ('4')
                          AND fmha IN ('12P1') THEN 'Picking Conventional'
                     WHEN l16lcode IN ('3', '31')
                          AND fmha IN ('12TTR', '12TR') THEN 'Transferrack'
                 END) IN ('Picking Automation',
                          'Picking Conventional',
                          'Picking Logimat',
                          'Picking Sensitive',
                          'Transferrack') THEN 'Picking'
       END"_Area 1",
       CASE WHEN(CASE
                     WHEN L16Lcode=3
                          AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                          AND mha IN ('PCKRD') THEN 'Packing Conventional'
                     WHEN L16Lcode=40
                          AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 'Loading H2'
                     WHEN L16Lcode=40
                          AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 'Loading H3'
                     WHEN L16Lcode=3
                          AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 'filling H3'
                 END) IN ('Packing Conventional',
                          'Loading H2',
                          'Loading H3',
                          'filling H3') THEN 'Outbound'
       END"_Area 2",
       CASE WHEN(CASE
                     WHEN L16Lcode=3
                          AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 'Replenishment fullpallet'
                     WHEN L16Lcode=1
                          AND ((fmha>='101A'
                                AND fmha<='101Z')
                               OR (fmha>='210A'
                                   AND fmha<='210Z')
                               OR (fmha>='150A'
                                   AND fmha<='150Z')
                               OR (fmha>='410A'
                                   AND fmha<='410Z')) THEN 'Receiving'
                     WHEN L16Lcode=3
                          AND mha IN ('13MP', '13MP', '14PP1') THEN 'Verraumung'
                     WHEN L16Lcode=3
                          AND mha IN ('13PL') THEN 'Replenishment Logimat'
                     WHEN L16Lcode=3
                          AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 'Replenishment to NBB'
                     WHEN L16Lcode=3
                          AND ((fmha>='101A'
                                AND fmha<='101Z')
                               OR (fmha>='210A'
                                   AND fmha<='210Z')
                               OR (fmha>='150A'
                                   AND fmha<='150Z')
                               OR (fmha>='410A'
                                   AND fmha<='410Z')) THEN 'Putaway'
                     WHEN L16Lcode=29
                          AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 'Replenishment from NBB'
                     WHEN L16Lcode=26
                          AND ((fmha>='101A'
                                AND fmha<='101Z')
                               OR (fmha>='210A'
                                   AND fmha<='210Z')
                               OR (fmha>='150A'
                                   AND fmha<='150Z')
                               OR (fmha>='410A'
                                   AND fmha<='410Z')) THEN 'Unloading'
                 END) IN ('Replenishment fullpallet',
                          'Receiving',
                          'Verraumung',
                          'Replenishment Logimat',
                          'Replenishment to NBB',
                          'Putaway',
                          'Replenishment from NBB',
                          'Unloading') THEN 'Inbound'
       END"_Area 3",
       CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND L16T3.frack NOT IN ('014',
                                        '019',
                                        '035',
                                        '039',
                                        '029') THEN 'Picking Automation'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN 'Picking Logimat'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND L16T3.frack IN ('014',
                                    '019',
                                    '035',
                                    '038',
                                    '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

           WHEN l16lcode IN ('4')
                AND fmha IN ('12P1') THEN 'Picking Conventional'
           WHEN l16lcode IN ('3',
                             '31')
                AND fmha IN ('12TTR',
                             '12TR') THEN 'Transferrack'
           WHEN L16Lcode=3
                AND fmha IN ('PCK01',
                             'PCK02',
                             'PCK03',
                             'PCK04',
                             'PCK05',
                             'PCK06',
                             'PCK07',
                             'PCK08',
                             'PCK09',
                             'PCK10',
                             'PCK11',
                             'PCK12')
                AND mha IN ('PCKRD') THEN 'Packing Conventional'
           WHEN L16Lcode=40
                AND fmha IN ('19DHL',
                             '20DHL',
                             '21DHL',
                             '22DHL',
                             '23DHL',
                             '24DHL',
                             '25DHL',
                             '26DHL',
                             '27DHL') THEN 'Loading H2'
           WHEN L16Lcode=40
                AND fmha IN ('30DHL',
                             '31DHL',
                             '32DHL',
                             '33DHL',
                             '34DHL',
                             '35DHL',
                             '36DHL') THEN 'Loading H3'
           WHEN L16Lcode=3
                AND mha IN ('30DHL',
                            '31DHL',
                            '32DHL',
                            '33DHL',
                            '34DHL',
                            '35DHL',
                            '36DHL') THEN 'filling H3'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH2',
                                 'REPH3',
                                 'REPH4',
                                 'REPMZ') THEN 'Replenishment fullpallet'
           WHEN L16Lcode=1
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Receiving'
           WHEN L16Lcode=3
                AND mha IN ('13MP',
                            '13MP',
                            '14PP1') THEN 'Verraumung'
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN 'Replenishment Logimat'
           WHEN L16Lcode=3
                AND mha IN ('1NBB',
                            '1NBB1',
                            '4NBB',
                            '4NBB1') THEN 'Replenishment to NBB'
           WHEN L16Lcode=3
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Putaway'
           WHEN L16Lcode=29
                AND admunit IN ('RNBP1',
                                'RNBP2',
                                'RNBP3',
                                'RNBP4') THEN 'Replenishment from NBB'
           WHEN L16Lcode=26
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Unloading'
       END "_part",
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
       COUNT(CASE
                 WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                       AND to_char(datreg, 'hh24:mi') <= '23:59')
                      OR (to_char(datreg, 'hh24:mi') >= '00:00'
                          AND to_char(datreg, 'hh24:mi') <= '22:00') THEN l16seqno
             END)"_total vol",
       CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND L16T3.frack NOT IN ('014',
                                        '019',
                                        '035',
                                        '039',
                                        '029') THEN 85
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN 90
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND frack IN ('014',
                              '019',
                              '035',
                              '038',
                              '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

           WHEN l16lcode IN ('4')
                AND fmha IN ('12P1') THEN 30
           WHEN l16lcode IN ('3',
                             '31')
                AND fmha IN ('12TTR',
                             '12TR') THEN 80
           WHEN L16Lcode=3
                AND fmha IN ('PCK01',
                             'PCK02',
                             'PCK03',
                             'PCK04',
                             'PCK05',
                             'PCK06',
                             'PCK07',
                             'PCK08',
                             'PCK09',
                             'PCK10',
                             'PCK11',
                             'PCK12')
                AND mha IN ('PCKRD') THEN 16
           WHEN L16Lcode=40
                AND fmha IN ('19DHL',
                             '20DHL',
                             '21DHL',
                             '22DHL',
                             '23DHL',
                             '24DHL',
                             '25DHL',
                             '26DHL',
                             '27DHL') THEN 110
           WHEN L16Lcode=40
                AND fmha IN ('30DHL',
                             '31DHL',
                             '32DHL',
                             '33DHL',
                             '34DHL',
                             '35DHL',
                             '36DHL') THEN 160
           WHEN L16Lcode=3
                AND mha IN ('30DHL',
                            '31DHL',
                            '32DHL',
                            '33DHL',
                            '34DHL',
                            '35DHL',
                            '36DHL') THEN 300
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH2',
                                 'REPH3',
                                 'REPH4',
                                 'REPMZ') THEN 14
           WHEN L16Lcode=1
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 75
           WHEN L16Lcode=3
                AND mha IN ('13MP',
                            '13MP',
                            '14PP1') THEN 13
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN 40
           WHEN L16Lcode=3
                AND mha IN ('1NBB',
                            '1NBB1',
                            '4NBB',
                            '4NBB1') THEN 14
           WHEN L16Lcode=3
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 15
           WHEN L16Lcode=29
                AND admunit IN ('RNBP1',
                                'RNBP2',
                                'RNBP3',
                                'RNBP4') THEN 16
           WHEN L16Lcode=26
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 110
       END"_Target prod",
       ROUND(COUNT(CASE
                       WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                             AND to_char(datreg, 'hh24:mi') <= '23:59')
                            OR (to_char(datreg, 'hh24:mi') >= '00:00'
                                AND to_char(datreg, 'hh24:mi') <= '22:00') THEN l16seqno
                   END)/ CASE
                             WHEN l46adr < 3000
                                  AND l46adr > 2000
                                  AND l16lcode = 4
                                  AND l16qty > 0
                                  AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                  AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 85
                             WHEN l46adr < 3000
                                  AND l46adr > 2000
                                  AND l16lcode = 4
                                  AND l16qty > 0
                                  AND fmha IN ('13PL') THEN 90
                             WHEN l46adr < 3000
                                  AND l46adr > 2000
                                  AND l16lcode = 4
                                  AND l16qty > 0
                                  AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                  AND frack IN ('014', '019', '035', '038', '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

                             WHEN l16lcode IN ('4')
                                  AND fmha IN ('12P1') THEN 30
                             WHEN l16lcode IN ('3', '31')
                                  AND fmha IN ('12TTR', '12TR') THEN 80
                             WHEN L16Lcode=3
                                  AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                                  AND mha IN ('PCKRD') THEN 16
                             WHEN L16Lcode=40
                                  AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 110
                             WHEN L16Lcode=40
                                  AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 160
                             WHEN L16Lcode=3
                                  AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 300
                             WHEN L16Lcode=3
                                  AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 14
                             WHEN L16Lcode=1
                                  AND ((fmha>='101A'
                                        AND fmha<='101Z')
                                       OR (fmha>='210A'
                                           AND fmha<='210Z')
                                       OR (fmha>='150A'
                                           AND fmha<='150Z')
                                       OR (fmha>='410A'
                                           AND fmha<='410Z')) THEN 75
                             WHEN L16Lcode=3
                                  AND mha IN ('13MP', '13MP', '14PP1') THEN 13
                             WHEN L16Lcode=3
                                  AND mha IN ('13PL') THEN 40
                             WHEN L16Lcode=3
                                  AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 14
                             WHEN L16Lcode=3
                                  AND ((fmha>='101A'
                                        AND fmha<='101Z')
                                       OR (fmha>='210A'
                                           AND fmha<='210Z')
                                       OR (fmha>='150A'
                                           AND fmha<='150Z')
                                       OR (fmha>='410A'
                                           AND fmha<='410Z')) THEN 15
                             WHEN L16Lcode=29
                                  AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 16
                             WHEN L16Lcode=26
                                  AND ((fmha>='101A'
                                        AND fmha<='101Z')
                                       OR (fmha>='210A'
                                           AND fmha<='210Z')
                                       OR (fmha>='150A'
                                           AND fmha<='150Z')
                                       OR (fmha>='410A'
                                           AND fmha<='410Z')) THEN 110
                         END, 2)"_estimated hours",
       ROUND(ROUND(COUNT(CASE
                             WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                                   AND to_char(datreg, 'hh24:mi') <= '23:59')
                                  OR (to_char(datreg, 'hh24:mi') >= '00:00'
                                      AND to_char(datreg, 'hh24:mi') <= '22:00') THEN l16seqno
                         END)/ CASE
                                   WHEN l46adr < 3000
                                        AND l46adr > 2000
                                        AND l16lcode = 4
                                        AND l16qty > 0
                                        AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                        AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 85
                                   WHEN l46adr < 3000
                                        AND l46adr > 2000
                                        AND l16lcode = 4
                                        AND l16qty > 0
                                        AND fmha IN ('13PL') THEN 90
                                   WHEN l46adr < 3000
                                        AND l46adr > 2000
                                        AND l16lcode = 4
                                        AND l16qty > 0
                                        AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                        AND frack IN ('014', '019', '035', '038', '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

                                   WHEN l16lcode IN ('4')
                                        AND fmha IN ('12P1') THEN 30
                                   WHEN l16lcode IN ('3', '31')
                                        AND fmha IN ('12TTR', '12TR') THEN 80
                                   WHEN L16Lcode=3
                                        AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                                        AND mha IN ('PCKRD') THEN 16
                                   WHEN L16Lcode=40
                                        AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 110
                                   WHEN L16Lcode=40
                                        AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 160
                                   WHEN L16Lcode=3
                                        AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 300
                                   WHEN L16Lcode=3
                                        AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 14
                                   WHEN L16Lcode=1
                                        AND ((fmha>='101A'
                                              AND fmha<='101Z')
                                             OR (fmha>='210A'
                                                 AND fmha<='210Z')
                                             OR (fmha>='150A'
                                                 AND fmha<='150Z')
                                             OR (fmha>='410A'
                                                 AND fmha<='410Z')) THEN 75
                                   WHEN L16Lcode=3
                                        AND mha IN ('13MP', '13MP', '14PP1') THEN 13
                                   WHEN L16Lcode=3
                                        AND mha IN ('13PL') THEN 40
                                   WHEN L16Lcode=3
                                        AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 14
                                   WHEN L16Lcode=3
                                        AND ((fmha>='101A'
                                              AND fmha<='101Z')
                                             OR (fmha>='210A'
                                                 AND fmha<='210Z')
                                             OR (fmha>='150A'
                                                 AND fmha<='150Z')
                                             OR (fmha>='410A'
                                                 AND fmha<='410Z')) THEN 15
                                   WHEN L16Lcode=29
                                        AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 16
                                   WHEN L16Lcode=26
                                        AND ((fmha>='101A'
                                              AND fmha<='101Z')
                                             OR (fmha>='210A'
                                                 AND fmha<='210Z')
                                             OR (fmha>='150A'
                                                 AND fmha<='150Z')
                                             OR (fmha>='410A'
                                                 AND fmha<='410Z')) THEN 110
                               END, 2)-7.5, 2)"_eff hours",
       CASE
           WHEN ROUND(ROUND(COUNT(CASE
                                      WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                                            AND to_char(datreg, 'hh24:mi') <= '23:59')
                                           OR (to_char(datreg, 'hh24:mi') >= '00:00'
                                               AND to_char(datreg, 'hh24:mi') <= '22:00') THEN l16seqno
                                  END)/ CASE
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                                 AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 85
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('13PL') THEN 90
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                                 AND frack IN ('014', '019', '035', '038', '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

                                            WHEN l16lcode IN ('4')
                                                 AND fmha IN ('12P1') THEN 30
                                            WHEN l16lcode IN ('3', '31')
                                                 AND fmha IN ('12TTR', '12TR') THEN 80
                                            WHEN L16Lcode=3
                                                 AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                                                 AND mha IN ('PCKRD') THEN 16
                                            WHEN L16Lcode=40
                                                 AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 110
                                            WHEN L16Lcode=40
                                                 AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 160
                                            WHEN L16Lcode=3
                                                 AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 300
                                            WHEN L16Lcode=3
                                                 AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 14
                                            WHEN L16Lcode=1
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 75
                                            WHEN L16Lcode=3
                                                 AND mha IN ('13MP', '13MP', '14PP1') THEN 13
                                            WHEN L16Lcode=3
                                                 AND mha IN ('13PL') THEN 40
                                            WHEN L16Lcode=3
                                                 AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 14
                                            WHEN L16Lcode=3
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 15
                                            WHEN L16Lcode=29
                                                 AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 16
                                            WHEN L16Lcode=26
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 110
                                        END, 2)-7.5, 2) >= 0 THEN 'TP'
           WHEN ROUND(ROUND(COUNT(CASE
                                      WHEN (to_char(datreg, 'hh24:mi') >= '22:00'
                                            AND to_char(datreg, 'hh24:mi') <= '23:59')
                                           OR (to_char(datreg, 'hh24:mi') >= '00:00'
                                               AND to_char(datreg, 'hh24:mi') <= '22:00') THEN l16seqno
                                  END)/ CASE
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                                 AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 85
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('13PL') THEN 90
                                            WHEN l46adr < 3000
                                                 AND l46adr > 2000
                                                 AND l16lcode = 4
                                                 AND l16qty > 0
                                                 AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                                                 AND frack IN ('014', '019', '035', '038', '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

                                            WHEN l16lcode IN ('4')
                                                 AND fmha IN ('12P1') THEN 30
                                            WHEN l16lcode IN ('3', '31')
                                                 AND fmha IN ('12TTR', '12TR') THEN 80
                                            WHEN L16Lcode=3
                                                 AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                                                 AND mha IN ('PCKRD') THEN 16
                                            WHEN L16Lcode=40
                                                 AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 110
                                            WHEN L16Lcode=40
                                                 AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 160
                                            WHEN L16Lcode=3
                                                 AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 300
                                            WHEN L16Lcode=3
                                                 AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 14
                                            WHEN L16Lcode=1
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 75
                                            WHEN L16Lcode=3
                                                 AND mha IN ('13MP', '13MP', '14PP1') THEN 13
                                            WHEN L16Lcode=3
                                                 AND mha IN ('13PL') THEN 40
                                            WHEN L16Lcode=3
                                                 AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 14
                                            WHEN L16Lcode=3
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 15
                                            WHEN L16Lcode=29
                                                 AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 16
                                            WHEN L16Lcode=26
                                                 AND ((fmha>='101A'
                                                       AND fmha<='101Z')
                                                      OR (fmha>='210A'
                                                          AND fmha<='210Z')
                                                      OR (fmha>='150A'
                                                          AND fmha<='150Z')
                                                      OR (fmha>='410A'
                                                          AND fmha<='410Z')) THEN 110
                                        END, 2)-7.5, 2) < 0 THEN 'NTP'
       END"_performance",
       S90T1.hphone"_company"
FROM L16T3
LEFT JOIN S90T1 ON S90T1.uname = L16T3.logguser
WHERE datreg >= TRUNC(sysdate-1) + INTERVAL '22' HOUR
  AND datreg <= TRUNC(sysdate) + INTERVAL '22' HOUR
GROUP BY CASE when(CASE
                       WHEN l46adr < 3000
                            AND l46adr > 2000
                            AND l16lcode = 4
                            AND l16qty > 0
                            AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                            AND L16T3.frack NOT IN ('014', '019', '035', '039', '029') THEN 'Picking Automation'
                       WHEN l46adr < 3000
                            AND l46adr > 2000
                            AND l16lcode = 4
                            AND l16qty > 0
                            AND fmha IN ('13PL') THEN 'Picking Logimat'
                       WHEN l46adr < 3000
                            AND l46adr > 2000
                            AND l16lcode = 4
                            AND l16qty > 0
                            AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP')
                            AND L16T3.frack IN ('014', '019', '035', '038', '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

                       WHEN l16lcode IN ('4')
                            AND fmha IN ('12P1') THEN 'Picking Conventional'
                       WHEN l16lcode IN ('3', '31')
                            AND fmha IN ('12TTR', '12TR') THEN 'Transferrack'
                   END) IN ('Picking Automation',
                            'Picking Conventional',
                            'Picking Logimat',
                            'Picking Sensitive',
                            'Transferrack') THEN 'Picking'
         END,
         CASE WHEN(CASE
                       WHEN L16Lcode=3
                            AND fmha IN ('PCK01', 'PCK02', 'PCK03', 'PCK04', 'PCK05', 'PCK06', 'PCK07', 'PCK08', 'PCK09', 'PCK10', 'PCK11', 'PCK12')
                            AND mha IN ('PCKRD') THEN 'Packing Conventional'
                       WHEN L16Lcode=40
                            AND fmha IN ('19DHL', '20DHL', '21DHL', '22DHL', '23DHL', '24DHL', '25DHL', '26DHL', '27DHL') THEN 'Loading H2'
                       WHEN L16Lcode=40
                            AND fmha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 'Loading H3'
                       WHEN L16Lcode=3
                            AND mha IN ('30DHL', '31DHL', '32DHL', '33DHL', '34DHL', '35DHL', '36DHL') THEN 'filling H3'
                   END) IN ('Packing Conventional',
                            'Loading H2',
                            'Loading H3',
                            'filling H3') THEN 'Outbound'
         END,
         CASE WHEN(CASE
                       WHEN L16Lcode=3
                            AND gadmunit IN ('REPH2', 'REPH3', 'REPH4', 'REPMZ') THEN 'Replenishment fullpallet'
                       WHEN L16Lcode=1
                            AND ((fmha>='101A'
                                  AND fmha<='101Z')
                                 OR (fmha>='210A'
                                     AND fmha<='210Z')
                                 OR (fmha>='150A'
                                     AND fmha<='150Z')
                                 OR (fmha>='410A'
                                     AND fmha<='410Z')) THEN 'Receiving'
                       WHEN L16Lcode=3
                            AND mha IN ('13MP', '13MP', '14PP1') THEN 'Verraumung'
                       WHEN L16Lcode=3
                            AND mha IN ('13PL') THEN 'Replenishment Logimat'
                       WHEN L16Lcode=3
                            AND mha IN ('1NBB', '1NBB1', '4NBB', '4NBB1') THEN 'Replenishment to NBB'
                       WHEN L16Lcode=3
                            AND ((fmha>='101A'
                                  AND fmha<='101Z')
                                 OR (fmha>='210A'
                                     AND fmha<='210Z')
                                 OR (fmha>='150A'
                                     AND fmha<='150Z')
                                 OR (fmha>='410A'
                                     AND fmha<='410Z')) THEN 'Putaway'
                       WHEN L16Lcode=29
                            AND admunit IN ('RNBP1', 'RNBP2', 'RNBP3', 'RNBP4') THEN 'Replenishment from NBB'
                       WHEN L16Lcode=26
                            AND ((fmha>='101A'
                                  AND fmha<='101Z')
                                 OR (fmha>='210A'
                                     AND fmha<='210Z')
                                 OR (fmha>='150A'
                                     AND fmha<='150Z')
                                 OR (fmha>='410A'
                                     AND fmha<='410Z')) THEN 'Unloading'
                   END) IN ('Replenishment fullpallet',
                            'Receiving',
                            'Verraumung',
                            'Replenishment Logimat',
                            'Replenishment to NBB',
                            'Putaway',
                            'Replenishment from NBB',
                            'Unloading') THEN 'Inbound'
         END,
         logguser,
         fname,
         lname,
         S90T1.hphone,
         CASE
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND L16T3.frack NOT IN ('014',
                                          '019',
                                          '035',
                                          '039',
                                          '029') THEN 'Picking Automation'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN 'Picking Logimat'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND L16T3.frack IN ('014',
                                      '019',
                                      '035',
                                      '038',
                                      '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

             WHEN l16lcode IN ('4')
                  AND fmha IN ('12P1') THEN 'Picking Conventional'
             WHEN l16lcode IN ('3',
                               '31')
                  AND fmha IN ('12TTR',
                               '12TR') THEN 'Transferrack'
             WHEN L16Lcode=3
                  AND fmha IN ('PCK01',
                               'PCK02',
                               'PCK03',
                               'PCK04',
                               'PCK05',
                               'PCK06',
                               'PCK07',
                               'PCK08',
                               'PCK09',
                               'PCK10',
                               'PCK11',
                               'PCK12')
                  AND mha IN ('PCKRD') THEN 'Packing Conventional'
             WHEN L16Lcode=40
                  AND fmha IN ('19DHL',
                               '20DHL',
                               '21DHL',
                               '22DHL',
                               '23DHL',
                               '24DHL',
                               '25DHL',
                               '26DHL',
                               '27DHL') THEN 'Loading H2'
             WHEN L16Lcode=40
                  AND fmha IN ('30DHL',
                               '31DHL',
                               '32DHL',
                               '33DHL',
                               '34DHL',
                               '35DHL',
                               '36DHL') THEN 'Loading H3'
             WHEN L16Lcode=3
                  AND mha IN ('30DHL',
                              '31DHL',
                              '32DHL',
                              '33DHL',
                              '34DHL',
                              '35DHL',
                              '36DHL') THEN 'filling H3'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH2',
                                   'REPH3',
                                   'REPH4',
                                   'REPMZ') THEN 'Replenishment fullpallet'
             WHEN L16Lcode=1
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Receiving'
             WHEN L16Lcode=3
                  AND mha IN ('13MP',
                              '13MP',
                              '14PP1') THEN 'Verraumung'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN 'Replenishment Logimat'
             WHEN L16Lcode=3
                  AND mha IN ('1NBB',
                              '1NBB1',
                              '4NBB',
                              '4NBB1') THEN 'Replenishment to NBB'
             WHEN L16Lcode=3
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Putaway'
             WHEN L16Lcode=29
                  AND admunit IN ('RNBP1',
                                  'RNBP2',
                                  'RNBP3',
                                  'RNBP4') THEN 'Replenishment from NBB'
             WHEN L16Lcode=26
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Unloading'
         END,
         CASE
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND L16T3.frack NOT IN ('014',
                                          '019',
                                          '035',
                                          '039',
                                          '029') THEN 85
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN 90
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND frack IN ('014',
                                '019',
                                '035',
                                '038',
                                '029') THEN 65 --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 30

             WHEN l16lcode IN ('4')
                  AND fmha IN ('12P1') THEN 30
             WHEN l16lcode IN ('3',
                               '31')
                  AND fmha IN ('12TTR',
                               '12TR') THEN 80
             WHEN L16Lcode=3
                  AND fmha IN ('PCK01',
                               'PCK02',
                               'PCK03',
                               'PCK04',
                               'PCK05',
                               'PCK06',
                               'PCK07',
                               'PCK08',
                               'PCK09',
                               'PCK10',
                               'PCK11',
                               'PCK12')
                  AND mha IN ('PCKRD') THEN 16
             WHEN L16Lcode=40
                  AND fmha IN ('19DHL',
                               '20DHL',
                               '21DHL',
                               '22DHL',
                               '23DHL',
                               '24DHL',
                               '25DHL',
                               '26DHL',
                               '27DHL') THEN 110
             WHEN L16Lcode=40
                  AND fmha IN ('30DHL',
                               '31DHL',
                               '32DHL',
                               '33DHL',
                               '34DHL',
                               '35DHL',
                               '36DHL') THEN 160
             WHEN L16Lcode=3
                  AND mha IN ('30DHL',
                              '31DHL',
                              '32DHL',
                              '33DHL',
                              '34DHL',
                              '35DHL',
                              '36DHL') THEN 300
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH2',
                                   'REPH3',
                                   'REPH4',
                                   'REPMZ') THEN 14
             WHEN L16Lcode=1
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 75
             WHEN L16Lcode=3
                  AND mha IN ('13MP',
                              '13MP',
                              '14PP1') THEN 13
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN 40
             WHEN L16Lcode=3
                  AND mha IN ('1NBB',
                              '1NBB1',
                              '4NBB',
                              '4NBB1') THEN 14
             WHEN L16Lcode=3
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 15
             WHEN L16Lcode=29
                  AND admunit IN ('RNBP1',
                                  'RNBP2',
                                  'RNBP3',
                                  'RNBP4') THEN 16
             WHEN L16Lcode=26
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 110
         END
HAVING CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND L16T3.frack NOT IN ('014',
                                        '019',
                                        '035',
                                        '039',
                                        '029') THEN 'Picking Automation'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN 'Picking Logimat'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP')
                AND L16T3.frack IN ('014',
                                    '019',
                                    '035',
                                    '038',
                                    '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

           WHEN l16lcode IN ('4')
                AND fmha IN ('12P1') THEN 'Picking Conventional'
           WHEN l16lcode IN ('3',
                             '31')
                AND fmha IN ('12TTR',
                             '12TR') THEN 'Transferrack'
           WHEN L16Lcode=3
                AND fmha IN ('PCK01',
                             'PCK02',
                             'PCK03',
                             'PCK04',
                             'PCK05',
                             'PCK06',
                             'PCK07',
                             'PCK08',
                             'PCK09',
                             'PCK10',
                             'PCK11',
                             'PCK12')
                AND mha IN ('PCKRD') THEN 'Packing Conventional'
           WHEN L16Lcode=40
                AND fmha IN ('19DHL',
                             '20DHL',
                             '21DHL',
                             '22DHL',
                             '23DHL',
                             '24DHL',
                             '25DHL',
                             '26DHL',
                             '27DHL') THEN 'Loading H2'
           WHEN L16Lcode=40
                AND fmha IN ('30DHL',
                             '31DHL',
                             '32DHL',
                             '33DHL',
                             '34DHL',
                             '35DHL',
                             '36DHL') THEN 'Loading H3'
           WHEN L16Lcode=3
                AND mha IN ('30DHL',
                            '31DHL',
                            '32DHL',
                            '33DHL',
                            '34DHL',
                            '35DHL',
                            '36DHL') THEN 'filling H3'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH2',
                                 'REPH3',
                                 'REPH4',
                                 'REPMZ') THEN 'Replenishment fullpallet'
           WHEN L16Lcode=1
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Receiving'
           WHEN L16Lcode=3
                AND mha IN ('13MP',
                            '13MP',
                            '14PP1') THEN 'Verraumung'
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN 'Replenishment Logimat'
           WHEN L16Lcode=3
                AND mha IN ('1NBB',
                            '1NBB1',
                            '4NBB',
                            '4NBB1') THEN 'Replenishment to NBB'
           WHEN L16Lcode=3
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Putaway'
           WHEN L16Lcode=29
                AND admunit IN ('RNBP1',
                                'RNBP2',
                                'RNBP3',
                                'RNBP4') THEN 'Replenishment from NBB'
           WHEN L16Lcode=26
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN 'Unloading'
       END IS NOT NULL
ORDER BY CASE
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND L16T3.frack NOT IN ('014',
                                          '019',
                                          '035',
                                          '039',
                                          '029') THEN 'Picking Automation'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN 'Picking Logimat'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP')
                  AND L16T3.frack IN ('014',
                                      '019',
                                      '035',
                                      '038',
                                      '029') THEN 'Picking Sensitive' --WHEN l16lcode IN ('4','31') and fmha in ('12P1','12TTR') THEN 'Picking Conventional'

             WHEN l16lcode IN ('4')
                  AND fmha IN ('12P1') THEN 'Picking Conventional'
             WHEN l16lcode IN ('3',
                               '31')
                  AND fmha IN ('12TTR',
                               '12TR') THEN 'Transferrack'
             WHEN L16Lcode=3
                  AND fmha IN ('PCK01',
                               'PCK02',
                               'PCK03',
                               'PCK04',
                               'PCK05',
                               'PCK06',
                               'PCK07',
                               'PCK08',
                               'PCK09',
                               'PCK10',
                               'PCK11',
                               'PCK12')
                  AND mha IN ('PCKRD') THEN 'Packing Conventional'
             WHEN L16Lcode=40
                  AND fmha IN ('19DHL',
                               '20DHL',
                               '21DHL',
                               '22DHL',
                               '23DHL',
                               '24DHL',
                               '25DHL',
                               '26DHL',
                               '27DHL') THEN 'Loading H2'
             WHEN L16Lcode=40
                  AND fmha IN ('30DHL',
                               '31DHL',
                               '32DHL',
                               '33DHL',
                               '34DHL',
                               '35DHL',
                               '36DHL') THEN 'Loading H3'
             WHEN L16Lcode=3
                  AND mha IN ('30DHL',
                              '31DHL',
                              '32DHL',
                              '33DHL',
                              '34DHL',
                              '35DHL',
                              '36DHL') THEN 'filling H3'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH2',
                                   'REPH3',
                                   'REPH4',
                                   'REPMZ') THEN 'Replenishment fullpallet'
             WHEN L16Lcode=1
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Receiving'
             WHEN L16Lcode=3
                  AND mha IN ('13MP',
                              '13MP',
                              '14PP1') THEN 'Verraumung'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN 'Replenishment Logimat'
             WHEN L16Lcode=3
                  AND mha IN ('1NBB',
                              '1NBB1',
                              '4NBB',
                              '4NBB1') THEN 'Replenishment to NBB'
             WHEN L16Lcode=3
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Putaway'
             WHEN L16Lcode=29
                  AND admunit IN ('RNBP1',
                                  'RNBP2',
                                  'RNBP3',
                                  'RNBP4') THEN 'Replenishment from NBB'
             WHEN L16Lcode=26
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN 'Unloading'
         END