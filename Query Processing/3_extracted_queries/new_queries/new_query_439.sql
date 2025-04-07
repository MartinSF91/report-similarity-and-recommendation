
SELECT "LOC7"."PARTNO" "c0",
       "LOC7"."PARTREV" "c1",
       "LOC7"."PARTDSC1" "c2",
       "LOC7"."MHA" "c3",
       "LOC7"."RACK" "c4",
       "LOC7"."HORCOOR" "c5",
       "LOC7"."VERCOOR" "c6",
       "LOC7"."AMOONCR" "c7",
       "LOC7"."MA_LOCK" "c8",
       "LOC7"."LOCKCODE" "c9",
       "LOC7"."ECARRNO" "c10"
FROM
  (SELECT DISTINCT trim(BOTH
                        FROM "SQL1"."PARTNO") "PARTNO",
                   "SQL1"."PARTREV" "PARTREV",
                   "SQL1"."PARTDSC1" "PARTDSC1",
                   "SQL1"."MHA" "MHA",
                   "SQL1"."RACK" "RACK",
                   "SQL1"."HORCOOR" "HORCOOR",
                   "SQL1"."VERCOOR" "VERCOOR",
                   "SQL1"."AMOONCR" "AMOONCR",
                   "SQL1"."MA_LOCK" "MA_LOCK",
                   "SQL1"."LOCKCODE" "LOCKCODE",
                   "SQL1"."ECARRNO" "ECARRNO"
   FROM
     (SELECT g08.partno,
             g08.partrev,
             g08.partdsc1,
             g08.ecarrno,
             g08.mha,
             g08.rack,
             g08.horcoor,
             g08.vercoor,
             g08.amooncr,
             g08.ma_lock,
             g08.lockcode
      FROM ASTRO.ASTRO_VIEW_CNT_G08T1 g08
      WHERE g08.carrtype = '0'
        AND g08.carrstat = '6') "SQL1") "LOC7"
ORDER BY "c0" ASC NULLS LAST
SELECT "EDS_SQL6"."END_DATE_SALE",
       "EDS_SQL6"."ITEM_ID"
FROM
  (SELECT DISTINCT "eds"."ITEM_ID" "ITEM_ID",
                   "eds"."END_DATE_SALE" "END_DATE_SALE"
   FROM
     (SELECT ITEM_RU.ITEM_ID,
             ITEM_RU.ITEM_TYPE,
             ITEM_RU.RU_CODE,
             ITEM_RU.END_DATE_SALE
      FROM ITEM_RU
      WHERE ITEM_RU.RU_CODE = 'CA') "eds"
   WHERE "eds"."END_DATE_SALE">=CAST((:PQ1) AS TIMESTAMP)
     AND "eds"."END_DATE_SALE"<=CAST((:PQ2) AS TIMESTAMP)) "EDS_SQL6"