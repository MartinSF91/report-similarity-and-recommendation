SELECT TRIM(l62t1.partno) partno,
       TRIM(l62t1.partrev) partrev,
       l62t1.shortl62,
       TRIM(ecarrno) Package_ID,
       amooncr "_Qty. in St.Unit",
       MHA,
       rack,
       horcoor,
       vercoor,
       ldct,
       statdate
FROM ast052.l62t1
INNER JOIN ast052.g08t1 ON l62t1.shortl62=g08t1.shortl62
WHERE MHA IN ('1TEMP',
              '13INV',
              '13I1',
              '1YL',
              '13Q1',
              '13D1')
  AND g08t1.carrstat = '6'
ORDER BY MHA