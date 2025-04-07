
SELECT trim(BOTH
            FROM "L30T1"."MHA") "WhsLoc_MhaName",
       "L30T1"."LOCTYPE" "WhsLoc_L30_LocType",
       CASE
           WHEN "L30T1"."LOCSTAT"=2 THEN 'Frei'
       END "WhsLoc_Status",
       count(concat(concat("L30T1"."RACK", "L30T1"."HORCOOR"), trim(BOTH
                                                                    FROM "L30T1"."VERCOOR"))) "WhsLoc_PlaceCount",
       "L30T1"."NOINLOC" "WhsLoc_Qty"
FROM "L30T1" "L30T1"
WHERE trim(BOTH
           FROM "L30T1"."MHA") IN ('54R1')
  AND "L30T1"."NOINLOC" IN (1)
  AND "L30T1"."LOCTYPE" NOT IN ('   ',
                                'DA ',
                                'DWZ',
                                'FM ',
                                'FS ',
                                'ISA',
                                'ITM',
                                'ITS',
                                'ML ',
                                'MLF',
                                'NA ',
                                'OTM',
                                'OTS')
  AND CASE
          WHEN ("L30T1"."LOCSTAT"=2) THEN 'Frei'
      END IN ('Frei')
GROUP BY trim(BOTH
              FROM "L30T1"."MHA"),
         "L30T1"."LOCTYPE",
         CASE
             WHEN "L30T1"."LOCSTAT"=2 THEN 'Frei'
         END,
         "L30T1"."NOINLOC"