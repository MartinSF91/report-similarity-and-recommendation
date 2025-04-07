SELECT CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP',
                             '13PL') THEN '01Picking Automation'
           WHEN l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('12P1') THEN '02Picking Conventional'
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
                AND mha IN ('PCKRD') THEN '03Packing Conventional'
           WHEN L16Lcode=40
                AND fmha IN ('19HER',
                             '20HER',
                             '21HER',
                             '22HER',
                             '23HER',
                             '24HER',
                             '25HER',
                             '26HER',
                             '27HER') THEN '04Verladung H2 HERMES'
           WHEN L16Lcode=40
                AND fmha IN ('19DHL',
                             '20DHL',
                             '21DHL',
                             '22DHL',
                             '23DHL',
                             '24DHL',
                             '25DHL',
                             '26DHL',
                             '27DHL') THEN '05Verladung H2 DHL'
           WHEN L16Lcode=40
                AND fmha IN ('30HER',
                             '31HER',
                             '32HER',
                             '33HER',
                             '34HER',
                             '35HER',
                             '36HER') THEN '06Verladung H3 HERMES'
           WHEN L16Lcode=40
                AND fmha IN ('30DHL',
                             '31DHL',
                             '32DHL',
                             '33DHL',
                             '34DHL',
                             '35DHL',
                             '36DHL') THEN '07Verladung H3 DHL'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH2') THEN '08Replenishment fullpallet H2'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH3') THEN '09Replenishment fullpallet H3'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH4') THEN '10Replenishment fullpallet H4'
           WHEN L16Lcode=26
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN '11Receive'
           WHEN L16Lcode=3
                AND mha IN ('12P1') THEN '12Putaway full pallet H2'
           WHEN L16Lcode=3
                AND mha IN ('13SP1') THEN '13Putaway shelf/flow H3'
           WHEN L16Lcode=3
                AND mha IN ('13MP') THEN '14Putaway full pallet H3'
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN '15Putaway Logimat H3'
           WHEN L16Lcode=3
                AND mha IN ('13PP1') THEN '16Putaway full pallet H3'
           WHEN L16Lcode=3
                AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN '18Picking Logimat'
           WHEN l16lcode = 3
                AND mha IN ('12TTR')
                AND rack IN ('001') THEN '19Transferregal Infeed'
           WHEN L16Lcode =31
                AND admunit IN ('MOA1',
                                'MOA3',
                                'MOA6',
                                'MOA12',
                                'MOA6M') THEN '20Flow 2 Picking'
           WHEN L16Lcode=3
                AND gadmunit IN ('R15P4',
                                 'R16P4',
                                 'R17P4',
                                 'R25P4',
                                 'R45P4') THEN '20Replenishment shelf'
           WHEN L16Lcode=3
                AND gadmunit IN ('REP29',
                                 'R29R1') THEN '21Replenishment mixpallet'
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
  AND S90T1.hphone IN ('Samson')
GROUP BY logguser,
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
                               '13MP',
                               '13PL') THEN '01Picking Automation'
             WHEN l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('12P1') THEN '02Picking Conventional'
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
                  AND mha IN ('PCKRD') THEN '03Packing Conventional'
             WHEN L16Lcode=40
                  AND fmha IN ('19HER',
                               '20HER',
                               '21HER',
                               '22HER',
                               '23HER',
                               '24HER',
                               '25HER',
                               '26HER',
                               '27HER') THEN '04Verladung H2 HERMES'
             WHEN L16Lcode=40
                  AND fmha IN ('19DHL',
                               '20DHL',
                               '21DHL',
                               '22DHL',
                               '23DHL',
                               '24DHL',
                               '25DHL',
                               '26DHL',
                               '27DHL') THEN '05Verladung H2 DHL'
             WHEN L16Lcode=40
                  AND fmha IN ('30HER',
                               '31HER',
                               '32HER',
                               '33HER',
                               '34HER',
                               '35HER',
                               '36HER') THEN '06Verladung H3 HERMES'
             WHEN L16Lcode=40
                  AND fmha IN ('30DHL',
                               '31DHL',
                               '32DHL',
                               '33DHL',
                               '34DHL',
                               '35DHL',
                               '36DHL') THEN '07Verladung H3 DHL'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH2') THEN '08Replenishment fullpallet H2'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH3') THEN '09Replenishment fullpallet H3'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH4') THEN '10Replenishment fullpallet H4'
             WHEN L16Lcode=26
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN '11Receive'
             WHEN L16Lcode=3
                  AND mha IN ('12P1') THEN '12Putaway full pallet H2'
             WHEN L16Lcode=3
                  AND mha IN ('13SP1') THEN '13Putaway shelf/flow H3'
             WHEN L16Lcode=3
                  AND mha IN ('13MP') THEN '14Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN '15Putaway Logimat H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PP1') THEN '16Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN '18Picking Logimat'
             WHEN l16lcode = 3
                  AND mha IN ('12TTR')
                  AND rack IN ('001') THEN '19Transferregal Infeed'
             WHEN L16Lcode =31
                  AND admunit IN ('MOA1',
                                  'MOA3',
                                  'MOA6',
                                  'MOA12',
                                  'MOA6M') THEN '20Flow 2 Picking'
             WHEN L16Lcode=3
                  AND gadmunit IN ('R15P4',
                                   'R16P4',
                                   'R17P4',
                                   'R25P4',
                                   'R45P4') THEN '20Replenishment shelf'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REP29',
                                   'R29R1') THEN '21Replenishment mixpallet'
         END
