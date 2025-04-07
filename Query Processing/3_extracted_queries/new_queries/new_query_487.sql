
SELECT "T0"."C0" "IMH_Frklft",
       "T0"."C1" "c2",
       "T0"."C2" "IMH_LoggUser",
       "T0"."C3" "IMH_LoggCode",
       "T0"."C4" "c5",
       "T0"."C5" "IMH_ToDestType",
       "T0"."C6" "Crane"
FROM
  (SELECT "L16T3"."L46ADR" "C0",
          CASE
              WHEN "L16T3"."L46ADR"=101 THEN 'Crane 01 - 001/002'
              WHEN "L16T3"."L46ADR"=102 THEN 'Crane 02 - 003/004'
              WHEN "L16T3"."L46ADR"=103 THEN 'Crane 03 - 005/006'
              WHEN "L16T3"."L46ADR"=104 THEN 'Crane 04 - 007/008'
              WHEN "L16T3"."L46ADR"=105 THEN 'Crane 05 - 009/010'
              WHEN "L16T3"."L46ADR"=106 THEN 'Crane 06 - 011/012'
              WHEN "L16T3"."L46ADR"=107 THEN 'Crane 07 - 013/014'
              WHEN "L16T3"."L46ADR"=108 THEN 'Crane 08 - 015/016'
              WHEN "L16T3"."L46ADR"=109 THEN 'Crane 09 - 017/018'
              WHEN "L16T3"."L46ADR"=110 THEN 'Crane 10 - 019/020'
              WHEN "L16T3"."L46ADR"=111 THEN 'Crane 11 - 021/022'
              WHEN "L16T3"."L46ADR"=112 THEN 'Crane 12 - 023/024'
              WHEN "L16T3"."L46ADR"=113 THEN 'Crane 13 - 025/026'
              WHEN "L16T3"."L46ADR"=114 THEN 'Crane 14 - 027/028'
              WHEN "L16T3"."L46ADR"=115 THEN 'Crane 15 - 029/030'
              WHEN "L16T3"."L46ADR"=116 THEN 'Crane 16 - 031/032'
          END "C1",
          "L16T3"."LOGGUSER" "C2",
          "L16T3"."L16LCODE" "C3",
          CASE
              WHEN "L16T3"."L54MOVET"=16 THEN 'Back'
              WHEN "L16T3"."L54MOVET"=6
                   OR "L16T3"."L54MOVET"=7 THEN 'Full'
              WHEN "L16T3"."L54MOVET"=3 THEN 'Repl.'
              WHEN "L16T3"."L54MOVET"=9
                   OR "L16T3"."L54MOVET"=0
                   OR "L16T3"."L54MOVET"=4 THEN 'Resto.'
              WHEN "L16T3"."L54MOVET"=1
                   OR "L16T3"."L54MOVET"=10 THEN 'Store'
          END "C4",
          "L16T3"."L54MOVET" "C5",
          count("L16T3"."L16SEQNO") "C6",
          min("L16T3"."L54MOVET") "C7"
   FROM "L16T3" "L16T3"
   WHERE "L16T3"."L46ADR" BETWEEN 101 AND 116
     AND "L16T3"."LOGGUSER" IN ('L79CRAN1')
     AND "L16T3"."L16LCODE" IN (3)
     AND "L16T3"."DATREG">=CAST((:PQ2) AS TIMESTAMP)
     AND "L16T3"."DATREG"<=CAST((:PQ1) AS TIMESTAMP)
   GROUP BY "L16T3"."L46ADR",
            CASE
                WHEN "L16T3"."L46ADR"=101 THEN 'Crane 01 - 001/002'
                WHEN "L16T3"."L46ADR"=102 THEN 'Crane 02 - 003/004'
                WHEN "L16T3"."L46ADR"=103 THEN 'Crane 03 - 005/006'
                WHEN "L16T3"."L46ADR"=104 THEN 'Crane 04 - 007/008'
                WHEN "L16T3"."L46ADR"=105 THEN 'Crane 05 - 009/010'
                WHEN "L16T3"."L46ADR"=106 THEN 'Crane 06 - 011/012'
                WHEN "L16T3"."L46ADR"=107 THEN 'Crane 07 - 013/014'
                WHEN "L16T3"."L46ADR"=108 THEN 'Crane 08 - 015/016'
                WHEN "L16T3"."L46ADR"=109 THEN 'Crane 09 - 017/018'
                WHEN "L16T3"."L46ADR"=110 THEN 'Crane 10 - 019/020'
                WHEN "L16T3"."L46ADR"=111 THEN 'Crane 11 - 021/022'
                WHEN "L16T3"."L46ADR"=112 THEN 'Crane 12 - 023/024'
                WHEN "L16T3"."L46ADR"=113 THEN 'Crane 13 - 025/026'
                WHEN "L16T3"."L46ADR"=114 THEN 'Crane 14 - 027/028'
                WHEN "L16T3"."L46ADR"=115 THEN 'Crane 15 - 029/030'
                WHEN "L16T3"."L46ADR"=116 THEN 'Crane 16 - 031/032'
            END,
            "L16T3"."LOGGUSER",
            "L16T3"."L16LCODE",
            CASE
                WHEN "L16T3"."L54MOVET"=16 THEN 'Back'
                WHEN "L16T3"."L54MOVET"=6
                     OR "L16T3"."L54MOVET"=7 THEN 'Full'
                WHEN "L16T3"."L54MOVET"=3 THEN 'Repl.'
                WHEN "L16T3"."L54MOVET"=9
                     OR "L16T3"."L54MOVET"=0
                     OR "L16T3"."L54MOVET"=4 THEN 'Resto.'
                WHEN "L16T3"."L54MOVET"=1
                     OR "L16T3"."L54MOVET"=10 THEN 'Store'
            END,
            "L16T3"."L54MOVET"
   HAVING min("L16T3"."L54MOVET") NOT IN (0,
                                          4)) "T0"