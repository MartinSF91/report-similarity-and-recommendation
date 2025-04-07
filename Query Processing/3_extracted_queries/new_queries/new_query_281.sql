SELECT A1.ITEM_ID||'-'||A1.BU_CODE_SUP "ARTSUP",
       A1.WS_CODE,
       A1.FYT "Tertial Pricing",
       CASE
           WHEN A2.UNIT_NO = '02' THEN (A1.ART_PRI_CALC_17/100)
           ELSE A1.ART_PRI_CALC_17
       END ART_PRI_CALC_17,
       A2.UNIT_NO,
       A2.PA_NO,
       SUBSTR(A2.PA_NO, 1, 2) "HFB"
FROM GEMINI.ITEM_SUP_WS_FYT A1,
     GEMINI.ITEM A2,

  (SELECT A2.ITEM_ID||'-'||A2.BU_CODE_SUP artsup,
          A2.WS_CODE,
          MAX(A2.FYT) maxfyt
   FROM GEMINI.ITEM_SUP_WS_FYT A2
   WHERE --UPDATE TO LUS for EAST or LUW for West
 A2.WS_CODE IN ('LUS')
     AND A2.FYT <= (CASE
                        WHEN TO_CHAR(SYSDATE, 'MM') IN ('09',
                                                        '10',
                                                        '11',
                                                        '12') THEN TO_CHAR(add_months(sysdate, 12), 'YYYY')
                        ELSE TO_CHAR(sysdate, 'YYYY')
                    END|| CASE
                              WHEN TO_CHAR(SYSDATE, 'MM') IN ('09',
                                                              '10',
                                                              '11',
                                                              '12') THEN '1'
                              WHEN TO_CHAR(SYSDATE, 'MM') IN ('01',
                                                              '02',
                                                              '03',
                                                              '04') THEN '2'
                              WHEN TO_CHAR(SYSDATE, 'MM') IN ('05',
                                                              '06',
                                                              '07',
                                                              '08') THEN '3'
                              ELSE '0'
                          END)
   GROUP BY A2.ITEM_ID||'-'||A2.BU_CODE_SUP,
            A2.WS_CODE) A3
WHERE --UPDATE TO LUS for EAST or LUW for West
 A1.WS_CODE IN ('LUS')
  AND A1.ITEM_ID = A2.ITEM_ID
  AND A1.ITEM_ID||'-'||A1.BU_CODE_SUP = A3.artsup
  AND A1.WS_CODE = A3.WS_CODE
  AND A1.FYT = A3.maxfyt