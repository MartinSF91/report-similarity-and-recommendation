/* user=Vibhavari Bharat Nandre reportPath= report= queryName=Query2 REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=ljM2MdMdjllhMyMlhGqGllylyl99vy8ssCM98dd8 */
SELECT DISTINCT "Query1"."DIVCODE" AS "DIVCODE",
                "Query1"."Module_1_3_DC" AS "Module_1_3_DC",
                "Query1"."Module_4_5_CDC" AS "Module_4_5_CDC",
                "Query1"."Total" AS "Total",
                "Query1"."MaxCapacity" AS "MaxCapacity",
                "Query1"."Total" / NULLIF("Query1"."MaxCapacity", 0) AS "FillRate"
FROM
  (SELECT DISTINCT "SQL1"."DIVCODE" AS "DIVCODE",
                   "SQL1"."Module 1-3 DC" AS "Module_1_3_DC",
                   "SQL1"."Module 4-5 CDC" AS "Module_4_5_CDC",
                   "SQL1"."Total" AS "Total",
                   "SQL1"."MaxCapacity" AS "MaxCapacity"
   FROM
     (WITH stu AS
        (SELECT divcode,
                shortl62,
                mha,
                building,
                ecarrno,
                amooncr,
                amooncr*scnetvol/1000 ulvol
         FROM
           (SELECT l62t1.divcode,
                   g08t1.shortl62,
                   shortdwp,
                   G08T1.mha,
                   (CASE
                        WHEN ma_group IN ('111',
                                          '112',
                                          '115',
                                          '116',
                                          '118',
                                          '121',
                                          '122',
                                          '125',
                                          '131',
                                          '132',
                                          '135',
                                          '136',
                                          '199',
                                          '1E1',
                                          '1E3',
                                          '1W1',
                                          '1W3') THEN ' Module 1-3 DC'
                        WHEN ma_group IN ('141',
                                          '142',
                                          '145',
                                          '146',
                                          '147',
                                          '148',
                                          '149',
                                          '151',
                                          '152',
                                          '155',
                                          '156',
                                          '157',
                                          '159') THEN ' Module 4-5 CDC'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='8' THEN 'Ext8 Moorebank'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='9' THEN 'Ext9 MPark'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='7' THEN 'Ext7 Container Storage'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='6' THEN 'Ext6 IKEA-Pemulwuy'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='5' THEN ' Module 1-3 DC'
                        WHEN SUBSTR(g08t1.mha, 1, 1)='4' THEN 'Ext4 IKEA-Moorebank'
                        ELSE 'Others'
                    END) building,
                   ecarrno,
                   amooncr
            FROM g08T1,
                 w08t1,
                 l62t1,
                 g08t90
            WHERE amooncr>0
              AND g08t1.mha=w08t1.member
              AND g08t1.shortl62>100000
              AND g08t1.shortl62=l62t1.shortl62
              AND g08t1.carrno=g08t90.carrno
              AND divcode<>'AL') A
         LEFT JOIN
           (SELECT DISTINCT DWPKEY.shortdwp,
                            DWPKEY.itemno,
                            DWPKEY.bucodsup,
                            DWPKEY.fpacdate,
                            DWPKEY.reqdwped,
                            scnetvol
            FROM DWPKEY,
                 DWPACT,

              (SELECT itemno,
                      bucodsup,
                      fpacdate,
                      reqdwped,
                      reqdwpno,
                      max(iipupdat) iipupdat
               FROM DWPACT
               GROUP BY itemno,
                        bucodsup,
                        fpacdate,
                        reqdwped,
                        reqdwpno) rt1
            WHERE DWPKEY.fpacdate=DWPACT.fpacdate
              AND DWPKEY.reqdwped=DWPACT.reqdwped
              AND DWPKEY.reqdwpno=DWPACT.reqdwpno
              AND DWPKEY.itemtype=DWPACT.itemtype
              AND DWPKEY.butypsup=DWPACT.butypsup
              AND DWPKEY.itemno||DWPKEY.bucodsup=DWPACT.itemno||DWPACT.bucodsup
              AND DWPACT.iipupdat=rt1.iipupdat
              AND DWPACT.itemno||DWPACT.bucodsup=rt1.itemno||rt1.bucodsup
              AND rt1.fpacdate=DWPACT.fpacdate
              AND rt1.reqdwped=DWPACT.reqdwped
              AND rt1.reqdwpno=DWPACT.reqdwpno) B ON A.shortdwp=B.shortdwp) SELECT divcode,
                                                                                   Sum("Module 1-3 DC") "Module 1-3 DC",
                                                                                   sum("Module 4-5 CDC")"Module 4-5 CDC",
                                                                                   Sum("Module 1-3 DC")+sum("Module 4-5 CDC") "Total",
                                                                                   (CASE
                                                                                        WHEN divcode='015' THEN 65776
                                                                                        ELSE 20052
                                                                                    END) "MaxCapacity"
      FROM
        (SELECT divcode,
                (CASE
                     WHEN building=' Module 1-3 DC' THEN sum(ulvol)
                     ELSE 0
                 END) "Module 1-3 DC",
                (CASE
                     WHEN building=' Module 4-5 CDC' THEN sum(ulvol)
                     ELSE 0
                 END) "Module 4-5 CDC"
         FROM stu
         GROUP BY divcode,
                  building)
      GROUP BY divcode) "SQL1") "Query1"