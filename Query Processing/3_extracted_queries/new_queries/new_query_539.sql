SELECT TRUNC(cast("G32T1"."STATDATE" AS TIMESTAMP(9))) "Datum",
       SUBSTR("G30T1"."DELID", 13, 4) "LSC_Nummer",
       CASE
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='586 ' THEN 'Rhenus Saarbrucken'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='587 ' THEN 'Rhenus Ginsheim'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='588 ' THEN 'Rhenus Hannover'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='582' THEN 'Rhenus Freiburg'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='590 ' THEN 'Roth Lampertswalde'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1005' THEN 'Roth Glesien'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1006' THEN 'Roth Weida'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1007' THEN 'Roth Erfurt'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1008' THEN 'Roth Elchingen'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1009' THEN 'Roth Ludwigsburg'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1504' THEN 'Sedilog Kassel'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1881' THEN 'Sedilog Hilchenbach Musen'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1516' THEN 'JCL Castrop-Rauxel'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1525' THEN 'JCL Heinsberg'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1503' THEN 'Rhenus Dusseldorf'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1526' THEN 'JCL Koln'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='1889' THEN 'Rhenus Hockenheim'
           WHEN SUBSTR("G30T1"."DELID", 13, 4)='2599' THEN 'Gebr. Weiß Leverkusen'
           ELSE SUBSTR("G30T1"."DELID", 13, 4)
       END "Provider_Ort",
       trim(BOTH
            FROM "L62T14"."PARTNO") "ARTNo",
       "L62T14"."PARTDSC1" "ARTName",
       "G32T1"."G32STAT" "RctHea_DelStat",
       "G32T1"."SUBDELID" "RctHea_Delid",
       sum("G36T15"."DELQUANT") "Geliefert"
FROM "G32T1" "G32T1",
     "G30T1" "G30T1",
     "L62T14",
     "G36T15"
WHERE "G32T1"."G32STAT" IN (40)
  AND LOWER ("G32T1"."SUBDELID") like CASE
                                          WHEN LOWER ('LSC') IS NULL THEN NULL
                                          ELSE '%' || LOWER ('LSC') || '%'
                                      END
  AND TRUNC(cast("G32T1"."STATDATE" AS TIMESTAMP(9))) BETWEEN DATE '2025-03-26' AND DATE '2025-03-26'
  AND LOWER (SUBSTR("G30T1"."DELID", 13, 4)) like CASE
                                                      WHEN LOWER ('0') IS NULL THEN NULL
                                                      ELSE '%' || LOWER ('0') || '%'
                                                  END
  AND "G30T1"."SHORTG30"="G32T1"."SHORTG30"
  AND "G32T1"."SHORTG32"="G36T15"."SHORTG32"
  AND "G36T15"."SHORTL62"="L62T14"."SHORTL62"
GROUP BY TRUNC(cast("G32T1"."STATDATE" AS TIMESTAMP(9))),
         SUBSTR("G30T1"."DELID", 13, 4),
         CASE
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='586 ' THEN 'Rhenus Saarbrucken'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='587 ' THEN 'Rhenus Ginsheim'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='588 ' THEN 'Rhenus Hannover'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='582' THEN 'Rhenus Freiburg'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='590 ' THEN 'Roth Lampertswalde'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1005' THEN 'Roth Glesien'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1006' THEN 'Roth Weida'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1007' THEN 'Roth Erfurt'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1008' THEN 'Roth Elchingen'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1009' THEN 'Roth Ludwigsburg'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1504' THEN 'Sedilog Kassel'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1881' THEN 'Sedilog Hilchenbach Musen'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1516' THEN 'JCL Castrop-Rauxel'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1525' THEN 'JCL Heinsberg'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1503' THEN 'Rhenus Dusseldorf'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1526' THEN 'JCL Koln'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='1889' THEN 'Rhenus Hockenheim'
             WHEN SUBSTR("G30T1"."DELID", 13, 4)='2599' THEN 'Gebr. Weiß Leverkusen'
             ELSE SUBSTR("G30T1"."DELID", 13, 4)
         END,
         trim(BOTH
              FROM "L62T14"."PARTNO"),
         "L62T14"."PARTDSC1",
         "G32T1"."G32STAT",
         "G32T1"."SUBDELID"