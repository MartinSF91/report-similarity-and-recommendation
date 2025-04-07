
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       CASE
           WHEN "L10T1"."AISLE"=101 THEN 'AA'
           WHEN "L10T1"."AISLE"=102 THEN 'BB'
           WHEN "L10T1"."AISLE"=103 THEN 'CC'
           WHEN "L10T1"."AISLE"=104 THEN 'DD'
           WHEN "L10T1"."AISLE"=105 THEN 'EE'
           WHEN "L10T1"."AISLE"=106 THEN 'FF'
           WHEN "L10T1"."AISLE"=107 THEN 'GG'
           WHEN "L10T1"."AISLE"=108 THEN 'HH'
           WHEN "L10T1"."AISLE"=109 THEN 'II'
           WHEN "L10T1"."AISLE"=110 THEN 'JJ'
           WHEN "L10T1"."AISLE"=111 THEN 'KK'
           WHEN "L10T1"."AISLE"=112 THEN 'LL'
           WHEN "L10T1"."AISLE"=113 THEN 'MM'
           WHEN "L10T1"."AISLE"=114 THEN 'NN'
           WHEN "L10T1"."AISLE"=115 THEN 'WW'
           WHEN "L10T1"."AISLE"=116 THEN 'WW'
       END "c3",
       "L30T1"."NOINLOC" "WhsLoc_Qty",
       trim(BOTH
            FROM "G08T1"."VERCOOR") "StoPal_VerCoor",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount"
FROM "L30T1" "L30T1",
     "L10T1" "L10T1",
     "G08T1" "G08T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('54R1')
  AND "L30T1"."LOCTYPE" NOT IN ('   ',
                                'DA ',
                                'DWZ',
                                'FM ',
                                'FS ',
                                'ITM',
                                'ITS',
                                'ISA',
                                'ML ',
                                'MLF',
                                'NA ',
                                'OTM',
                                'OTS')
  AND "L30T1"."NOINLOC" IN (1)
  AND trim(BOTH
           FROM "G08T1"."VERCOOR") NOT IN ('12',
                                           '13')
  AND "G08T1"."MHA"="L30T1"."MHA"
  AND "G08T1"."RACK"="L30T1"."RACK"
  AND "G08T1"."HORCOOR"="L30T1"."HORCOOR"
  AND "G08T1"."VERCOOR"="L30T1"."VERCOOR"
  AND "L30T1"."RACK"="L10T1"."RACK"
  AND "L30T1"."MHA"="L10T1"."MHA"
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."LOCTYPE",
         CASE
             WHEN "L10T1"."AISLE"=101 THEN 'AA'
             WHEN "L10T1"."AISLE"=102 THEN 'BB'
             WHEN "L10T1"."AISLE"=103 THEN 'CC'
             WHEN "L10T1"."AISLE"=104 THEN 'DD'
             WHEN "L10T1"."AISLE"=105 THEN 'EE'
             WHEN "L10T1"."AISLE"=106 THEN 'FF'
             WHEN "L10T1"."AISLE"=107 THEN 'GG'
             WHEN "L10T1"."AISLE"=108 THEN 'HH'
             WHEN "L10T1"."AISLE"=109 THEN 'II'
             WHEN "L10T1"."AISLE"=110 THEN 'JJ'
             WHEN "L10T1"."AISLE"=111 THEN 'KK'
             WHEN "L10T1"."AISLE"=112 THEN 'LL'
             WHEN "L10T1"."AISLE"=113 THEN 'MM'
             WHEN "L10T1"."AISLE"=114 THEN 'NN'
             WHEN "L10T1"."AISLE"=115 THEN 'WW'
             WHEN "L10T1"."AISLE"=116 THEN 'WW'
         END,
         "L30T1"."NOINLOC",
         trim(BOTH
              FROM "G08T1"."VERCOOR")