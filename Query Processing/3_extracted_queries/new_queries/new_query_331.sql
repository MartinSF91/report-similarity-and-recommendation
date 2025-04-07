SELECT first_value("T0"."C0") OVER (PARTITION BY "T0"."C1") "StoPal_SumPallVol",
       "T0"."C1" "ArtFea_SupNo"
FROM
  (SELECT sum(("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000) "C0",
          trim(BOTH
               FROM "L62T13"."PARTREV") "C1"
   FROM "G08T1" "G08T1",
        "L62T13"
   WHERE trim(BOTH
              FROM "L62T13"."PARTREV") NOT IN ('02508',
                                               '10000')
     AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
   GROUP BY trim(BOTH
                 FROM "L62T13"."PARTREV")) "T0"