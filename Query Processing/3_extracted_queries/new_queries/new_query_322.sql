/* user=Jhanvi Nandani reportPath= report= queryName=Tejon-Functions REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=jC9jh2d9qjGy8s4jhvl8jMswv9v24442GhddCdyw */ WITH "SQL8" AS
  (SELECT "SQL8"."Date" AS "Date",
          "SQL8"."Function" AS "Function",
          "SQL8"."User" AS "User",
          "SQL8"."F Name" AS "F Name",
          "SQL8"."L Name" AS "L Name",
          "SQL8"."Shift" AS "Shift",
          "SQL8"."05" AS "05",
          "SQL8"."06" AS "06",
          "SQL8"."07" AS "07",
          "SQL8"."08" AS "08",
          "SQL8"."09" AS "09",
          "SQL8"."10" AS "10",
          "SQL8"."11" AS "11",
          "SQL8"."12" AS "12",
          "SQL8"."13" AS "13",
          "SQL8"."14" AS "14",
          "SQL8"."15" AS "15",
          "SQL8"."16" AS "16",
          "SQL8"."17" AS "17",
          "SQL8"."18" AS "18",
          "SQL8"."19" AS "19",
          "SQL8"."20" AS "20",
          "SQL8"."21" AS "21",
          "SQL8"."22" AS "22",
          "SQL8"."23" AS "23",
          "SQL8"."00" AS "00",
          "SQL8"."01" AS "01",
          "SQL8"."02" AS "02",
          "SQL8"."03" AS "03",
          "SQL8"."04" AS "04"
   FROM
     (/*Audit Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                    CASE
                                        WHEN a1.logguser IS NOT NULL THEN '345-Audit'
                                        ELSE 'Other'
                                    END "Function",
                                    TRIM (a1.logguser) "User",
                                         TRIM (a2.fname) "F Name",
                                              TRIM (a2.lname) "L Name",
                                                   TRIM (a2.address1) "Shift",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                ELSE 0
                                                            END) "05",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                ELSE 0
                                                            END) "06",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                ELSE 0
                                                            END) "07",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                ELSE 0
                                                            END) "08",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                ELSE 0
                                                            END) "09",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                ELSE 0
                                                            END) "10",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                ELSE 0
                                                            END) "11",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                ELSE 0
                                                            END) "12",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                ELSE 0
                                                            END) "13",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                ELSE 0
                                                            END) "14",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                ELSE 0
                                                            END) "15",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                ELSE 0
                                                            END) "16",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                ELSE 0
                                                            END) "17",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                ELSE 0
                                                            END) "18",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                ELSE 0
                                                            END) "19",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                ELSE 0
                                                            END) "20",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                ELSE 0
                                                            END) "21",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                ELSE 0
                                                            END) "22",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                ELSE 0
                                                            END) "23",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                ELSE 0
                                                            END) "00",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                ELSE 0
                                                            END) "01",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                ELSE 0
                                                            END) "02",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                ELSE 0
                                                            END) "03",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                ELSE 0
                                                            END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a2.dep NOT IN ('SD TEAMLEAD')
        AND a1.l16lcode = 61
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL8"),
                                                                                                                                                                                       "C345_Audit" AS
  (SELECT DISTINCT "SQL8"."Date" AS "Date0",
                   "SQL8"."Function" AS "Function0",
                   "SQL8"."User" AS "User0",
                   "SQL8"."F Name" AS "F_Name",
                   "SQL8"."L Name" AS "L_Name",
                   "SQL8"."Shift" AS "Shift",
                   "SQL8"."05" AS "C05",
                   "SQL8"."06" AS "C06",
                   "SQL8"."07" AS "C07",
                   "SQL8"."08" AS "C08",
                   "SQL8"."09" AS "C09",
                   "SQL8"."10" AS "C10",
                   "SQL8"."11" AS "C11",
                   "SQL8"."12" AS "C12",
                   "SQL8"."13" AS "C13",
                   "SQL8"."14" AS "C14",
                   "SQL8"."15" AS "C15",
                   "SQL8"."16" AS "C16",
                   "SQL8"."17" AS "C17",
                   "SQL8"."18" AS "C18",
                   "SQL8"."19" AS "C19",
                   "SQL8"."20" AS "C20",
                   "SQL8"."21" AS "C21",
                   "SQL8"."22" AS "C22",
                   "SQL8"."23" AS "C23",
                   "SQL8"."00" AS "C00",
                   "SQL8"."01" AS "C01",
                   "SQL8"."02" AS "C02",
                   "SQL8"."03" AS "C03",
                   "SQL8"."04" AS "C04"
   FROM "SQL8"),
                                                                                                                                                                                       "SQL7" AS
  (SELECT "SQL7"."Date" AS "Date",
          "SQL7"."Function" AS "Function",
          "SQL7"."User" AS "User",
          "SQL7"."F Name" AS "F Name",
          "SQL7"."L Name" AS "L Name",
          "SQL7"."Shift" AS "Shift",
          "SQL7"."05" AS "05",
          "SQL7"."06" AS "06",
          "SQL7"."07" AS "07",
          "SQL7"."08" AS "08",
          "SQL7"."09" AS "09",
          "SQL7"."10" AS "10",
          "SQL7"."11" AS "11",
          "SQL7"."12" AS "12",
          "SQL7"."13" AS "13",
          "SQL7"."14" AS "14",
          "SQL7"."15" AS "15",
          "SQL7"."16" AS "16",
          "SQL7"."17" AS "17",
          "SQL7"."18" AS "18",
          "SQL7"."19" AS "19",
          "SQL7"."20" AS "20",
          "SQL7"."21" AS "21",
          "SQL7"."22" AS "22",
          "SQL7"."23" AS "23",
          "SQL7"."00" AS "00",
          "SQL7"."01" AS "01",
          "SQL7"."02" AS "02",
          "SQL7"."03" AS "03",
          "SQL7"."04" AS "04"
   FROM
     (/*Counter Balance Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                              CASE
                                                  WHEN a1.logguser IS NOT NULL THEN '345-CounterBalance'
                                                  ELSE 'Other'
                                              END "Function",
                                              TRIM (a1.logguser) "User",
                                                   TRIM (a2.fname) "F Name",
                                                        TRIM (a2.lname) "L Name",
                                                             TRIM (a2.address1) "Shift",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                          ELSE 0
                                                                      END) "05",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                          ELSE 0
                                                                      END) "06",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                          ELSE 0
                                                                      END) "07",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                          ELSE 0
                                                                      END) "08",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                          ELSE 0
                                                                      END) "09",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                          ELSE 0
                                                                      END) "10",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                          ELSE 0
                                                                      END) "11",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                          ELSE 0
                                                                      END) "12",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                          ELSE 0
                                                                      END) "13",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                          ELSE 0
                                                                      END) "14",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                          ELSE 0
                                                                      END) "15",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                          ELSE 0
                                                                      END) "16",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                          ELSE 0
                                                                      END) "17",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                          ELSE 0
                                                                      END) "18",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                          ELSE 0
                                                                      END) "19",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                          ELSE 0
                                                                      END) "20",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                          ELSE 0
                                                                      END) "21",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                          ELSE 0
                                                                      END) "22",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                          ELSE 0
                                                                      END) "23",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                          ELSE 0
                                                                      END) "00",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                          ELSE 0
                                                                      END) "01",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                          ELSE 0
                                                                      END) "02",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                          ELSE 0
                                                                      END) "03",
                                                                  SUM(CASE
                                                                          WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                          ELSE 0
                                                                      END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a2.dep NOT IN ('SD TEAMLEAD')
        AND (gadmunit IN ('CBF',
                          'CB',
                          'CBP',
                          'CB2',
                          'CB5',
                          'CBNEW')
             OR SUBSTR (fmha,
                        3,
                        3) = 'GR1'
             AND l46adr IN
               (SELECT l46adr
                FROM astro.l47t1
                WHERE SUBSTR (L47desc,
                              1,
                              3) = 'CBL'))
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL7"),
                                                                                                                                                                                       "C345_CounterB" AS
  (SELECT DISTINCT "SQL7"."Date" AS "Date0",
                   "SQL7"."Function" AS "Function0",
                   "SQL7"."User" AS "User0",
                   "SQL7"."F Name" AS "F_Name",
                   "SQL7"."L Name" AS "L_Name",
                   "SQL7"."Shift" AS "Shift",
                   "SQL7"."05" AS "C05",
                   "SQL7"."06" AS "C06",
                   "SQL7"."07" AS "C07",
                   "SQL7"."08" AS "C08",
                   "SQL7"."09" AS "C09",
                   "SQL7"."10" AS "C10",
                   "SQL7"."11" AS "C11",
                   "SQL7"."12" AS "C12",
                   "SQL7"."13" AS "C13",
                   "SQL7"."14" AS "C14",
                   "SQL7"."15" AS "C15",
                   "SQL7"."16" AS "C16",
                   "SQL7"."17" AS "C17",
                   "SQL7"."18" AS "C18",
                   "SQL7"."19" AS "C19",
                   "SQL7"."20" AS "C20",
                   "SQL7"."21" AS "C21",
                   "SQL7"."22" AS "C22",
                   "SQL7"."23" AS "C23",
                   "SQL7"."00" AS "C00",
                   "SQL7"."01" AS "C01",
                   "SQL7"."02" AS "C02",
                   "SQL7"."03" AS "C03",
                   "SQL7"."04" AS "C04"
   FROM "SQL7"),
                                                                                                                                                                                       "SQL3" AS
  (SELECT "SQL3"."Date" AS "Date",
          "SQL3"."Function" AS "Function",
          "SQL3"."User" AS "User",
          "SQL3"."F Name" AS "F Name",
          "SQL3"."L Name" AS "L Name",
          "SQL3"."Shift" AS "Shift",
          "SQL3"."05" AS "05",
          "SQL3"."06" AS "06",
          "SQL3"."07" AS "07",
          "SQL3"."08" AS "08",
          "SQL3"."09" AS "09",
          "SQL3"."10" AS "10",
          "SQL3"."11" AS "11",
          "SQL3"."12" AS "12",
          "SQL3"."13" AS "13",
          "SQL3"."14" AS "14",
          "SQL3"."15" AS "15",
          "SQL3"."16" AS "16",
          "SQL3"."17" AS "17",
          "SQL3"."18" AS "18",
          "SQL3"."19" AS "19",
          "SQL3"."20" AS "20",
          "SQL3"."21" AS "21",
          "SQL3"."22" AS "22",
          "SQL3"."23" AS "23",
          "SQL3"."00" AS "00",
          "SQL3"."01" AS "01",
          "SQL3"."02" AS "02",
          "SQL3"."03" AS "03",
          "SQL3"."04" AS "04"
   FROM
     (/*Crane Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                    CASE
                                        WHEN a1.logguser IS NOT NULL THEN '345-Cranes'
                                        ELSE 'Other'
                                    END "Function",
                                    TRIM (a1.logguser) "User",
                                         TRIM (a2.fname) "F Name",
                                              TRIM (a2.lname) "L Name",
                                                   TRIM (a2.address1) "Shift",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                ELSE 0
                                                            END) "05",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                ELSE 0
                                                            END) "06",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                ELSE 0
                                                            END) "07",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                ELSE 0
                                                            END) "08",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                ELSE 0
                                                            END) "09",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                ELSE 0
                                                            END) "10",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                ELSE 0
                                                            END) "11",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                ELSE 0
                                                            END) "12",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                ELSE 0
                                                            END) "13",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                ELSE 0
                                                            END) "14",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                ELSE 0
                                                            END) "15",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                ELSE 0
                                                            END) "16",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                ELSE 0
                                                            END) "17",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                ELSE 0
                                                            END) "18",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                ELSE 0
                                                            END) "19",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                ELSE 0
                                                            END) "20",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                ELSE 0
                                                            END) "21",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                ELSE 0
                                                            END) "22",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                ELSE 0
                                                            END) "23",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                ELSE 0
                                                            END) "00",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                ELSE 0
                                                            END) "01",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                ELSE 0
                                                            END) "02",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                ELSE 0
                                                            END) "03",
                                                        SUM(CASE
                                                                WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                ELSE 0
                                                            END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a2.dep NOT IN ('SD TEAMLEAD')
        AND ((SUBSTR(admunit, 5, 1) IN ('N',
                                        'C')
              AND SUBSTR(admunit, 1, 1) IN ('O')
              AND SUBSTR(mha, 3, 2) IN ('GR'))
             OR SUBSTR(admunit, 1, 2) IN ('TS'))
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL3"),
                                                                                                                                                                                       "C345_Cranes" AS
  (SELECT DISTINCT "SQL3"."Date" AS "Date0",
                   "SQL3"."Function" AS "Function0",
                   "SQL3"."User" AS "User0",
                   "SQL3"."F Name" AS "F_Name",
                   "SQL3"."L Name" AS "L_Name",
                   "SQL3"."Shift" AS "Shift",
                   "SQL3"."05" AS "C05",
                   "SQL3"."06" AS "C06",
                   "SQL3"."07" AS "C07",
                   "SQL3"."08" AS "C08",
                   "SQL3"."09" AS "C09",
                   "SQL3"."10" AS "C10",
                   "SQL3"."11" AS "C11",
                   "SQL3"."12" AS "C12",
                   "SQL3"."13" AS "C13",
                   "SQL3"."14" AS "C14",
                   "SQL3"."15" AS "C15",
                   "SQL3"."16" AS "C16",
                   "SQL3"."17" AS "C17",
                   "SQL3"."18" AS "C18",
                   "SQL3"."19" AS "C19",
                   "SQL3"."20" AS "C20",
                   "SQL3"."21" AS "C21",
                   "SQL3"."22" AS "C22",
                   "SQL3"."23" AS "C23",
                   "SQL3"."00" AS "C00",
                   "SQL3"."01" AS "C01",
                   "SQL3"."02" AS "C02",
                   "SQL3"."03" AS "C03",
                   "SQL3"."04" AS "C04"
   FROM "SQL3"),
                                                                                                                                                                                       "SQL10" AS
  (SELECT "SQL10"."Date" AS "Date",
          "SQL10"."Function" AS "Function",
          "SQL10"."User" AS "User",
          "SQL10"."F Name" AS "F Name",
          "SQL10"."L Name" AS "L Name",
          "SQL10"."Shift" AS "Shift",
          "SQL10"."05" AS "05",
          "SQL10"."06" AS "06",
          "SQL10"."07" AS "07",
          "SQL10"."08" AS "08",
          "SQL10"."09" AS "09",
          "SQL10"."10" AS "10",
          "SQL10"."11" AS "11",
          "SQL10"."12" AS "12",
          "SQL10"."13" AS "13",
          "SQL10"."14" AS "14",
          "SQL10"."15" AS "15",
          "SQL10"."16" AS "16",
          "SQL10"."17" AS "17",
          "SQL10"."18" AS "18",
          "SQL10"."19" AS "19",
          "SQL10"."20" AS "20",
          "SQL10"."21" AS "21",
          "SQL10"."22" AS "22",
          "SQL10"."23" AS "23",
          "SQL10"."00" AS "00",
          "SQL10"."01" AS "01",
          "SQL10"."02" AS "02",
          "SQL10"."03" AS "03",
          "SQL10"."04" AS "04"
   FROM
     (/*Loading Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                      CASE
                                          WHEN a1.logguser IS NOT NULL THEN '345-Loading'
                                          ELSE 'Other'
                                      END "Function",
                                      TRIM (a1.logguser) "User",
                                           TRIM (a2.fname) "F Name",
                                                TRIM (a2.lname) "L Name",
                                                     TRIM (a2.address1) "Shift",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                  ELSE 0
                                                              END) "05",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                  ELSE 0
                                                              END) "06",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                  ELSE 0
                                                              END) "07",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                  ELSE 0
                                                              END) "08",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                  ELSE 0
                                                              END) "09",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                  ELSE 0
                                                              END) "10",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                  ELSE 0
                                                              END) "11",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                  ELSE 0
                                                              END) "12",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                  ELSE 0
                                                              END) "13",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                  ELSE 0
                                                              END) "14",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                  ELSE 0
                                                              END) "15",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                  ELSE 0
                                                              END) "16",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                  ELSE 0
                                                              END) "17",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                  ELSE 0
                                                              END) "18",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                  ELSE 0
                                                              END) "19",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                  ELSE 0
                                                              END) "20",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                  ELSE 0
                                                              END) "21",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                  ELSE 0
                                                              END) "22",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                  ELSE 0
                                                              END) "23",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                  ELSE 0
                                                              END) "00",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                  ELSE 0
                                                              END) "01",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                  ELSE 0
                                                              END) "02",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                  ELSE 0
                                                              END) "03",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                  ELSE 0
                                                              END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a2.dep NOT IN ('SD TEAMLEAD')
        AND a1.L16LCODE IN ('40')
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL10"),
                                                                                                                                                                                       "C345_Loading" AS
  (SELECT DISTINCT "SQL10"."Date" AS "Date0",
                   "SQL10"."Function" AS "Function0",
                   "SQL10"."User" AS "User0",
                   "SQL10"."F Name" AS "F_Name",
                   "SQL10"."L Name" AS "L_Name",
                   "SQL10"."Shift" AS "Shift",
                   "SQL10"."05" AS "C05",
                   "SQL10"."06" AS "C06",
                   "SQL10"."07" AS "C07",
                   "SQL10"."08" AS "C08",
                   "SQL10"."09" AS "C09",
                   "SQL10"."10" AS "C10",
                   "SQL10"."11" AS "C11",
                   "SQL10"."12" AS "C12",
                   "SQL10"."13" AS "C13",
                   "SQL10"."14" AS "C14",
                   "SQL10"."15" AS "C15",
                   "SQL10"."16" AS "C16",
                   "SQL10"."17" AS "C17",
                   "SQL10"."18" AS "C18",
                   "SQL10"."19" AS "C19",
                   "SQL10"."20" AS "C20",
                   "SQL10"."21" AS "C21",
                   "SQL10"."22" AS "C22",
                   "SQL10"."23" AS "C23",
                   "SQL10"."00" AS "C00",
                   "SQL10"."01" AS "C01",
                   "SQL10"."02" AS "C02",
                   "SQL10"."03" AS "C03",
                   "SQL10"."04" AS "C04"
   FROM "SQL10"),
                                                                                                                                                                                       "SQL6" AS
  (SELECT "SQL6"."Date" AS "Date",
          "SQL6"."Function" AS "Function",
          "SQL6"."User" AS "User",
          "SQL6"."F Name" AS "F Name",
          "SQL6"."L Name" AS "L Name",
          "SQL6"."Shift" AS "Shift",
          "SQL6"."05" AS "05",
          "SQL6"."06" AS "06",
          "SQL6"."07" AS "07",
          "SQL6"."08" AS "08",
          "SQL6"."09" AS "09",
          "SQL6"."10" AS "10",
          "SQL6"."11" AS "11",
          "SQL6"."12" AS "12",
          "SQL6"."13" AS "13",
          "SQL6"."14" AS "14",
          "SQL6"."15" AS "15",
          "SQL6"."16" AS "16",
          "SQL6"."17" AS "17",
          "SQL6"."18" AS "18",
          "SQL6"."19" AS "19",
          "SQL6"."20" AS "20",
          "SQL6"."21" AS "21",
          "SQL6"."22" AS "22",
          "SQL6"."23" AS "23",
          "SQL6"."00" AS "00",
          "SQL6"."01" AS "01",
          "SQL6"."02" AS "02",
          "SQL6"."03" AS "03",
          "SQL6"."04" AS "04"
   FROM
     (/*Picking Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                      CASE
                                          WHEN a1.logguser IS NOT NULL THEN '345-Picking'
                                          ELSE 'Other'
                                      END "Function",
                                      TRIM (a1.logguser) "User",
                                           TRIM (a2.fname) "F Name",
                                                TRIM (a2.lname) "L Name",
                                                     TRIM (a2.address1) "Shift",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                  ELSE 0
                                                              END) "05",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                  ELSE 0
                                                              END) "06",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                  ELSE 0
                                                              END) "07",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                  ELSE 0
                                                              END) "08",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                  ELSE 0
                                                              END) "09",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                  ELSE 0
                                                              END) "10",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                  ELSE 0
                                                              END) "11",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                  ELSE 0
                                                              END) "12",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                  ELSE 0
                                                              END) "13",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                  ELSE 0
                                                              END) "14",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                  ELSE 0
                                                              END) "15",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                  ELSE 0
                                                              END) "16",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                  ELSE 0
                                                              END) "17",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                  ELSE 0
                                                              END) "18",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                  ELSE 0
                                                              END) "19",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                  ELSE 0
                                                              END) "20",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                  ELSE 0
                                                              END) "21",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                  ELSE 0
                                                              END) "22",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                  ELSE 0
                                                              END) "23",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                  ELSE 0
                                                              END) "00",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                  ELSE 0
                                                              END) "01",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                  ELSE 0
                                                              END) "02",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                  ELSE 0
                                                              END) "03",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                  ELSE 0
                                                              END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a1.L16LCODE IN ('4')
        AND a2.dep NOT IN ('SD TEAMLEAD')
        AND a1.L16MOVEF IN ('7')
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL6"),
                                                                                                                                                                                       "C345_Picking" AS
  (SELECT DISTINCT "SQL6"."Date" AS "Date0",
                   "SQL6"."Function" AS "Function0",
                   "SQL6"."User" AS "User0",
                   "SQL6"."F Name" AS "F_Name",
                   "SQL6"."L Name" AS "L_Name",
                   "SQL6"."Shift" AS "Shift",
                   "SQL6"."05" AS "C05",
                   "SQL6"."06" AS "C06",
                   "SQL6"."07" AS "C07",
                   "SQL6"."08" AS "C08",
                   "SQL6"."09" AS "C09",
                   "SQL6"."10" AS "C10",
                   "SQL6"."11" AS "C11",
                   "SQL6"."12" AS "C12",
                   "SQL6"."13" AS "C13",
                   "SQL6"."14" AS "C14",
                   "SQL6"."15" AS "C15",
                   "SQL6"."16" AS "C16",
                   "SQL6"."17" AS "C17",
                   "SQL6"."18" AS "C18",
                   "SQL6"."19" AS "C19",
                   "SQL6"."20" AS "C20",
                   "SQL6"."21" AS "C21",
                   "SQL6"."22" AS "C22",
                   "SQL6"."23" AS "C23",
                   "SQL6"."00" AS "C00",
                   "SQL6"."01" AS "C01",
                   "SQL6"."02" AS "C02",
                   "SQL6"."03" AS "C03",
                   "SQL6"."04" AS "C04"
   FROM "SQL6"),
                                                                                                                                                                                       "SQL2" AS
  (SELECT "SQL2"."Date" AS "Date",
          "SQL2"."Function" AS "Function",
          "SQL2"."User" AS "User",
          "SQL2"."F Name" AS "F Name",
          "SQL2"."L Name" AS "L Name",
          "SQL2"."Shift" AS "Shift",
          "SQL2"."05" AS "05",
          "SQL2"."06" AS "06",
          "SQL2"."07" AS "07",
          "SQL2"."08" AS "08",
          "SQL2"."09" AS "09",
          "SQL2"."10" AS "10",
          "SQL2"."11" AS "11",
          "SQL2"."12" AS "12",
          "SQL2"."13" AS "13",
          "SQL2"."14" AS "14",
          "SQL2"."15" AS "15",
          "SQL2"."16" AS "16",
          "SQL2"."17" AS "17",
          "SQL2"."18" AS "18",
          "SQL2"."19" AS "19",
          "SQL2"."20" AS "20",
          "SQL2"."21" AS "21",
          "SQL2"."22" AS "22",
          "SQL2"."23" AS "23",
          "SQL2"."00" AS "00",
          "SQL2"."01" AS "01",
          "SQL2"."02" AS "02",
          "SQL2"."03" AS "03",
          "SQL2"."04" AS "04"
   FROM
     (/*Putaway Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                      CASE
                                          WHEN a1.logguser IS NOT NULL THEN '345-Putaway'
                                          ELSE 'Other'
                                      END "Function",
                                      TRIM (a1.logguser) "User",
                                           TRIM (a2.fname) "F Name",
                                                TRIM (a2.lname) "L Name",
                                                     TRIM (a2.address1) "Shift",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                  ELSE 0
                                                              END) "05",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                  ELSE 0
                                                              END) "06",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                  ELSE 0
                                                              END) "07",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                  ELSE 0
                                                              END) "08",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                  ELSE 0
                                                              END) "09",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                  ELSE 0
                                                              END) "10",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                  ELSE 0
                                                              END) "11",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                  ELSE 0
                                                              END) "12",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                  ELSE 0
                                                              END) "13",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                  ELSE 0
                                                              END) "14",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                  ELSE 0
                                                              END) "15",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                  ELSE 0
                                                              END) "16",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                  ELSE 0
                                                              END) "17",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                  ELSE 0
                                                              END) "18",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                  ELSE 0
                                                              END) "19",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                  ELSE 0
                                                              END) "20",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                  ELSE 0
                                                              END) "21",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                  ELSE 0
                                                              END) "22",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                  ELSE 0
                                                              END) "23",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                  ELSE 0
                                                              END) "00",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                  ELSE 0
                                                              END) "01",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                  ELSE 0
                                                              END) "02",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                  ELSE 0
                                                              END) "03",
                                                          SUM(CASE
                                                                  WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                  ELSE 0
                                                              END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.l16lcode IN ('3')
        AND a1.l54movet IN ('1',
                            '10')
        AND SUBSTR(a1.mha, 1, 2) NOT IN ('3L',
                                         '3D')
        AND a1.mha NOT IN ('12R1',
                           '12R2',
                           '15R1',
                           '15R2',
                           '15G1',
                           '12GR1')
        AND SUBSTR(a1.admunit, 1, 2) NOT IN ('TS')
        AND SUBSTR(a1.fmha, 1, 3) <> SUBSTR(a1.mha, 1, 3)
        AND a1.divcode IN ('345')
        AND a2.dep NOT IN ('SD TEAMLEAD')
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL2"),
                                                                                                                                                                                       "C345_Putaway" AS
  (SELECT DISTINCT "SQL2"."Date" AS "Date0",
                   "SQL2"."Function" AS "Function0",
                   "SQL2"."User" AS "User0",
                   "SQL2"."F Name" AS "F_Name",
                   "SQL2"."L Name" AS "L_Name",
                   "SQL2"."Shift" AS "Shift",
                   "SQL2"."05" AS "C05",
                   "SQL2"."06" AS "C06",
                   "SQL2"."07" AS "C07",
                   "SQL2"."08" AS "C08",
                   "SQL2"."09" AS "C09",
                   "SQL2"."10" AS "C10",
                   "SQL2"."11" AS "C11",
                   "SQL2"."12" AS "C12",
                   "SQL2"."13" AS "C13",
                   "SQL2"."14" AS "C14",
                   "SQL2"."15" AS "C15",
                   "SQL2"."16" AS "C16",
                   "SQL2"."17" AS "C17",
                   "SQL2"."18" AS "C18",
                   "SQL2"."19" AS "C19",
                   "SQL2"."20" AS "C20",
                   "SQL2"."21" AS "C21",
                   "SQL2"."22" AS "C22",
                   "SQL2"."23" AS "C23",
                   "SQL2"."00" AS "C00",
                   "SQL2"."01" AS "C01",
                   "SQL2"."02" AS "C02",
                   "SQL2"."03" AS "C03",
                   "SQL2"."04" AS "C04"
   FROM "SQL2"),
                                                                                                                                                                                       "SQL1" AS
  (SELECT "SQL1"."Date" AS "Date",
          "SQL1"."Function" AS "Function",
          "SQL1"."User" AS "User",
          "SQL1"."F Name" AS "F Name",
          "SQL1"."L Name" AS "L Name",
          "SQL1"."Shift" AS "Shift",
          "SQL1"."05" AS "05",
          "SQL1"."06" AS "06",
          "SQL1"."07" AS "07",
          "SQL1"."08" AS "08",
          "SQL1"."09" AS "09",
          "SQL1"."10" AS "10",
          "SQL1"."11" AS "11",
          "SQL1"."12" AS "12",
          "SQL1"."13" AS "13",
          "SQL1"."14" AS "14",
          "SQL1"."15" AS "15",
          "SQL1"."16" AS "16",
          "SQL1"."17" AS "17",
          "SQL1"."18" AS "18",
          "SQL1"."19" AS "19",
          "SQL1"."20" AS "20",
          "SQL1"."21" AS "21",
          "SQL1"."22" AS "22",
          "SQL1"."23" AS "23",
          "SQL1"."00" AS "00",
          "SQL1"."01" AS "01",
          "SQL1"."02" AS "02",
          "SQL1"."03" AS "03",
          "SQL1"."04" AS "04"
   FROM
     (/*Receiving Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                        CASE
                                            WHEN a1.logguser IS NOT NULL THEN '345-Unloading'
                                            ELSE 'Other'
                                        END "Function",
                                        TRIM (a1.logguser) "User",
                                             TRIM (a2.fname) "F Name",
                                                  TRIM (a2.lname) "L Name",
                                                       TRIM (a2.address1) "Shift",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                                    ELSE 0
                                                                END) "05",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                                    ELSE 0
                                                                END) "06",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                                    ELSE 0
                                                                END) "07",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                                    ELSE 0
                                                                END) "08",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                                    ELSE 0
                                                                END) "09",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                                    ELSE 0
                                                                END) "10",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                                    ELSE 0
                                                                END) "11",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                                    ELSE 0
                                                                END) "12",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                                    ELSE 0
                                                                END) "13",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                                    ELSE 0
                                                                END) "14",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                                    ELSE 0
                                                                END) "15",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                                    ELSE 0
                                                                END) "16",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                                    ELSE 0
                                                                END) "17",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                                    ELSE 0
                                                                END) "18",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                                    ELSE 0
                                                                END) "19",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                                    ELSE 0
                                                                END) "20",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                                    ELSE 0
                                                                END) "21",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                                    ELSE 0
                                                                END) "22",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                                    ELSE 0
                                                                END) "23",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                                    ELSE 0
                                                                END) "00",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                                    ELSE 0
                                                                END) "01",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                                    ELSE 0
                                                                END) "02",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                                    ELSE 0
                                                                END) "03",
                                                            SUM(CASE
                                                                    WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                                    ELSE 0
                                                                END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.L16LCODE IN ('26')
        AND a2.dep NOT IN ('SD TEAMLEAD')
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL1"),
                                                                                                                                                                                       "C345_Receiving" AS
  (SELECT DISTINCT "SQL1"."Date" AS "Date0",
                   "SQL1"."Function" AS "Function0",
                   "SQL1"."User" AS "User0",
                   "SQL1"."F Name" AS "F_Name",
                   "SQL1"."L Name" AS "L_Name",
                   "SQL1"."Shift" AS "Shift",
                   "SQL1"."05" AS "C05",
                   "SQL1"."06" AS "C06",
                   "SQL1"."07" AS "C07",
                   "SQL1"."08" AS "C08",
                   "SQL1"."09" AS "C09",
                   "SQL1"."10" AS "C10",
                   "SQL1"."11" AS "C11",
                   "SQL1"."12" AS "C12",
                   "SQL1"."13" AS "C13",
                   "SQL1"."14" AS "C14",
                   "SQL1"."15" AS "C15",
                   "SQL1"."16" AS "C16",
                   "SQL1"."17" AS "C17",
                   "SQL1"."18" AS "C18",
                   "SQL1"."19" AS "C19",
                   "SQL1"."20" AS "C20",
                   "SQL1"."21" AS "C21",
                   "SQL1"."22" AS "C22",
                   "SQL1"."23" AS "C23",
                   "SQL1"."00" AS "C00",
                   "SQL1"."01" AS "C01",
                   "SQL1"."02" AS "C02",
                   "SQL1"."03" AS "C03",
                   "SQL1"."04" AS "C04"
   FROM "SQL1"),
                                                                                                                                                                                       "SQL4" AS
  (SELECT "SQL4"."Date" AS "Date",
          "SQL4"."Function" AS "Function",
          "SQL4"."User" AS "User",
          "SQL4"."F Name" AS "F Name",
          "SQL4"."L Name" AS "L Name",
          "SQL4"."Shift" AS "Shift",
          "SQL4"."05" AS "05",
          "SQL4"."06" AS "06",
          "SQL4"."07" AS "07",
          "SQL4"."08" AS "08",
          "SQL4"."09" AS "09",
          "SQL4"."10" AS "10",
          "SQL4"."11" AS "11",
          "SQL4"."12" AS "12",
          "SQL4"."13" AS "13",
          "SQL4"."14" AS "14",
          "SQL4"."15" AS "15",
          "SQL4"."16" AS "16",
          "SQL4"."17" AS "17",
          "SQL4"."18" AS "18",
          "SQL4"."19" AS "19",
          "SQL4"."20" AS "20",
          "SQL4"."21" AS "21",
          "SQL4"."22" AS "22",
          "SQL4"."23" AS "23",
          "SQL4"."00" AS "00",
          "SQL4"."01" AS "01",
          "SQL4"."02" AS "02",
          "SQL4"."03" AS "03",
          "SQL4"."04" AS "04"
   FROM
     (/*Rep Function SQL*/ SELECT TRUNC(a1.datreg) "Date",
                                  CASE
                                      WHEN a1.logguser IS NOT NULL THEN '345-Replenishment'
                                      ELSE 'Other'
                                  END "Function",
                                  TRIM (a1.logguser) "User",
                                       TRIM (a2.fname) "F Name",
                                            TRIM (a2.lname) "L Name",
                                                 TRIM (a2.address1) "Shift",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                                              ELSE 0
                                                          END) "05",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                                              ELSE 0
                                                          END) "06",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                                              ELSE 0
                                                          END) "07",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                                              ELSE 0
                                                          END) "08",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                                              ELSE 0
                                                          END) "09",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                                              ELSE 0
                                                          END) "10",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '11' THEN 1
                                                              ELSE 0
                                                          END) "11",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '12' THEN 1
                                                              ELSE 0
                                                          END) "12",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '13' THEN 1
                                                              ELSE 0
                                                          END) "13",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '14' THEN 1
                                                              ELSE 0
                                                          END) "14",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '15' THEN 1
                                                              ELSE 0
                                                          END) "15",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '16' THEN 1
                                                              ELSE 0
                                                          END) "16",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '17' THEN 1
                                                              ELSE 0
                                                          END) "17",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '18' THEN 1
                                                              ELSE 0
                                                          END) "18",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '19' THEN 1
                                                              ELSE 0
                                                          END) "19",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '20' THEN 1
                                                              ELSE 0
                                                          END) "20",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '21' THEN 1
                                                              ELSE 0
                                                          END) "21",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '22' THEN 1
                                                              ELSE 0
                                                          END) "22",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '23' THEN 1
                                                              ELSE 0
                                                          END) "23",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '00' THEN 1
                                                              ELSE 0
                                                          END) "00",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '01' THEN 1
                                                              ELSE 0
                                                          END) "01",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '02' THEN 1
                                                              ELSE 0
                                                          END) "02",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '03' THEN 1
                                                              ELSE 0
                                                          END) "03",
                                                      SUM(CASE
                                                              WHEN TO_CHAR(a1.datreg, 'HH24') = '04' THEN 1
                                                              ELSE 0
                                                          END) "04"
      FROM astro.ASTRO_VIEW_CNT_SVL16001 a1,
           astro.s90t1 a2
      WHERE a1.logguser = a2.uname
        AND a1.datreg >= SYSDATE-7
        AND a1.divcode IN ('345')
        AND a1.gadmunit IN ('RKREP',
                            'REPR')
        AND a2.dep NOT IN ('SD TEAMLEAD')
      GROUP BY TRUNC(a1.datreg),
               a1.logguser,
               TRIM (a2.fname), TRIM (a2.lname), a2.address1
      ORDER BY TRUNC(a1.datreg)) "SQL4"),
                                                                                                                                                                                       "C345_Rep" AS
  (SELECT DISTINCT "SQL4"."Date" AS "Date0",
                   "SQL4"."Function" AS "Function0",
                   "SQL4"."User" AS "User0",
                   "SQL4"."F Name" AS "F_Name",
                   "SQL4"."L Name" AS "L_Name",
                   "SQL4"."Shift" AS "Shift",
                   "SQL4"."05" AS "C05",
                   "SQL4"."06" AS "C06",
                   "SQL4"."07" AS "C07",
                   "SQL4"."08" AS "C08",
                   "SQL4"."09" AS "C09",
                   "SQL4"."10" AS "C10",
                   "SQL4"."11" AS "C11",
                   "SQL4"."12" AS "C12",
                   "SQL4"."13" AS "C13",
                   "SQL4"."14" AS "C14",
                   "SQL4"."15" AS "C15",
                   "SQL4"."16" AS "C16",
                   "SQL4"."17" AS "C17",
                   "SQL4"."18" AS "C18",
                   "SQL4"."19" AS "C19",
                   "SQL4"."20" AS "C20",
                   "SQL4"."21" AS "C21",
                   "SQL4"."22" AS "C22",
                   "SQL4"."23" AS "C23",
                   "SQL4"."00" AS "C00",
                   "SQL4"."01" AS "C01",
                   "SQL4"."02" AS "C02",
                   "SQL4"."03" AS "C03",
                   "SQL4"."04" AS "C04"
   FROM "SQL4"),
                                                                                                                                                                                       "SQL5" AS (
SELECT "SQL5"."Date" AS "Date",
       "SQL5"."Function" AS "Function",
       "SQL5"."User" AS "User",
       "SQL5"."F Name" AS "F Name",
       "SQL5"."L Name" AS "L Name",
       "SQL5"."Shift" AS "Shift",
       "SQL5"."05" AS "05",
       "SQL5"."06" AS "06",
       "SQL5"."07" AS "07",
       "SQL5"."08" AS "08",
       "SQL5"."09" AS "09",
       "SQL5"."10" AS "10",
       "SQL5"."11" AS "11",
       "SQL5"."12" AS "12",
       "SQL5"."13" AS "13",
       "SQL5"."14" AS "14",
       "SQL5"."15" AS "15",
       "SQL5"."16" AS "16",
       "SQL5"."17" AS "17",
       "SQL5"."18" AS "18",
       "SQL5"."19" AS "19",
       "SQL5"."20" AS "20",
       "SQL5"."21" AS "21",
       "SQL5"."22" AS "22",
       "SQL5"."23" AS "23",
       "SQL5"."00" AS "00",
       "SQL5"."01" AS "01",
       "SQL5"."02" AS "02",
       "SQL5"."03" AS "03",
       "SQL5"."04" AS "04"
FROM ( /*SD2CD Function SQL*/
SELECT TRUNC(a1.datreg) "Date",
       CASE
           WHEN a1.logguser IS NOT NULL THEN '345-SD2CD'
           ELSE 'Other'
       END "Function",
       TRIM (a1.logguser) "User",
            TRIM (a2.fname) "F Name",
                 TRIM (a2.lname) "L Name",
                      TRIM (a2.address1) "Shift",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '05' THEN 1
                                   ELSE 0
                               END) "05",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '06' THEN 1
                                   ELSE 0
                               END) "06",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '07' THEN 1
                                   ELSE 0
                               END) "07",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '08' THEN 1
                                   ELSE 0
                               END) "08",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '09' THEN 1
                                   ELSE 0
                               END) "09",
                           SUM(CASE
                                   WHEN TO_CHAR(a1.datreg, 'HH24') = '10' THEN 1
                                   ELSE 0
                               END) "10",
                           SUM