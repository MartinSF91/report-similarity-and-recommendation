SELECT DISTINCT b.l54uniq,
                b.admunit,
                O40T2.ecarrno,
                L16T3.l48boxid,
                O40T2.ocarrtyp,
                L54T1.admunit "_HauptQueue",

  (SELECT genref
   FROM O40T2 d
   WHERE O40T2.icarrno = d.ocarrno) "_HauptBox",

  (SELECT ecarrno
   FROM O40T2 d
   WHERE O40T2.icarrno = d.ocarrno) "_HauptPalette:",
                O40T2.location,
                L54T1.priority,
                R08T1.shortr08,
                R08T1.pickdate,
                tripstat
FROM O40T2
LEFT JOIN L54T1 ON O40T2.icarrno = L54T1.l54gr2
LEFT JOIN G08T1 ON O40T2.ecarrno = G08T1.ecarrno
LEFT JOIN R08T1 ON O40T2.shortr08 = R08T1.shortr08
LEFT JOIN O42T2 ON O42T2.ocarrno = O40T2.ocarrno
LEFT JOIN L54T1 b ON O40T2.ocarrno = b.ocarrno
LEFT JOIN L16T3 ON O40T2.ecarrno = L16T3.ecarrno
AND l16lcode = 16
WHERE --(location = 'AGP' or location = '55OUT')AND
 O40T2.ocarrtyp = 'AGP'
  AND L54T1.l54type = 16 --AND l54state != 8

  AND L54T1.l54gr1 = 'C'
  AND (b.admunit = 'AGP'
       OR b.admunit = 'DUM'
       OR b.admunit = 'AGPTL'
       OR b.admunit = 'AGPST')
GROUP BY O40T2.ocarrno,
         O40T2.location,
         G08T1.rack,
         G08T1.horcoor,
         G08T1.vercoor,
         O40T2.weight,
         O40T2.carrvol,
         L54T1.priority,
         R08T1.shortr08,
         R08T1.pickdate,
         b.l54uniq,
         L54T1.admunit,
         L54T1.l54state,
         L54T1.l54gr1,
         O40T2.icarrno,
         O40T2.ocarrtyp,
         b.l54uniq,
         b.admunit,
         O40T2.ecarrno,
         L16T3.l48boxid,
         tripstat
ORDER BY R08T1.pickdate,
         6,
         2