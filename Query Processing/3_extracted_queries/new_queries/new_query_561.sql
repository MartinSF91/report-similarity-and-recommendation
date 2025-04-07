/* This SQL returns a list of all StUnits aging in Damage MHAs for SD (DC 019)*/
SELECT l62.divcode "DC",
       To_Char(g08.statdate, 'MM/DD/YYYY HH:MM:SS AM')"Status Date",
       round((SYSDATE-g08.statdate)*24, 0) "Aging Hours",
       g08.mha AS "MHA",
       CASE
           WHEN g08.rack IN ' ' THEN g08.mha
           ELSE g08.rack || '-' || g08.horcoor || '-' || g08.vercoor
       END AS "Location",
       TRIM(g08.ecarrno) AS "Package ID",
       TRIM(l62.partno) AS "Article",
       TRIM(l62.partrev) AS "Revision",
       g08.amooncr "Qty",
       CASE
           WHEN g08.amooncr = l62.cquant THEN 'Full'
           WHEN g08.amooncr > l62.cquant THEN 'Full +'
           WHEN g08.carrtype = 9 THEN '-'
           ELSE 'Partial'
       END "Full / Partial",
       l62.cquant "FPQ",
       CASE
           WHEN g08.avail = 1 THEN 'Yes'
           ELSE 'No'
       END AS "Available",
       TO_CHAR(g08.lockcode) "Block Code",
       CASE
           WHEN g08.reserved = 1 THEN 'Yes'
           ELSE 'No'
       END AS "Reserved",
       TRIM(l54.mha) "To MHA", --l54.l54state,
 g08.ldct AS "LdCT",
 substr(g08.ldct, 1, 1) "Pallet Class", --l629.panum "_PA #",
 substr(l629.panum, 1, 2) "HFB",
 CASE
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%01' THEN 'Living room seating'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%03' THEN 'Workspaces'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%06' THEN 'Bathroom'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%07' THEN 'Kitchen'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%08' THEN 'Dining'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%10' THEN 'Lighting'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%12' THEN 'Home textiles'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%13' THEN 'Rugs'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%14' THEN 'Cooking'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%15' THEN 'Eating'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%16' THEN 'Decoration'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%18' THEN 'Home organisation'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%20' THEN 'Other business opportunities'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%50' THEN 'Home electronics'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%70' THEN 'Home Appliances'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%96' THEN 'IKEA Food'
     ELSE 'UNDEF'
 END "HFB Definition",
 CASE
     WHEN dwpcp.numcp > 1 THEN 'Yes'
     ELSE 'No'
 END "Multi-box?",
 dwpcp.numcp "Num PCS",
 round((CASE
            WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol / 1000
            ELSE dwpact.scnetvol
        END)/1000, 4) "Unit Net Volume",
 round(g08.amooncr * (CASE
                          WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol / 1000
                          ELSE dwpact.scnetvol
                      END)/ 1000, 4) "Net Volume",
 l62.wmha "Buffer MHA",
 TRIM(l62.pmha) "Pick MHA",
 TRIM(l62.pzone) "Pick Zone",
 TRIM(g08.carrno) AS "Carrno",
 TRIM(to_char(l62.shortL62)) "Short L62",
 TO_NUMBER(TO_CHAR(TO_DATE('1', 'J')+(SYSDATE - g08.statdate), 'J') - 1) "Days Aging" --l62.partdsc1 AS "_Descr 1"

FROM ast019.g08t1 g08
LEFT JOIN ast019.l54t1 l54 ON l54.carrno = g08.carrno
AND l54.regdate =
  (SELECT MAX(regdate)
   FROM ast019.l54t1
   WHERE carrno = g08.carrno
     AND regdate <= g08.statdate)
LEFT JOIN ast019.l62t1 l62 ON l62.shortl62 = g08.shortl62
LEFT JOIN ast019.l00t1 l00 ON l00.mha = g08.mha
INNER JOIN ast019.g08t90 g089 ON (g089.carrno = g08.carrno)
INNER JOIN ast019.dwpkey dwpk ON (g089.shortdwp = dwpk.shortdwp)
INNER JOIN ast019.dwpactcp dwpcp ON (dwpk.itemno = dwpcp.itemno
                                     AND dwpk.bucodsup = dwpcp.bucodsup
                                     AND dwpk.fpacdate = dwpcp.fpacdate
                                     AND dwpk.reqdwpno = dwpcp.reqdwpno
                                     AND dwpk.reqdwped = dwpcp.reqdwped)
