
SELECT trim(x08.partno)||'-'||trim(x08.partrev) artsup,
       x08.divcode,
       x08.logguser,
       x08.x08rcode,
       CASE
           WHEN x08.x08rcode IN (437,
                                 440,
                                 460) THEN 'Gross (+)'
           WHEN x08.x08rcode IN (457,
                                 441,
                                 461) THEN 'Gross (-)'
           WHEN x08.x08rcode IN (390,
                                 391,
                                 392,
                                 393,
                                 394) THEN 'Damages'
           WHEN x08.x08rcode IN (313) THEN 'Re-label (-)'
           WHEN x08.x08rcode IN (314) THEN 'Re-label (+)'
           WHEN x08.x08rcode IN (308) THEN 'Indelivery Corrections (+)'
           WHEN x08.x08rcode IN (318) THEN 'Indelivery Corrections (-)'
           WHEN x08.x08rcode IN (435) THEN 'Merge'
           WHEN x08.x08rcode IN (455) THEN 'Merge'
           WHEN x08.x08rcode IN (316) THEN 'Discontinued (UTG)'
           WHEN x08.x08rcode IN (320) THEN 'Shipping Correction (+)'
           WHEN x08.x08rcode IN (321) THEN 'Shipping Correction (-)'
           WHEN x08.x08rcode IN ('305') THEN 'Recovery'
           ELSE 'Unknown'
       END "Adjustment",
       TO_CHAR(x08.datreg, 'MM/DD/YYYY hh:mm:ss AM') "Date",
       TO_CHAR(x08.datreg+1, 'IW') "Week",
       SUM(x08.x08quant) qty,
       SUM(x08.x08seqno) x08seqno /* COUNT(x08.x08seqno) adjcnt */
FROM x08t3 x08
WHERE x08.x08rcode IN (440,
                       437,
                       460,
                       450,
                       441,
                       457,
                       461,
                       451)
  AND x08.divcode IN ('345',
                      '532',
                      '017',
                      '019',
                      '490',
                      '460',
                      '061')
  AND x08.x08quant != 0
  AND x08.datreg >=
    (SELECT next_day(trunc(sysdate), 'Sondag') - 14 datstart
     FROM DUAL)
  AND x08.datreg <
    (SELECT next_day(trunc(sysdate), 'Sondag') - 7 datend
     FROM DUAL)
GROUP BY trim(x08.partno)||'-'||trim(x08.partrev),
         x08.divcode,
         x08.x08rcode,
         x08.logguser,
         CASE
             WHEN x08.x08rcode IN (437,
                                   440,
                                   460) THEN 'Gross (+)'
             WHEN x08.x08rcode IN (457,
                                   441,
                                   461) THEN 'Gross (-)'
             WHEN x08.x08rcode IN (390,
                                   391,
                                   392,
                                   393,
                                   394) THEN 'Damages'
             WHEN x08.x08rcode IN (313) THEN 'Re-label (-)'
             WHEN x08.x08rcode IN (314) THEN 'Re-label (+)'
             WHEN x08.x08rcode IN (308) THEN 'Indelivery Corrections (+)'
             WHEN x08.x08rcode IN (318) THEN 'Indelivery Corrections (-)'
             WHEN x08.x08rcode IN (435) THEN 'Merge'
             WHEN x08.x08rcode IN (455) THEN 'Merge'
             WHEN x08.x08rcode IN (316) THEN 'Discontinued (UTG)'
             WHEN x08.x08rcode IN (320) THEN 'Shipping Correction (+)'
             WHEN x08.x08rcode IN (321) THEN 'Shipping Correction (-)'
             WHEN x08.x08rcode IN (305) THEN 'Recovery'
             ELSE 'Unknown'
         END,
         TO_CHAR(x08.datreg, 'MM/DD/YYYY hh:mm:ss AM'),
         TO_CHAR(x08.datreg+1, 'IW')