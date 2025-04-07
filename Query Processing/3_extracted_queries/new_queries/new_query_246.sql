SELECT DISTINCT -- SPEDITION & EQUIPMENT
  YMT11T1.carrier,
  YMT11T1.lutype, -- ZAHLUNG
  SUM(CASE
          WHEN YMT11T1.lustatus = '1'
               AND YMT11T1.lublockc > '0' THEN 1
          ELSE 0
      END) "_Def Empty",
  SUM(CASE
          WHEN YMT11T1.lustatus IN ('10', '20', '30')
               AND YMT11T1.lublockc > '0' THEN 1
          ELSE 0
      END) "_Def Full",
  SUM(CASE
          WHEN YMT11T1.lustatus IN ('10', '20', '30')
               AND YMT11T1.lublockc < '1' THEN 1
          ELSE 0
      END) - CASE
                 WHEN (d."_COUNT") IS NULL THEN 0
                 ELSE d."_COUNT"
             END "_Inb Full",
             SUM(CASE
                     WHEN YMT11T1.lustatus = '1'
                          AND YMT11T1.lublockc < '1' THEN 1
                     ELSE 0
                 END) + CASE
                            WHEN (d."_COUNT") IS NULL THEN 0
                            ELSE d."_COUNT"
                        END "_Empty",
                        CASE
                            WHEN a."_Load yesterday" > '0' THEN (SUM (CASE
                                                                          WHEN YMT11T1.lustatus IN ('50',
                                                                                                    '60',
                                                                                                    '70')
                                                                               AND YMT11T1.lublockc < '1' THEN 1
                                                                          ELSE 0
                                                                      END) - CASE
                                                                                 WHEN (a."_Load yesterday") IS NULL THEN 0
                                                                                 ELSE a."_Load yesterday"
                                                                             END) + coalesce(c."_Pl Empty today add", 0)
                            ELSE (SUM (CASE
                                           WHEN YMT11T1.lustatus IN ('50',
                                                                     '60',
                                                                     '70')
                                                AND YMT11T1.lublockc < '1' THEN 1
                                           ELSE 0
                                       END) + CASE
                                                  WHEN (c."_Pl Empty today add") IS NULL THEN 0
                                                  ELSE c."_Pl Empty today add"
                                              END)
                        END AS "_Pl Empty",
                        SUM(CASE
                                WHEN YMT11T1.lustatus = '1'
                                     AND YMT11T1.lublockc < '1' THEN 1
                                ELSE 0
                            END) + CASE
                                       WHEN (d."_COUNT") IS NULL THEN 0
                                       ELSE d."_COUNT"
                                   END + CASE
                                             WHEN a."_Load yesterday" > '0' THEN (SUM (CASE
                                                                                           WHEN YMT11T1.lustatus IN ('50',
                                                                                                                     '60',
                                                                                                                     '70')
                                                                                                AND YMT11T1.lublockc < '1' THEN 1
                                                                                           ELSE 0
                                                                                       END) - CASE
                                                                                                  WHEN (a."_Load yesterday") IS NULL THEN 0
                                                                                                  ELSE a."_Load yesterday"
                                                                                              END) + coalesce(c."_Pl Empty today add", 0)
                                             ELSE (SUM (CASE
                                                            WHEN YMT11T1.lustatus IN ('50',
                                                                                      '60',
                                                                                      '70')
                                                                 AND YMT11T1.lublockc < '1' THEN 1
                                                            ELSE 0
                                                        END) + CASE
                                                                   WHEN (c."_Pl Empty today add") IS NULL THEN 0
                                                                   ELSE c."_Pl Empty today add"
                                                               END)
                                         END AS "_All Empty",
                                         b."_Pl Empty today",
                                         CASE
                                             WHEN a."_Load yesterday" IS NULL THEN 0
                                             ELSE a."_Load yesterday"
                                         END "_Load yesterday", -- SUMME
  SUM(CASE
          WHEN YMT11T1.lustatus = '1'
               AND YMT11T1.lublockc > '0' THEN 1
          ELSE 0
      END) + SUM(CASE
                     WHEN YMT11T1.lustatus IN ('10', '20', '30')
                          AND YMT11T1.lublockc > '0' THEN 1
                     ELSE 0
                 END) + SUM(CASE
                                WHEN YMT11T1.lustatus IN ('10', '20', '30')
                                     AND YMT11T1.lublockc < '1' THEN 1
                                ELSE 0
                            END) - CASE
                                       WHEN (d."_COUNT") IS NULL THEN 0
                                       ELSE d."_COUNT"
                                   END + SUM(CASE
                                                 WHEN YMT11T1.lustatus = '1'
                                                      AND YMT11T1.lublockc < '1' THEN 1
                                                 ELSE 0
                                             END) + CASE
                                                        WHEN (d."_COUNT") IS NULL THEN 0
                                                        ELSE d."_COUNT"
                                                    END + CASE
                                                              WHEN a."_Load yesterday" > '0' THEN (SUM (CASE
                                                                                                            WHEN YMT11T1.lustatus IN ('50',
                                                                                                                                      '60',
                                                                                                                                      '70')
                                                                                                                 AND YMT11T1.lublockc < '1' THEN 1
                                                                                                            ELSE 0
                                                                                                        END) - CASE
                                                                                                                   WHEN (a."_Load yesterday") IS NULL THEN 0
                                                                                                                   ELSE a."_Load yesterday"
                                                                                                               END)
                                                              ELSE (SUM (CASE
                                                                             WHEN YMT11T1.lustatus IN ('50',
                                                                                                       '60',
                                                                                                       '70')
                                                                                  AND YMT11T1.lublockc < '1' THEN 1
                                                                             ELSE 0
                                                                         END) + CASE
                                                                                    WHEN (c."_Pl Empty today add") IS NULL THEN 0
                                                                                    ELSE c."_Pl Empty today add"
                                                                                END)
                                                          END + COALESCE(a."_Load yesterday", 0) AS "_Summe",
                                                                d."_COUNT" -- DATABASE TABLE

