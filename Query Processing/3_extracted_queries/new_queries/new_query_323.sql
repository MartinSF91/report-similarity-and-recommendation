/* user=Jhanvi Nandani reportPath= report= queryName=Gemini REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=G9lGGdwj8j8d2sqClC8lMs4qjj8w94Cwwqdyd9q8 */
SELECT DISTINCT "SQL1"."Date" AS "Date0",
                "SQL1"."STATUS" AS "STATUS",
                "SQL1"."SHIPMENT_NO" AS "SHIPMENT_NO",
                "SQL1"."BU_CODE_END" AS "BU_CODE_END",
                "SQL1"."DAYS_TO_CLOSE" AS "DAYS_TO_CLOSE",
                "SQL1"."TOTAL_VOLUME" AS "TOTAL_VOLUME"
FROM
  (--Arrived last week
SELECT TO_CHAR(ACT_END_DATE, 'MM/DD/YYYY') "Date",
       'Arrived' Status,
                 shipment_no,
                 BU_CODE_END,
                 NULL days_to_close,
                      SUM(volume) Total_Volume
   FROM
     (SELECT AL1.CSM_NO,
             AL1.CSML_NO,
             AL1.CSML_NO_GEM,
             AL1.CSML_NO_SET,
             AL1.ITEM_ID,
             AL1.ITEM_TYPE,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.BU_CODE_RCV_RESTEER,
             AL1.BU_TYPE_RCV_RESTEER,
             AL2.BU_CODE_CRE_SHP||'-'||AL2.BU_TYPE_CRE_SHP||'-'||AL2.SHP_NO shipment_no,
             AL4.ACT_END_DATE,
             AL4.BU_CODE_END,
             AL1.Item_qty_dsp,
             CASE
                 WHEN AL4.UNIT_NO = '02' THEN (((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))* AL1.Item_qty_dsp)/100
                 ELSE ((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))*AL1.Item_qty_dsp
             END volume
      FROM IN_CONSIGNMENT_LINE AL1
      INNER JOIN IN_CONNECTED_CONSIGNMENT AL2 ON (AL2.CSM_NO=AL1.CSM_NO
                                                  AND AL2.BU_CODE_CRE_CSM=AL1.BU_CODE_CRE_CSM
                                                  AND AL2.BU_TYPE_CRE_CSM=AL1.BU_TYPE_CRE_CSM
                                                  AND AL2.BU_CODE_DT=AL1.BU_CODE_DT
                                                  AND AL2.BU_TYPE_DT=AL1.BU_TYPE_DT)
      INNER JOIN ITEM_SUP AL3 ON (AL1.ITEM_ID = AL3.ITEM_ID
                                  AND AL1.BU_CODE_SUP = AL3.BU_CODE_SUP)
      INNER JOIN ITEM AL4 ON (AL1.ITEM_ID = AL4.ITEM_ID)
      INNER JOIN GEMINI.IN_LOADING_UNIT_TRIP AL4 ON (AL2.SHP_NO = AL4.SHP_NO
                                                     AND AL2.BU_CODE_CRE_SHP = AL4.BU_CODE_CRE_SHP
                                                     AND AL2.BU_TYPE_CRE_SHP = AL4.BU_TYPE_CRE_SHP
                                                     AND AL2.BU_CODE_END = AL4.BU_CODE_END
                                                     AND AL2.BU_TYPE_END = AL4.BU_TYPE_END)
      WHERE AL1.BU_CODE_RCV_RESTEER IS NOT NULL
        AND AL4.ACT_END_DATE BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
        AND AL1.ITEM_TYPE='ART'
        AND AL2.BU_TYPE_END = 'DT')
   GROUP BY TO_CHAR(ACT_END_DATE, 'MM/DD/YYYY'),
            'Arrived',
            shipment_no,
            BU_CODE_END
   UNION --Arrived last week
SELECT TO_CHAR(CLOSED_DATE, 'MM/DD/YYYY') "Date",
       'Closed' Status,
                shipment_no,
                BU_CODE_END,
                ROUND(CLOSED_DATE -ACT_END_DATE, 2) days_to_close,
                SUM(volume) Total_Volume
   FROM
     (SELECT AL1.CSM_NO,
             AL1.CSML_NO,
             AL1.CSML_NO_GEM,
             AL1.CSML_NO_SET,
             AL1.ITEM_ID,
             AL1.ITEM_TYPE,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.BU_CODE_RCV_RESTEER,
             AL1.BU_TYPE_RCV_RESTEER,
             AL2.BU_CODE_CRE_SHP||'-'||AL2.BU_TYPE_CRE_SHP||'-'||AL2.SHP_NO shipment_no,
             AL2.CLOSED_DATE,
             AL4.ACT_END_DATE,
             AL4.BU_CODE_END,
             AL1.Item_qty_dsp,
             CASE
                 WHEN AL4.UNIT_NO = '02' THEN (((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))* AL1.Item_qty_dsp)/100
                 ELSE ((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))*AL1.Item_qty_dsp
             END volume
      FROM IN_CONSIGNMENT_LINE AL1
      INNER JOIN IN_CONNECTED_CONSIGNMENT AL2 ON (AL2.CSM_NO=AL1.CSM_NO
                                                  AND AL2.BU_CODE_CRE_CSM=AL1.BU_CODE_CRE_CSM
                                                  AND AL2.BU_TYPE_CRE_CSM=AL1.BU_TYPE_CRE_CSM
                                                  AND AL2.BU_CODE_DT=AL1.BU_CODE_DT
                                                  AND AL2.BU_TYPE_DT=AL1.BU_TYPE_DT)
      INNER JOIN ITEM_SUP AL3 ON (AL1.ITEM_ID = AL3.ITEM_ID
                                  AND AL1.BU_CODE_SUP = AL3.BU_CODE_SUP)
      INNER JOIN ITEM AL4 ON (AL1.ITEM_ID = AL4.ITEM_ID)
      INNER JOIN GEMINI.IN_LOADING_UNIT_TRIP AL4 ON (AL2.SHP_NO = AL4.SHP_NO
                                                     AND AL2.BU_CODE_CRE_SHP = AL4.BU_CODE_CRE_SHP
                                                     AND AL2.BU_TYPE_CRE_SHP = AL4.BU_TYPE_CRE_SHP
                                                     AND AL2.BU_CODE_END = AL4.BU_CODE_END
                                                     AND AL2.BU_TYPE_END = AL4.BU_TYPE_END)
      WHERE AL1.BU_CODE_RCV_RESTEER IS NOT NULL
        AND AL2.CLOSED_DATE BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
        AND AL1.ITEM_TYPE='ART'
        AND AL2.BU_TYPE_END = 'DT')
   GROUP BY TO_CHAR(CLOSED_DATE, 'MM/DD/YYYY'),
            'Closed',
            shipment_no,
            BU_CODE_END,
            ROUND(CLOSED_DATE -ACT_END_DATE, 2)
   UNION SELECT NULL "Date",
                     'Remove' Status,
                              NULL shipment_no,
                                   '000' BU_CODE_END,
                                         NULL days_to_close,
                                              NULL Total_Volume
   FROM DUAL) "SQL1" /* user=Jhanvi Nandani reportPath= report= queryName=Gemini REMOTE_ADDR= SERVER_NAME=cognosanalytics.apps.ikea.com requestID=G9lGGdwj8j8d2sqClC8lMs4qjj8w94Cwwqdyd9q8 */
