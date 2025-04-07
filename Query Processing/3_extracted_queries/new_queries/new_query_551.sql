SELECT TO_CHAR(O06T1.deldate, 'dd.mm.yy')"DelDate", --O06T1.deldate,
 L16T3.logguser,
 COUNT(DISTINCT CASE
                    WHEN L16T3.fmha IN ('13PL')
                         AND L16T3.l16lcode = 4 THEN L16T3.l16seqno
                END)"_gepickt letzte Std.",
 COUNT(DISTINCT CASE
                    WHEN L16T3.fmha IN ('13TL', '13TP', '13TFS')
                         AND L16T3.l16lcode = 3
                         AND L16T3.mha IN ('13PL') THEN L16T3.l16seqno
                END)"_verraumt letzte Std." --COUNT(DISTINCT CASE WHEN O08T1.linestat NOT IN ('0','7','6','5') AND L62T1.pmha IN ('13PL') AND TRUNC(O06T1.deldate) = TRUNC(sysdate) THEN O08T1.shorto08 END)"_OL offen heute"

FROM L16T3
LEFT JOIN O08T1 ON L16T3.shorto08 = O08T1.shorto08
LEFT JOIN O06T1 ON O08T1.ordno = O06T1.ordno
LEFT JOIN L62T1 ON O08T1.shortl62 = L62T1.shortl62
WHERE L16T3.datreg >= (sysdate-1/24) -- letzte Stunde

GROUP BY O06T1.deldate,
         L16T3.logguser
HAVING O06T1.deldate IS NOT NULL
AND (COUNT(DISTINCT CASE
                        WHEN L16T3.fmha IN ('13PL')
                             AND L16T3.l16lcode = 4 THEN L16T3.l16seqno
                    END) >0)
OR (COUNT(DISTINCT CASE
                       WHEN L16T3.fmha IN ('13TL', '13TP', '13TFS')
                            AND L16T3.l16lcode = 3
                            AND L16T3.mha IN ('13PL') THEN L16T3.l16seqno
                   END) > 0)