FROM YMT11T1
LEFT OUTER JOIN -- JOIN FUR SPALTE LOAD YESTERDAY

  (SELECT DISTINCT YMT10T1.reqowner,
                   YMT10T1.reqlutyp,
                   delstat,
                   to_number(COUNT (DISTINCT YMT10T1.reqeluid)) "_Load yesterday"
   FROM YMT10T1
   JOIN YMT11T1 ON YMT10T1.reqeluid = YMT11T1.eluid
   JOIN YMH12T1 ON YMT10T1.cnsid = YMH12T1.cnsid
   WHERE YMH12T1.delstat IN ('20')
     AND YMT11T1.lustatus = '70'
     AND TRUNC(YMT10T1.expgh) < substr(sysdate, 1, 10)
   GROUP BY delstat,
            YMT10T1.reqowner,
            YMT10T1.reqlutyp)a ON a.reqowner||a.reqlutyp = YMT11T1.carrier||YMT11T1.lutype -- JOIN FUR SPALTE PLANNED EMPTY TODAY

LEFT OUTER JOIN
  (SELECT carrier,
          reqlutyp,
          CASE
              WHEN reqlutyp IN ('S45',
                                'S50') THEN count(eshpid)
              ELSE count(DISTINCT eshpid)
          END"_Pl Empty today"
   FROM
     (SELECT DISTINCT YMH12T1.cnsid,
                      YMH12T1.eshpid,
                      YMH12T1.extshpid,
                      YMT10T1.reqeluid,
                      YMT10T1.reqlutyp,
                      YMH12T1.inout,
                      YMH12T1.delstat,
                      YMT10T1.expgh,
                      YMH12T1.arrivtim,
                      YMH12T1.identnum,
                      YMH12T1.carrier,
                      YMT10T1.exphnd,
                      YMT10T1.acthnd,
                      YMT10T1.reqwdrv,
                      YMH12T1.nrdydock,
                      YMT10T1.reqcustc,
                      YMT10T1.frcdeloc,
                      YMT10T1.frcdelst,
                      YMH12T1.wmsref,
                      YMH12T1.prilevco,
                      YMH12T1.connote,
                      YMH12T1.trsource,
                      YMH12T1.mancre,
                      YMH12T1.concre,
                      YMH12T1.shpcre,
                      YMH12T1.shpfr,
                      YMH12T1.shpto,
                      YMH12T1.consfr,
                      YMH12T1.consto,
                      YMH12T1.desttxt,
                      YMH12T1.cnstype,
                      YMH12T1.plansdt,
                      YMH12T1.planedt,
                      YMH12T1.ltrepsta,
                      YMH12T1.ltrepdat,
                      YMH12T1.ymextref,
                      YMH12T1.regdate,
                      YMH12T1.upddate,
                      YMH12T1.trdest,
                      YMH12T1.trdocrdy,
                      YMH12T1.prtseqno,
                      YMH12T1.eqinfsnt,
                      YMH12T1.etractid,
        (SELECT count(*)
         FROM YMH12T1 H,
              YMT10T1 T
         WHERE H.cnsid=T.cnsid
           AND NOT T.iluid = 0
           AND H.eshpid = YMH12T1.eshpid),YMT10T1.ilucid,
                                          YMT10T1.iluid,
                                          YMT10T1.reqowner,
                                          YMT10T1.traeluid
      FROM YMH12T1,
           YMT10T1
      WHERE YMH12T1.cnsid = YMT10T1.cnsid)
   WHERE TRUNC(expgh) = TRUNC(sysdate)
     AND delstat != 0
     AND INOUT = 1
     AND cnsid not LIKE '%SUP%'
   GROUP BY carrier,
            reqlutyp)b ON YMT11T1.carrier||YMT11T1.lutype = b.carrier||b.reqlutyp -- JOIN FUR SPALTE PLANNED EMPTY TODAY add

