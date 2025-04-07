SELECT "T0"."C0" "StoPal_SumPallVol",
       "T0"."C1" "StoPal_MHA",
       "T0"."C2" "ArtFea_SupNo"
FROM
  (SELECT sum(("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000) "C0",
          trim(BOTH
               FROM "G08T1"."MHA") "C1",
          trim(BOTH
               FROM "L62T13"."PARTREV") "C2",
          min(trim(BOTH
                   FROM "G08T1"."MHA")) "C3"
   FROM "G08T1" "G08T1",
        "L62T13"
   WHERE trim(BOTH
              FROM "L62T13"."PARTREV") NOT IN ('02508',
                                               '10000')
     AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
   GROUP BY trim(BOTH
                 FROM "G08T1"."MHA"),
            trim(BOTH
                 FROM "L62T13"."PARTREV")
   HAVING min(trim(BOTH
                   FROM "G08T1"."MHA")) IN ('57R1')
   AND (min(trim(BOTH
                 FROM "G08T1"."MHA")) IN ('54%E',
                                          '54%F',
                                          '54%G')
        OR min(trim(BOTH
                    FROM "G08T1"."MHA")) NOT IN ('54RE%'))) "T0"