HAVING CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP',
                             '13PL') THEN '01Picking Automation'
           WHEN l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('12P1') THEN '02Picking Conventional'
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
                AND mha IN ('PCKRD') THEN '03Packing Conventional'
           WHEN L16Lcode=40
                AND fmha IN ('19HER',
                             '20HER',
                             '21HER',
                             '22HER',
                             '23HER',
                             '24HER',
                             '25HER',
                             '26HER',
                             '27HER') THEN '04Verladung H2 HERMES'
           WHEN L16Lcode=40
                AND fmha IN ('19DHL',
                             '20DHL',
                             '21DHL',
                             '22DHL',
                             '23DHL',
                             '24DHL',
                             '25DHL',
                             '26DHL',
                             '27DHL') THEN '05Verladung H2 DHL'
           WHEN L16Lcode=40
                AND fmha IN ('30HER',
                             '31HER',
                             '32HER',
                             '33HER',
                             '34HER',
                             '35HER',
                             '36HER') THEN '06Verladung H3 HERMES'
           WHEN L16Lcode=40
                AND fmha IN ('30DHL',
                             '31DHL',
                             '32DHL',
                             '33DHL',
                             '34DHL',
                             '35DHL',
                             '36DHL') THEN '07Verladung H3 DHL'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH2') THEN '08Replenishment fullpallet H2'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH3') THEN '09Replenishment fullpallet H3'
           WHEN L16Lcode=3
                AND gadmunit IN ('REPH4') THEN '10Replenishment fullpallet H4'
           WHEN L16Lcode=26
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')) THEN '11Receive'
           WHEN L16Lcode=3
                AND mha IN ('12P1') THEN '12Putaway full pallet H2'
           WHEN L16Lcode=3
                AND mha IN ('13SP1') THEN '13Putaway shelf/flow H3'
           WHEN L16Lcode=3
                AND mha IN ('13MP') THEN '14Putaway full pallet H3'
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN '15Putaway Logimat H3'
           WHEN L16Lcode=3
                AND mha IN ('13PP1') THEN '16Putaway full pallet H3'
           WHEN L16Lcode=3
                AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN '18Picking Logimat'
           WHEN l16lcode = 3
                AND mha IN ('12TTR')
                AND rack IN ('001') THEN '19Transferregal Infeed'
           WHEN L16Lcode =31
                AND admunit IN ('MOA1',
                                'MOA3',
                                'MOA6',
                                'MOA12',
                                'MOA6M') THEN '20Flow 2 Picking'
           WHEN L16Lcode=3
                AND gadmunit IN ('R15P4',
                                 'R16P4',
                                 'R17P4',
                                 'R25P4',
                                 'R45P4') THEN '20Replenishment shelf'
           WHEN L16Lcode=3
                AND gadmunit IN ('REP29',
                                 'R29R1') THEN '21Replenishment mixpallet'
       END IS NOT NULL
ORDER BY CASE
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP',
                               '13PL') THEN '01Picking Automation'
             WHEN l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('12P1') THEN '02Picking Conventional'
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
                  AND mha IN ('PCKRD') THEN '03Packing Conventional'
             WHEN L16Lcode=40
                  AND fmha IN ('19HER',
                               '20HER',
                               '21HER',
                               '22HER',
                               '23HER',
                               '24HER',
                               '25HER',
                               '26HER',
                               '27HER') THEN '04Verladung H2 HERMES'
             WHEN L16Lcode=40
                  AND fmha IN ('19DHL',
                               '20DHL',
                               '21DHL',
                               '22DHL',
                               '23DHL',
                               '24DHL',
                               '25DHL',
                               '26DHL',
                               '27DHL') THEN '05Verladung H2 DHL'
             WHEN L16Lcode=40
                  AND fmha IN ('30HER',
                               '31HER',
                               '32HER',
                               '33HER',
                               '34HER',
                               '35HER',
                               '36HER') THEN '06Verladung H3 HERMES'
             WHEN L16Lcode=40
                  AND fmha IN ('30DHL',
                               '31DHL',
                               '32DHL',
                               '33DHL',
                               '34DHL',
                               '35DHL',
                               '36DHL') THEN '07Verladung H3 DHL'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH2') THEN '08Replenishment fullpallet H2'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH3') THEN '09Replenishment fullpallet H3'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REPH4') THEN '10Replenishment fullpallet H4'
             WHEN L16Lcode=26
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')) THEN '11Receive'
             WHEN L16Lcode=3
                  AND mha IN ('12P1') THEN '12Putaway full pallet H2'
             WHEN L16Lcode=3
                  AND mha IN ('13SP1') THEN '13Putaway shelf/flow H3'
             WHEN L16Lcode=3
                  AND mha IN ('13MP') THEN '14Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN '15Putaway Logimat H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PP1') THEN '16Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN '18Picking Logimat'
             WHEN l16lcode = 3
                  AND mha IN ('12TTR')
                  AND rack IN ('001') THEN '19Transferregal Infeed'
             WHEN L16Lcode =31
                  AND admunit IN ('MOA1',
                                  'MOA3',
                                  'MOA6',
                                  'MOA12',
                                  'MOA6M') THEN '20Flow 2 Picking'
             WHEN L16Lcode=3
                  AND gadmunit IN ('R15P4',
                                   'R16P4',
                                   'R17P4',
                                   'R25P4',
                                   'R45P4') THEN '20Replenishment shelf'
             WHEN L16Lcode=3
                  AND gadmunit IN ('REP29',
                                   'R29R1') THEN '21Replenishment mixpallet'
         END,
         logguser