INNER JOIN ast019.dwpact dwpact ON (dwpk.itemno = dwpact.itemno
                                    AND dwpk.bucodsup = dwpact.bucodsup
                                    AND dwpk.fpacdate = dwpact.fpacdate
                                    AND dwpk.reqdwpno = dwpact.reqdwpno
                                    AND dwpk.reqdwped = dwpact.reqdwped)
INNER JOIN ast019.dwpactul dwpul ON (dwpk.itemno = dwpul.itemno
                                     AND dwpk.bucodsup = dwpul.bucodsup
                                     AND dwpk.fpacdate = dwpul.fpacdate
                                     AND dwpk.reqdwpno = dwpul.reqdwpno
                                     AND dwpk.reqdwped = dwpul.reqdwped)
INNER JOIN ast019.l62t99 l629 ON l629.partno = l62.partno
AND l629.partrev = l62.partrev
AND l629.divcode = l62.divcode
WHERE l62.divcode = 019
  AND g08.carrtype = 0
  AND g08.carrstat = 6
  AND g08.mha IN ('13CDD',
                  '11DPK',
                  '11DIN',
                  '11DOT',
                  '13RBX',
                  '13OUT',
                  '11RBX',
                  '13DIN',
                  '13DPK',
                  '13APP')
  AND g08.amooncr != 0
  AND -- g08.statdate <= SYSDATE - 0.9
 g08.statdate <= SYSDATE - 0.041
GROUP BY l62.divcode,
         g08.statdate,
         round((SYSDATE-g08.statdate)*24, 0),
         g08.mha,
         CASE
             WHEN g08.rack IN ' ' THEN g08.mha
             ELSE g08.rack || '-' || g08.horcoor || '-' || g08.vercoor
         END,
         TRIM(g08.ecarrno),
         TRIM(l62.partno),
         TRIM(l62.partrev),
         g08.amooncr,
         CASE
             WHEN g08.amooncr = l62.cquant THEN 'Full'
             WHEN g08.amooncr > l62.cquant THEN 'Full +'
             WHEN g08.carrtype = 9 THEN '-'
             ELSE 'Partial'
         END,
         l62.cquant,
         CASE
             WHEN g08.avail = 1 THEN 'Yes'
             ELSE 'No'
         END,
         TO_CHAR(g08.lockcode),
         CASE
             WHEN g08.reserved = 1 THEN 'Yes'
             ELSE 'No'
         END,
         TRIM(l54.mha), --l54.l54state,
 g08.ldct,
 substr(g08.ldct, 1, 1),
 substr(l629.panum, 1, 2),
 CASE
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%01' THEN 'Living room seating'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%02' THEN 'Store and organise furniture'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%03' THEN 'Workspaces'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%04' THEN 'Bedroom furniture'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%05' THEN 'Beds & Mattresses'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%06' THEN 'Bathroom'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%07' THEN 'Kitchen'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%08' THEN 'Dining'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%09' THEN 'Children´s IKEA'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%10' THEN 'Lighting'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%11' THEN 'Bed and bath textiles'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%12' THEN 'Home textiles'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%13' THEN 'Rugs'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%14' THEN 'Cooking'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%15' THEN 'Eating'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%16' THEN 'Decoration'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%17' THEN 'Outdoor & Secondary storage'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%18' THEN 'Home organisation'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%20' THEN 'Other business opportunities'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%50' THEN 'Home electronics'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%70' THEN 'Home Appliances'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%94' THEN 'Administrative Area 94'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%95' THEN 'Administrative Area 95'
     WHEN SUBSTR(l629.panum, 1, 2) LIKE '%96' THEN 'IKEA Food'
     ELSE 'UNDEF'
 END,
 CASE
     WHEN dwpcp.numcp > 1 THEN 'Yes'
     ELSE 'No'
 END,
 dwpcp.numcp,
 round((CASE
            WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol / 1000
            ELSE dwpact.scnetvol
        END)/1000, 4),
 round(g08.amooncr * (CASE
                          WHEN l62.partunit = 'CMT' THEN dwpact.scnetvol / 1000
                          ELSE dwpact.scnetvol
                      END)/ 1000, 4),
 l62.wmha,
 TRIM(l62.pmha),
 TRIM(l62.pzone),
 TRIM(g08.carrno),
 TRIM(to_char(l62.shortL62)),
 TO_NUMBER(TO_CHAR(TO_DATE('1', 'J')+(SYSDATE - g08.statdate), 'J') - 1)
ORDER BY g08.statdate ASC