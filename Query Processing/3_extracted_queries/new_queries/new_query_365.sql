
SELECT "T0"."C0" "StoPal_MHA",
       "T0"."C1" "StoPal_Pallid",
       "T0"."C2" "StoPal_PallClass",
       "T0"."C3" "Datenelement1",
       "T0"."C4" "Datenelement2",
       "T0"."C5" "StoPal_PallQty",
       "T0"."C4" "Summe_Datenelement2_"
FROM
  (SELECT trim(BOTH
               FROM "G08T1"."MHA") "C0",
          "G08T1"."ECARRNO" "C1",
          "G08T1"."LDCT" "C2",
          SUBSTR("G08T1"."LDCT", 1, 1) "C3",
          count("G08T1"."ECARRNO") "C4",
          "G08T1"."AMOONCR" "C5",
          min(SUBSTR("G08T1"."LDCT", 1, 1)) "C6"
   FROM "G08T1" "G08T1"
   WHERE "G08T1"."AMOONCR">0
     AND trim(BOTH
              FROM "G08T1"."MHA") NOT IN ('BPICK',
                                          'HM',
                                          'L49M5',
                                          'L49MB',
                                          'MWPP1',
                                          'OUTML',
                                          'QC1',
                                          'REJ0',
                                          'REJ5',
                                          'RPACK',
                                          'TEST',
                                          'UNPCK',
                                          '5002',
                                          '54P0',
                                          '54RE5',
                                          '54RE6',
                                          '55TRA')
   GROUP BY trim(BOTH
                 FROM "G08T1"."MHA"),
            "G08T1"."ECARRNO",
            "G08T1"."LDCT",
            SUBSTR("G08T1"."LDCT", 1, 1),
            "G08T1"."AMOONCR"
   HAVING min(SUBSTR("G08T1"."LDCT", 1, 1)) IN ('E',
                                                'I',
                                                'O',
                                                'L')) "T0"