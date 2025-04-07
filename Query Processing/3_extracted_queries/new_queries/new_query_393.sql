SELECT first_value("T0"."C0") OVER (PARTITION BY "T0"."C1", "T0"."C2", "T0"."C3") "VOLUME",
       "T0"."C1" "ArtFea_SupNo",
       "T0"."C2" "StoPal_PallVol",
       "T0"."C3" "StoPal_PallType"
FROM
  (SELECT sum(("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000) "C0",
          trim(BOTH
               FROM "L62T13"."PARTREV") "C1",
          ("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000 "C2",
          "G08T1"."CARRTYPE" "C3"
   FROM "G08T1" "G08T1",
        "L62T13"
   WHERE trim(BOTH
              FROM "L62T13"."PARTREV") NOT IN ('10000')
     AND ("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000>0
     AND "G08T1"."CARRTYPE" IN (0)
     AND "L62T13"."SHORTL62"="G08T1"."SHORTL62"
   GROUP BY trim(BOTH
                 FROM "L62T13"."PARTREV"),
            ("G08T1"."AMOONCR"*"L62T13"."PARTVOL")/1000,
            "G08T1"."CARRTYPE") "T0"