LEFT OUTER JOIN
  (SELECT carrier,
          reqlutyp,
          CASE
              WHEN reqlutyp IN ('S45',
                                'S50') THEN count(eshpid)
              ELSE count(DISTINCT eshpid)
          END"_Pl Empty today add"
   FROM
     (SELECT DISTINCT YMH12T1.cnsid,
                      YMH12T1.eshpid,
                      YMH12T1.extshpid,
                      YMT10T1.reqeluid,
                      YMT10T1.reqlutyp,
                      YMH12T1.inout,
                      YMH12T1.delstat,
                      YMT10T1.expgh,
                      YMH12T1.arrivtim,
                      YMH12T1.identnum,
                      YMH12T1.carrier,
                      YMT10T1.exphnd,
                      YMT10T1.acthnd,
                      YMT10T1.reqwdrv,
                      YMH12T1.nrdydock,
                      YMT10T1.reqcustc,
                      YMT10T1.frcdeloc,
                      YMT10T1.frcdelst,
                      YMH12T1.wmsref,
                      YMH12T1.prilevco,
                      YMH12T1.connote,
                      YMH12T1.trsource,
                      YMH12T1.mancre,
                      YMH12T1.concre,
                      YMH12T1.shpcre,
                      YMH12T1.shpfr,
                      YMH12T1.shpto,
                      YMH12T1.consfr,
                      YMH12T1.consto,
                      YMH12T1.desttxt,
                      YMH12T1.cnstype,
                      YMH12T1.plansdt,
                      YMH12T1.planedt,
                      YMH12T1.ltrepsta,
                      YMH12T1.ltrepdat,
                      YMH12T1.ymextref,
                      YMH12T1.regdate,
                      YMH12T1.upddate,
                      YMH12T1.trdest,
                      YMH12T1.trdocrdy,
                      YMH12T1.prtseqno,
                      YMH12T1.eqinfsnt,
                      YMH12T1.etractid,
        (SELECT count(*)
         FROM YMH12T1 H,
              YMT10T1 T
         WHERE H.cnsid=T.cnsid
           AND NOT T.iluid = 0
           AND H.eshpid = YMH12T1.eshpid),YMT10T1.ilucid,
                                          YMT10T1.iluid,
                                          YMT10T1.reqowner,
                                          YMT10T1.traeluid
      FROM YMH12T1,
           YMT10T1
      WHERE YMH12T1.cnsid = YMT10T1.cnsid)
   WHERE TRUNC(expgh) = TRUNC(sysdate)
     AND delstat = 30
     AND INOUT = 1
     AND cnsid not LIKE '%SUP%'
   GROUP BY carrier,
            reqlutyp)c ON YMT11T1.carrier||YMT11T1.lutype = c.carrier||c.reqlutyp
LEFT OUTER JOIN
  (SELECT YMH12T1.carrier,
          YMT10T1.reqlutyp,
          SUM(CASE
                  WHEN arrivtim < expgh
                       AND YMH12T1.cnsid LIKE '%CNS%'
                       AND sysdate >= YMT10T1.expgh+1 THEN 1
                  ELSE 0
              END) + SUM(CASE
                             WHEN arrivtim < expgh
                                  AND YMH12T1.cnsid NOT LIKE '%CNS%'
                                  AND TRUNC(sysdate) > TRUNC(YMT10T1.expgh) THEN 1
                             ELSE 0
                         END)"_COUNT",
          SUM(CASE
                  WHEN arrivtim < expgh
                       AND YMH12T1.cnsid LIKE '%CNS%'
                       AND sysdate >= YMT10T1.expgh+1 THEN 1
                  ELSE 0
              END)"_Empty plus inb. full minus",
          SUM(CASE
                  WHEN arrivtim < expgh
                       AND YMH12T1.cnsid NOT LIKE '%CNS%'
                       AND TRUNC(sysdate) > TRUNC(YMT10T1.expgh) THEN 1
                  ELSE 0
              END)"_Empty plus inb. full minus2"
   FROM YMH12T1,
        YMT10T1
   WHERE YMH12T1.cnsid = YMT10T1.cnsid
     AND INOUT = 0
     AND delstat = 20
   GROUP BY YMH12T1.carrier,
            YMT10T1.reqlutyp)d ON YMT11T1.carrier||YMT11T1.lutype = d.carrier||d.reqlutyp -- GLOBALE BEDINGUNG

WHERE YMT11T1.seccONtr = 0
  AND withdrv = 0 -- GRUPPIERUNG

GROUP BY YMT11T1.carrier,
         YMT11T1.lutype,
         a."_Load yesterday",
         b."_Pl Empty today",
         c."_Pl Empty today add",
         d."_COUNT"