SELECT DISTINCT "SQL2"."Date" AS "Date0",
                "SQL2"."STATUS" AS "STATUS",
                "SQL2"."SHIPMENT_NO" AS "SHIPMENT_NO",
                "SQL2"."BU_CODE_END" AS "BU_CODE_END",
                "SQL2"."DAYS_TO_CLOSE" AS "DAYS_TO_CLOSE",
                "SQL2"."TOTAL_VOLUME" AS "TOTAL_VOLUME"
FROM
  (--Arrived last week
SELECT TO_CHAR(ACT_END_DATE, 'MM/DD/YYYY') "Date",
       'Arrived' Status,
                 shipment_no,
                 BU_CODE_END,
                 NULL days_to_close,
                      SUM(volume) Total_Volume
   FROM
     (SELECT AL1.CSM_NO,
             AL1.CSML_NO,
             AL1.CSML_NO_GEM,
             AL1.CSML_NO_SET,
             AL1.ITEM_ID,
             AL1.ITEM_TYPE,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.BU_CODE_RCV_RESTEER,
             AL1.BU_TYPE_RCV_RESTEER,
             AL2.BU_CODE_CRE_SHP||'-'||AL2.BU_TYPE_CRE_SHP||'-'||AL2.SHP_NO shipment_no,
             AL4.ACT_END_DATE,
             AL4.BU_CODE_END,
             AL1.Item_qty_dsp,
             CASE
                 WHEN AL4.UNIT_NO = '02' THEN (((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))* AL1.Item_qty_dsp)/100
                 ELSE ((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))*AL1.Item_qty_dsp
             END volume
      FROM IN_CONSIGNMENT_LINE AL1
      INNER JOIN IN_CONNECTED_CONSIGNMENT AL2 ON (AL2.CSM_NO=AL1.CSM_NO
                                                  AND AL2.BU_CODE_CRE_CSM=AL1.BU_CODE_CRE_CSM
                                                  AND AL2.BU_TYPE_CRE_CSM=AL1.BU_TYPE_CRE_CSM
                                                  AND AL2.BU_CODE_DT=AL1.BU_CODE_DT
                                                  AND AL2.BU_TYPE_DT=AL1.BU_TYPE_DT)
      INNER JOIN ITEM_SUP AL3 ON (AL1.ITEM_ID = AL3.ITEM_ID
                                  AND AL1.BU_CODE_SUP = AL3.BU_CODE_SUP)
      INNER JOIN ITEM AL4 ON (AL1.ITEM_ID = AL4.ITEM_ID)
      INNER JOIN GEMINI.IN_LOADING_UNIT_TRIP AL4 ON (AL2.SHP_NO = AL4.SHP_NO
                                                     AND AL2.BU_CODE_CRE_SHP = AL4.BU_CODE_CRE_SHP
                                                     AND AL2.BU_TYPE_CRE_SHP = AL4.BU_TYPE_CRE_SHP
                                                     AND AL2.BU_CODE_END = AL4.BU_CODE_END
                                                     AND AL2.BU_TYPE_END = AL4.BU_TYPE_END)
      WHERE AL1.BU_CODE_RCV_RESTEER IS NOT NULL
        AND AL4.ACT_END_DATE BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
        AND AL1.ITEM_TYPE='ART'
        AND AL2.BU_TYPE_END = 'DT')
   GROUP BY TO_CHAR(ACT_END_DATE, 'MM/DD/YYYY'),
            'Arrived',
            shipment_no,
            BU_CODE_END
   UNION --Arrived last week
SELECT TO_CHAR(CLOSED_DATE, 'MM/DD/YYYY') "Date",
       'Closed' Status,
                shipment_no,
                BU_CODE_END,
                ROUND(CLOSED_DATE -ACT_END_DATE, 2) days_to_close,
                SUM(volume) Total_Volume
   FROM
     (SELECT AL1.CSM_NO,
             AL1.CSML_NO,
             AL1.CSML_NO_GEM,
             AL1.CSML_NO_SET,
             AL1.ITEM_ID,
             AL1.ITEM_TYPE,
             AL1.BU_CODE_SUP,
             AL1.BU_TYPE_SUP,
             AL1.BU_CODE_RCV_RESTEER,
             AL1.BU_TYPE_RCV_RESTEER,
             AL2.BU_CODE_CRE_SHP||'-'||AL2.BU_TYPE_CRE_SHP||'-'||AL2.SHP_NO shipment_no,
             AL2.CLOSED_DATE,
             AL4.ACT_END_DATE,
             AL4.BU_CODE_END,
             AL1.Item_qty_dsp,
             CASE
                 WHEN AL4.UNIT_NO = '02' THEN (((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))* AL1.Item_qty_dsp)/100
                 ELSE ((AL3.ITEM_LEN/1000)* (AL3.ITEM_WID/1000)* (AL3.ITEM_HEI/1000))*AL1.Item_qty_dsp
             END volume
      FROM IN_CONSIGNMENT_LINE AL1
      INNER JOIN IN_CONNECTED_CONSIGNMENT AL2 ON (AL2.CSM_NO=AL1.CSM_NO
                                                  AND AL2.BU_CODE_CRE_CSM=AL1.BU_CODE_CRE_CSM
                                                  AND AL2.BU_TYPE_CRE_CSM=AL1.BU_TYPE_CRE_CSM
                                                  AND AL2.BU_CODE_DT=AL1.BU_CODE_DT
                                                  AND AL2.BU_TYPE_DT=AL1.BU_TYPE_DT)
      INNER JOIN ITEM_SUP AL3 ON (AL1.ITEM_ID = AL3.ITEM_ID
                                  AND AL1.BU_CODE_SUP = AL3.BU_CODE_SUP)
      INNER JOIN ITEM AL4 ON (AL1.ITEM_ID = AL4.ITEM_ID)
      INNER JOIN GEMINI.IN_LOADING_UNIT_TRIP AL4 ON (AL2.SHP_NO = AL4.SHP_NO
                                                     AND AL2.BU_CODE_CRE_SHP = AL4.BU_CODE_CRE_SHP
                                                     AND AL2.BU_TYPE_CRE_SHP = AL4.BU_TYPE_CRE_SHP
                                                     AND AL2.BU_CODE_END = AL4.BU_CODE_END
                                                     AND AL2.BU_TYPE_END = AL4.BU_TYPE_END)
      WHERE AL1.BU_CODE_RCV_RESTEER IS NOT NULL
        AND AL2.CLOSED_DATE BETWEEN next_day(trunc(sysdate), 'Sunday') - 14 AND next_day(trunc(sysdate), 'Sunday') - 7
        AND AL1.ITEM_TYPE='ART'
        AND AL2.BU_TYPE_END = 'DT')
   GROUP BY TO_CHAR(CLOSED_DATE, 'MM/DD/YYYY'),
            'Closed',
            shipment_no,
            BU_CODE_END,
            ROUND(CLOSED_DATE -ACT_END_DATE, 2)
   UNION SELECT NULL "Date",
                     'Remove' Status,
                              NULL shipment_no,
                                   '000' BU_CODE_END,
                                         NULL days_to_close,
                                              NULL Total_Volume
   FROM DUAL) "SQL2"