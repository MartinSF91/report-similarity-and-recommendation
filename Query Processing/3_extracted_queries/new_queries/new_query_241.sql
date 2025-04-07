SELECT CASE
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP',
                             '13PL')
                AND frack NOT IN ('014',
                                  '019',
                                  '029',
                                  '035',
                                  '037') THEN '01Picking Automation'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('14PP1',
                             '13PP1',
                             '13SP1',
                             '13MP',
                             '13PL')
                AND frack IN ('014',
                              '019',
                              '029',
                              '035',
                              '037') THEN '01Picking Sensitive' --WHEN l16lcode = 4 and l16qty > 0  and fmha in ('12P1') THEN '02Picking Conventional'

           WHEN l16lcode IN ('4')
                AND fmha IN ('12P1') THEN '02Picking Conventional'
           WHEN l16lcode IN ('31')
                AND fmha IN ('12TTR') THEN '02Picking aus Transfer'
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
                AND gadmunit IN ('REPH3',
                                 'REPMZ') THEN '09Replenishment fullpallet H3'
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
                AND mha IN ('13MP',
                            '13PP1') THEN '14Putaway full pallet H3'
           WHEN L16Lcode=3
                AND mha IN ('13PL') THEN '15Putaway Logimat H3' --WHEN L16Lcode=3 and mha in ('13PP1')  THEN '16Putaway full pallet H3'

           WHEN L16Lcode=3
                AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
           WHEN l46adr < 3000
                AND l46adr > 2000
                AND l16lcode = 4
                AND l16qty > 0
                AND fmha IN ('13PL') THEN '18Picking Logimat'
           WHEN l16lcode = 3
                AND mha IN ('12TTR') THEN '19Transferregal'
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
           WHEN L16Lcode=3
                AND mha IN ('1NBB',
                            '1NBB1',
                            '4NBB',
                            '4NBB1') THEN '22Replenishment NBB'
           WHEN L16Lcode=3
                AND gadmunit IN ('RNBH1',
                                 'RNBH4') THEN '23PickRun NBB'
           WHEN L16Lcode=3
                AND ((fmha>='101A'
                      AND fmha<='101Z')
                     OR (fmha>='210A'
                         AND fmha<='210Z')
                     OR (fmha>='150A'
                         AND fmha<='150Z')
                     OR (fmha>='410A'
                         AND fmha<='410Z')
                     OR (fmha IN('11D1',
                                 'NEW'))) THEN '24Putaway vom Gate'
           WHEN L16Lcode=29 THEN '25Split' --WHEN L16Lcode=29  and fmha in ('1NBB','1NBB1','4NBB','4NBB1') THEN '25Split NBB'

           WHEN L16Lcode=3
                AND fmha IN ('3WAND',
                             '4WAND') THEN '26 RULA'
           WHEN L16Lcode = 1
                AND fmha IN ('HM') THEN '27 HM Receiced'
           WHEN L16Lcode = 3
                AND MHA IN ('HMR') THEN '28 HM Putaway'
           WHEN L16Lcode = 3
                AND FMHA IN ('HMR')
                AND MHA IN ('CFP') THEN '29 HM ausgelagert'
       END "_Halle         ",
       logguser,
       fname,
       lname,
       COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '14:00'
                      AND to_char(datreg, 'hh24:mi') <= '22:00' THEN l16seqno
             END)"_Spatschicht",
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
       S90T1.hphone, --COUNT(distinct l16seqno)"ALL"
 SUM(CASE
         WHEN l46adr < 3000
              AND l46adr > 2000
              AND l16lcode = 4
              AND l16qty > 0
              AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP', '13PL')
              AND frack IN ('014', '019', '029', '035', '037') THEN L16T3.l16qty
     END)"_Stuck sensitive",
 ROUND(SUM(CASE
               WHEN l46adr < 3000
                    AND l46adr > 2000
                    AND l16lcode = 4
                    AND l16qty > 0
                    AND fmha IN ('14PP1', '13PP1', '13SP1', '13MP', '13PL')
                    AND frack IN ('014', '019', '029', '035', '037') THEN L16T3.l16qty
           END)/COUNT(DISTINCT L16T3.l16seqno), 2)"_Stuck pro Pick"
FROM L16T3
LEFT JOIN S90T1 ON S90T1.uname = L16T3.logguser --(Select L16T3.*,t1.o40type from  L16T3 left join (select ecarrno,o40type from O40T2)t1 on L16T3.ecarrno=t1.ecarrno)t

