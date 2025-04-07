SELECT AL4.BU_CODE_DT,
       AL1.BU_CODE_RCV,
       CONCAT(CONCAT(CONCAT(CONCAT (AL4.BU_CODE_CRE_SHP, '-'), AL4.BU_TYPE_CRE_SHP), '-'), AL4.SHP_NO) AS SHIPID,
       AL1.ITEM_ID,
       AL1.BU_CODE_SUP,
       AL1.ITEM_QTY_ORD,
       AL1.ITEM_QTY_DSP,
       AL1.ORDER_DATE,
       AL1.DSP_DATE_LATEST,
       AL1.MHS_ORD_TYPE,
       AL1.MHS_ORD_INDX,
       TO_CHAR (AL1.ORDER_DATE,
                'DAY')AS ORDERDAY,
               AL1.BU_CODE_CRE,
               AL6.ITEM_QTY_PALL AS SPQ,
               (((AL6.ITEM_LEN/100)*(AL6.ITEM_WID/100)*(AL6.ITEM_HEI/100))/1000) AS ARTVOL,
               AL1.STATUS,
               AL1.PICK_GROUP,
               AL6.ITEM_WEI_GRO,
               AL1.ORDER_ID,
               AL1.BU_CODE_DT_FILL,
               AL7.ITEM_NAME,
               AL1.COMMENTS,
               AL1.ORDER_TYPE,
               AL8.NAME AS ORDERTYPENAME,
               AL2.ASTRO_ORD_ID
FROM GEMINI.ORDERS AL1,
     GEMINI.OPERATIONAL_ORDER AL2,
     GEMINI.OUT_LOADING_UNIT_TRIP_UI AL4,
     GEMINI.ITEM_DT AL5,
     GEMINI.ITEM_SUP AL6,
     GEMINI.ITEM_LANG AL7,
     GEMINI.ORDER_TYPE_DICT AL8
WHERE (AL2.ASTRO_TRIP_ID = AL4.ASTRO_TRIP_ID (+)
       AND AL2.ORDER_ID =AL1.ORDER_ID
       AND AL5.ITEM_ID =AL1.ITEM_ID
       AND AL1.ITEM_TYPE =AL5.ITEM_TYPE
       AND AL6.ITEM_ID =AL5.ITEM_ID
       AND AL5.BU_CODE_SUP_PREF =AL6.BU_CODE_SUP
       AND AL5.BU_CODE_DT =AL1.BU_CODE_DT_FILL
       AND AL1.ITEM_ID =AL7.ITEM_ID
       AND AL1.ITEM_TYPE =AL7.ITEM_TYPE
       AND AL5.ITEM_TYPE =AL6.ITEM_TYPE
       AND AL1.ORDER_TYPE =AL8.ORDER_TYPE)
  AND ((TRUNC(AL1.ORDER_DATE) >= TRUNC (SYSDATE - 7)
        AND (NOT AL1.STATUS ='99')
        AND AL1.BU_CODE_DT_FILL ='532'
        AND AL1.BU_CODE_RCV IN ('003',
                                '028',
                                '064',
                                '103',
                                '157',
                                '165',
                                '216',
                                '250',
                                '313',
                                '347',
                                '349')
        AND AL7.LANG_CODE ='GB'
        AND AL1.ORDER_TYPE IN ('MSR',
                               'R',
                               'SH')))