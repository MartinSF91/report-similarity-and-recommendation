SELECT l16.l16seqno,
       l16.pickrno,
       TO_CHAR(l16.datreg, 'mm/dd/yyyy HH24:MI:SS') datreg,
       CASE
           WHEN l16.l16lcode = 4
                AND TRIM(l16.routeno) = 'PARCEL' THEN CASE
                                                          WHEN TRIM(l16.admunit) = 'F-M7' THEN 'M7'
                                                          WHEN TRIM(l16.admunit) = 'F-X4' THEN 'X4'
                                                          ELSE TRIM(l16.admunit)
                                                      END
           WHEN l16.l16lcode != 4
                AND TRIM(l16.routeno) = 'PARCEL' THEN '2583'
           ELSE TRIM(l16.routeno)
       END routeno, --l16.admunit,
CASE
    WHEN TRIM(l16.partno)= 'packed goods' THEN o08.partrev
    ELSE l16.partrev
                                  END partrev,
                                  l16.ecarrno,
                                  l16.l16lcode,
                                  l16.l54movet,
                                  l16.l16lcode||l16.l54movet||l16.l16destc AS "_Function",
                                  l16.ocarrno,
                                  l16.ordtype,
                                  l16.l46adr,
                                  l16.divcode,
                                  l16.fmha,
                                  l16.frack,
                                  l16.fhorcoor,
                                  l16.fvercoor,
                                  l16.mha,
                                  l16.rack,
                                  l16.horcoor,
                                  l16.vercoor,
                                  CASE
                                      WHEN l16.l16lcode = 4
                                           AND substr(l16.admunit, 1, 3) = 'O15' THEN 1
                                      WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('333') THEN CASE
                                                                                                        WHEN l16.l16qty = l62.cquant THEN 1
                                                                                                        ELSE l16.l16qty
                                                                                                    END
                                      WHEN l16.l16qty = 0 THEN 1 --Added this line 12/20/2023

                                      ELSE l16.l16qty
                                  END AS l16qty,
                                  CASE
                                      WHEN TRIM(l16.partno)= 'packed goods' THEN o08.partno
                                      ELSE l16.partno
                                  END AS partno,
                                  CASE
                                      WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('2600',
                                                                                        '4000',
                                                                                        '4600',
                                                                                        '6100') THEN (o40.carrvol/1000*35.3146667)
                                      WHEN l16.l16lcode||l16.l54movet||l16.l16destc NOT IN ('2600',
                                                                                            '4000',
                                                                                            '4600',
                                                                                            '6100') THEN ROUND(((o08.realvol/1000)*35.3146667)/o08.reqquant, 4)
                                      ELSE ROUND(((l16.l16vol/1000)*35.3146667)/l16.l16qty, 4)
                                  END AS "L16VOL", --Converting to cubic feet (single article)
CASE
    WHEN l16.l16lcode||l16.l54movet||l16.l16destc IN ('2600',
                                                      '4000',
                                                      '4600',
                                                      '6100') THEN (o40.weight*2.204623)
    WHEN l16.l16lcode||l16.l54movet||l16.l16destc NOT IN ('2600',
                                                          '4000',
                                                          '4600',
                                                          '6100') THEN ROUND((o08.realwght*2.204623)/o08.reqquant, 4)
    ELSE ROUND((l16.l16wght*2.204623)/l16.l16qty, 4)
                                                                                              END AS "L16WGHT", --Converting to pounds (single article)
CASE
    WHEN LENGTH(TRIM(s90.uname))=5 THEN substr(TRIM(s90.uname), 2, 4)
    ELSE TRIM(s90.uname)
                                                                                                                                                       END AS logguser, -- Added Logic to remove leading "A" 3/19/2024
l16.x08seqno,
                                                                                                                                                                                                                      l16.shorto08,
                                                                                                                                                                                                                      l16.shortl62,
                                                                                                                                                                                                                      l16.carrno,
                                                                                                                                                                                                                      l16.shortr08,
                                                                                                                                                                                                                      CASE
                                                                                                                                                                                                                          WHEN l16.l16lcode||l16.l54movet||l16.l16destc = 331 THEN NULL
                                                                                                                                                                                                                          ELSE CASE
                                                                                                                                                                                                                                   WHEN l16.l16lcode = 46 THEN 'PACK'
                                                                                                                                                                                                                                   WHEN TRIM(l16.fmha) LIKE 'INH' THEN NULL
                                                                                                                                                                                                                                   WHEN TRIM(l16.fmha) LIKE '11%' THEN NULL
                                                                                                                                                                                                                                   WHEN TRIM(l16.fmha) LIKE 'L49%' THEN NULL
                                                                                                                                                                                                                                   ELSE NULL
                                                                                                                                                                                                                               END||TRIM(l16.frack)||TRIM(l16.fhorcoor)||TRIM(l16.fvercoor)
                                                                                                                                                                                                                      END AS "_Source_Storage_Bin",
                                                                                                                                                                                                                      CASE
                                                                                                                                                                                                                          WHEN l16.l48pickl = l16.l48donel
                                                                                                                                                                                                                               AND l16.l16lcode = 4 THEN l16.emha
                                                                                                                                                                                                                          ELSE CASE -- Hard Code the Check & Pack staging locations

                                                                                                                                                                                                                                   WHEN TRIM(l16.mha) LIKE 'YL' THEN '420A'
                                                                                                                                                                                                                                   WHEN TRIM(l16.mha) LIKE 'LSC' THEN '201A'
                                                                                                                                                                                                                                   WHEN TRIM(l16.mha) LIKE '11%' THEN NULL
                                                                                                                                                                                                                                   WHEN TRIM(l16.mha) LIKE 'L49%' THEN NULL
                                                                                                                                                                                                                                   ELSE NULL
                                                                                                                                                                                                                               END||TRIM(l16.rack)||TRIM(l16.horcoor)||TRIM(l16.vercoor)
                                                                                                                                                                                                                      END AS "_Destination_Storage_Bin"
FROM ast051.ASTRO_VIEW_CNT_SVL16001 l16
INNER JOIN ast051.s90t1 s90 ON l16.logguser = s90.uname
FULL OUTER JOIN ast051.l62t1 l62 ON l62.shortl62 = l16.shortl62
FULL OUTER JOIN ast051.o08t1 o08 ON l16.shorto08 = o08.shorto08
FULL OUTER JOIN ast051.o40t2 o40 ON l16.ocarrno = o40.ocarrno
WHERE l16.datreg >= sysdate - .25
  AND l16.l16qty >= 0 --AND s90.address1 IN ('A','B','C','D','Temp')
AND TRIM(s90.uname) NOT IN ('KEMA',
                            'YOGA',
                            'GEBI')
  AND s90.utype = 9
  AND l16.fmha NOT LIKE 'L49MB'
  AND l16.l16lcode||l16.l54movet||l16.l16destc IN ('100',
                                                   '310',
                                                   '311',
                                                   '330',
                                                   '331',
                                                   '333',
                                                   '390',
                                                   '391',
                                                   '393',
                                                   '400',
                                                   '2600',
                                                   '3100',
                                                   '4000',
                                                   '4600')
ORDER BY datreg DESC