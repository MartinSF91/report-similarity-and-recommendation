/* user=Jhanvi Nandani reportPath= report= queryName=OB REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=jdhv8C998C4MwdjC4qjvlvdGlqd2892v4wlMv4v9 */
SELECT DISTINCT "SQL2"."OB" AS "OB",
                "SQL2"."OB_finish" AS "OB_finish"
FROM
  (WITH AA AS
     (SELECT shortr08 ,
             routeno ,
             tripno ,
             vehno ,
             pickdate
      FROM R08T1
      WHERE TRUNC(pickdate) = TRUNC(sysdate)
        AND ROUTENO NOT IN ('1289L1',
                            '1579L1',
                            '2534L1',
                            '2951L1')),
        BB AS
     (SELECT shortr08 ,
             stato40 ,
             carrvol ,
             ocarrno
      FROM O40T2),
        MAIN AS
     (SELECT BB.ocarrno ,
             BB.carrvol ,
             BB.stato40 ,
             AA.shortr08 ,
             AA.routeno ,
             AA.tripno ,
             AA.vehno ,
             pickdate
      FROM BB
      LEFT JOIN AA ON BB.shortr08 = AA.shortr08) SELECT ROUND(SUM(carrvol)/1000, 2) "OB" ,
                                                        ROUND(SUM(CASE
                                                                      WHEN stato40 IN ('85', '90') THEN carrvol
                                                                      ELSE 0
                                                                  END)/1000, 2) "OB_finish"
   FROM MAIN
   WHERE shortr08 IS NOT NULL) "SQL2"