WHERE datreg >= (sysdate-16/24)
  AND logguser NOT IN ('L79CRANE')
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
                               '13PL')
                  AND frack NOT IN ('014',
                                    '019',
                                    '029',
                                    '035',
                                    '037') THEN '01Picking Automation'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP',
                               '13PL')
                  AND frack IN ('014',
                                '019',
                                '029',
                                '035',
                                '037') THEN '01Picking Sensitive' --WHEN l16lcode = 4 and l16qty > 0  and fmha in ('12P1') THEN '02Picking Conventional'

             WHEN l16lcode IN ('4')
                  AND fmha IN ('12P1') THEN '02Picking Conventional'
             WHEN l16lcode IN ('31')
                  AND fmha IN ('12TTR') THEN '02Picking aus Transfer'
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
                  AND gadmunit IN ('REPH3',
                                   'REPMZ') THEN '09Replenishment fullpallet H3'
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
                  AND mha IN ('13MP',
                              '13PP1') THEN '14Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN '15Putaway Logimat H3' --WHEN L16Lcode=3 and mha in ('13PP1')  THEN '16Putaway full pallet H3'

             WHEN L16Lcode=3
                  AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN '18Picking Logimat'
             WHEN l16lcode = 3
                  AND mha IN ('12TTR') THEN '19Transferregal'
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
             WHEN L16Lcode=3
                  AND mha IN ('1NBB',
                              '1NBB1',
                              '4NBB',
                              '4NBB1') THEN '22Replenishment NBB'
             WHEN L16Lcode=3
                  AND gadmunit IN ('RNBH1',
                                   'RNBH4') THEN '23PickRun NBB'
             WHEN L16Lcode=3
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')
                       OR (fmha IN('11D1',
                                   'NEW'))) THEN '24Putaway vom Gate'
             WHEN L16Lcode=29 THEN '25Split' --WHEN L16Lcode=29  and fmha in ('1NBB','1NBB1','4NBB','4NBB1') THEN '25Split NBB'

             WHEN L16Lcode=3
                  AND fmha IN ('3WAND',
                               '4WAND') THEN '26 RULA'
             WHEN L16Lcode = 1
                  AND fmha IN ('HM') THEN '27 HM Receiced'
             WHEN L16Lcode = 3
                  AND MHA IN ('HMR') THEN '28 HM Putaway'
             WHEN L16Lcode = 3
                  AND FMHA IN ('HMR')
                  AND MHA IN ('CFP') THEN '29 HM ausgelagert'
         END
HAVING COUNT(CASE
                 WHEN to_char(datreg, 'hh24:mi') >= '14:00'
                      AND to_char(datreg, 'hh24:mi') <= '22:00' THEN l16seqno
             END) > 0
