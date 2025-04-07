
SELECT "T0"."C0" "WhsLoc_MhaName",
       "T0"."C1" "WhsLoc_PlaceCount",
       "T0"."C2" "WhsLoc_Status",
       "T0"."C1" "Summe_WhsLoc_PlaceCount_"
FROM
  (SELECT trim(BOTH
               FROM "L30T1"."MHA") "C0",
          count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                       FROM "L30T1"."VERCOOR"))) "C1",
          "L30T1"."LOCSTAT" "C2"
   FROM "L30T1" "L30T1"
   WHERE trim(BOTH
              FROM "L30T1"."MHA") IN ('52R1',
                                      '53R1',
                                      '54R1',
                                      '56R1',
                                      '56R2',
                                      '52P1',
                                      '52P2',
                                      '52P3',
                                      '52P4',
                                      '53P1',
                                      '54P1',
                                      '54P2',
                                      '56P1',
                                      '56P2',
                                      '56P3')
     AND "L30T1"."LOCSTAT" IN (4,
                               6,
                               8,
                               12,
                               14)
   GROUP BY trim(BOTH
                 FROM "L30T1"."MHA"),
            "L30T1"."LOCSTAT") "T0"