AND CASE
        WHEN l46adr < 3000
             AND l46adr > 2000
             AND l16lcode = 4
             AND l16qty > 0
             AND fmha IN ('14PP1',
                          '13PP1',
                          '13SP1',
                          '13MP',
                          '13PL')
             AND frack NOT IN ('014',
                               '019',
                               '029',
                               '035',
                               '037') THEN '01Picking Automation'
        WHEN l46adr < 3000
             AND l46adr > 2000
             AND l16lcode = 4
             AND l16qty > 0
             AND fmha IN ('14PP1',
                          '13PP1',
                          '13SP1',
                          '13MP',
                          '13PL')
             AND frack IN ('014',
                           '019',
                           '029',
                           '035',
                           '037') THEN '01Picking Sensitive' --WHEN l16lcode = 4 and l16qty > 0  and fmha in ('12P1') THEN '02Picking Conventional'

        WHEN l16lcode IN ('4')
             AND fmha IN ('12P1') THEN '02Picking Conventional'
        WHEN l16lcode IN ('31')
             AND fmha IN ('12TTR') THEN '02Picking aus Transfer'
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
             AND gadmunit IN ('REPH3',
                              'REPMZ') THEN '09Replenishment fullpallet H3'
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
             AND mha IN ('13MP',
                         '13PP1') THEN '14Putaway full pallet H3'
        WHEN L16Lcode=3
             AND mha IN ('13PL') THEN '15Putaway Logimat H3' --WHEN L16Lcode=3 and mha in ('13PP1')  THEN '16Putaway full pallet H3'

        WHEN L16Lcode=3
             AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
        WHEN l46adr < 3000
             AND l46adr > 2000
             AND l16lcode = 4
             AND l16qty > 0
             AND fmha IN ('13PL') THEN '18Picking Logimat'
        WHEN l16lcode = 3
             AND mha IN ('12TTR') THEN '19Transferregal'
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
        WHEN L16Lcode=3
             AND mha IN ('1NBB',
                         '1NBB1',
                         '4NBB',
                         '4NBB1') THEN '22Replenishment NBB'
        WHEN L16Lcode=3
             AND gadmunit IN ('RNBH1',
                              'RNBH4') THEN '23PickRun NBB'
        WHEN L16Lcode=3
             AND ((fmha>='101A'
                   AND fmha<='101Z')
                  OR (fmha>='210A'
                      AND fmha<='210Z')
                  OR (fmha>='150A'
                      AND fmha<='150Z')
                  OR (fmha>='410A'
                      AND fmha<='410Z')
                  OR (fmha IN('11D1',
                              'NEW'))) THEN '24Putaway vom Gate'
        WHEN L16Lcode=29 THEN '25Split' --WHEN L16Lcode=29  and fmha in ('1NBB','1NBB1','4NBB','4NBB1') THEN '25Split NBB'

        WHEN L16Lcode=3
             AND fmha IN ('3WAND',
                          '4WAND') THEN '26 RULA'
        WHEN L16Lcode = 1
             AND fmha IN ('HM') THEN '27 HM Receiced'
        WHEN L16Lcode = 3
             AND MHA IN ('HMR') THEN '28 HM Putaway'
        WHEN L16Lcode = 3
             AND FMHA IN ('HMR')
             AND MHA IN ('CFP') THEN '29 HM ausgelagert'
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
                               '13PL')
                  AND frack NOT IN ('014',
                                    '019',
                                    '029',
                                    '035',
                                    '037') THEN '01Picking Automation'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('14PP1',
                               '13PP1',
                               '13SP1',
                               '13MP',
                               '13PL')
                  AND frack IN ('014',
                                '019',
                                '029',
                                '035',
                                '037') THEN '01Picking Sensitive' --WHEN l16lcode = 4 and l16qty > 0  and fmha in ('12P1') THEN '02Picking Conventional'

             WHEN l16lcode IN ('4')
                  AND fmha IN ('12P1') THEN '02Picking Conventional'
             WHEN l16lcode IN ('31')
                  AND fmha IN ('12TTR') THEN '02Picking aus Transfer'
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
                  AND gadmunit IN ('REPH3',
                                   'REPMZ') THEN '09Replenishment fullpallet H3'
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
                  AND mha IN ('13MP',
                              '13PP1') THEN '14Putaway full pallet H3'
             WHEN L16Lcode=3
                  AND mha IN ('13PL') THEN '15Putaway Logimat H3' --WHEN L16Lcode=3 and mha in ('13PP1')  THEN '16Putaway full pallet H3'

             WHEN L16Lcode=3
                  AND mha IN ('14PP1') THEN '17Putaway full pallet H4'
             WHEN l46adr < 3000
                  AND l46adr > 2000
                  AND l16lcode = 4
                  AND l16qty > 0
                  AND fmha IN ('13PL') THEN '18Picking Logimat'
             WHEN l16lcode = 3
                  AND mha IN ('12TTR') THEN '19Transferregal'
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
             WHEN L16Lcode=3
                  AND mha IN ('1NBB',
                              '1NBB1',
                              '4NBB',
                              '4NBB1') THEN '22Replenishment NBB'
             WHEN L16Lcode=3
                  AND gadmunit IN ('RNBH1',
                                   'RNBH4') THEN '23PickRun NBB'
             WHEN L16Lcode=3
                  AND ((fmha>='101A'
                        AND fmha<='101Z')
                       OR (fmha>='210A'
                           AND fmha<='210Z')
                       OR (fmha>='150A'
                           AND fmha<='150Z')
                       OR (fmha>='410A'
                           AND fmha<='410Z')
                       OR (fmha IN('11D1',
                                   'NEW'))) THEN '24Putaway vom Gate'
             WHEN L16Lcode=29 THEN '25Split' --WHEN L16Lcode=29  and fmha in ('1NBB','1NBB1','4NBB','4NBB1') THEN '25Split NBB'

             WHEN L16Lcode=3
                  AND fmha IN ('3WAND',
                               '4WAND') THEN '26 RULA'
             WHEN L16Lcode = 1
                  AND fmha IN ('HM') THEN '27 HM Receiced'
             WHEN L16Lcode = 3
                  AND MHA IN ('HMR') THEN '28 HM Putaway'
             WHEN L16Lcode = 3
                  AND FMHA IN ('HMR')
                  AND MHA IN ('CFP') THEN '29 HM ausgelagert'
         END,
         logguser