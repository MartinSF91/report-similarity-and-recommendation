SELECT trim(BOTH
            FROM "C_246Pool0530SQL"."CARRIER") "Carrier",
       "C_246Pool0530SQL"."LUTYPE" "LuType",
       to_number("C_246Pool0530SQL"."_Def Empty") "Damaged_Equipment",
       "C_246Pool0530SQL"."_Def Full" "C__Def_Full",
       to_number("C_246Pool0530SQL"."_Inb Full") "Loaded_Inbound_Unit",
       "C_246Pool0530SQL"."_Empty" "C__Empty",
       "C_246Pool0530SQL"."_Pl Empty" "C__Pl_Empty",
       to_number("C_246Pool0530SQL"."_All Empty") "Equipment_Available",
       CASE
           WHEN to_number("C_246Pool0530SQL"."_Pl Empty today") IS NULL THEN 0
           ELSE to_number("C_246Pool0530SQL"."_Pl Empty today")
       END "Planned_Loads",
       to_number("C_246Pool0530SQL"."_Load yesterday") "Cut_Off_Yesterday",
       "C_246Pool0530SQL"."_Summe" "C__Summe",
       "C_246Pool0530SQL"."_COUNT" "C__COUNT",
       min("C_246Pool0530SQL"."_Summe") "Summary__Summe_",
       min("C_246Pool0530SQL"."_COUNT") "Summary__COUNT_",
       CASE
           WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '26'
           WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
           WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '6'
           WHEN "C_246Pool0530SQL"."CARRIER"='LKW Walter'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '8'
           WHEN "C_246Pool0530SQL"."CARRIER"='DHL Freight Gmb'
                AND "C_246Pool0530SQL"."LUTYPE"='S45' THEN to_number("C_246Pool0530SQL"."_All Empty") - '8'
           WHEN "C_246Pool0530SQL"."CARRIER"='SCHWARZ GMBH'
                AND "C_246Pool0530SQL"."LUTYPE"='S50' THEN to_number("C_246Pool0530SQL"."_All Empty") - '34'
           WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '68'
           WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                AND "C_246Pool0530SQL"."LUTYPE"='T80LB' THEN to_number("C_246Pool0530SQL"."_All Empty") - '0'
           WHEN "C_246Pool0530SQL"."CARRIER"='GEODIS'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '1'
           WHEN "C_246Pool0530SQL"."CARRIER"='KLOG'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '19'
           WHEN "C_246Pool0530SQL"."CARRIER"='GOPET'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
           WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '25'
           WHEN "C_246Pool0530SQL"."CARRIER"='EWALS'
                AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '11'
           WHEN "C_246Pool0530SQL"."CARRIER"='LKW Walter'
                AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '40'
           WHEN "C_246Pool0530SQL"."CARRIER"='P&O FERRYMASTER'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '15'
           WHEN "C_246Pool0530SQL"."CARRIER"='KLOG'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
           WHEN "C_246Pool0530SQL"."CARRIER"='CONTAINERSHIPS'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
           WHEN "C_246Pool0530SQL"."CARRIER"='DSV Road GmbH'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '6'
           WHEN "C_246Pool0530SQL"."CARRIER"='Codognotto Pols'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
           WHEN "C_246Pool0530SQL"."CARRIER"='BRING'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
           WHEN "C_246Pool0530SQL"."CARRIER"='NOTHEGGER Trans'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '13'
           WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                AND "C_246Pool0530SQL"."LUTYPE"='T80LB' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
           WHEN "C_246Pool0530SQL"."CARRIER"='Hellmann'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
           WHEN "C_246Pool0530SQL"."CARRIER"='GARTNER'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
           WHEN "C_246Pool0530SQL"."CARRIER"='WABERER'
                AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '1'
           WHEN "C_246Pool0530SQL"."CARRIER"='CTJ Janssen Gmb'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
           WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '24'
           WHEN "C_246Pool0530SQL"."CARRIER"='DFDS LOGISTICS'
                AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
           WHEN "C_246Pool0530SQL"."CARRIER"='ERONTRANS SP. Z'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '11'
           WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                AND "C_246Pool0530SQL"."LUTYPE"='RT150' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
           WHEN "C_246Pool0530SQL"."CARRIER"='EUROPEGAZ'
                AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
       END "min_pool_werte",
       to_number(CASE
                     WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                          AND "C_246Pool0530SQL"."LUTYPE"='T90' THEN '3'
                     WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                          AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN '6'
                     WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                          AND "C_246Pool0530SQL"."LUTYPE"='S45' THEN '2'
                     WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                          AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN '2'
                     WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                          AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN '18'
                     WHEN "C_246Pool0530SQL"."CARRIER"='GARTNER'
                          AND "C_246Pool0530SQL"."LUTYPE"='T110' THEN '32'
                     WHEN "C_246Pool0530SQL"."CARRIER"='SENNDER GMBH'
                          AND "C_246Pool0530SQL"."LUTYPE"='T90' THEN '25'
                 END) "Min__Pool"
FROM "C_246Pool0530SQL"
WHERE "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
  AND "C_246Pool0530SQL"."LUTYPE"='T90'
  OR "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
  AND "C_246Pool0530SQL"."LUTYPE"='T100'
  OR "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
  AND "C_246Pool0530SQL"."LUTYPE"='S45'
  OR "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW'
  OR "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
  AND "C_246Pool0530SQL"."LUTYPE"='T100'
  OR "C_246Pool0530SQL"."CARRIER"='GARTNER'
  AND "C_246Pool0530SQL"."LUTYPE"='T110'
  OR "C_246Pool0530SQL"."CARRIER"='SENNDER GMBH'
  AND "C_246Pool0530SQL"."LUTYPE"='T90'
GROUP BY trim(BOTH
              FROM "C_246Pool0530SQL"."CARRIER"),
         "C_246Pool0530SQL"."LUTYPE",
         to_number("C_246Pool0530SQL"."_Def Empty"),
         "C_246Pool0530SQL"."_Def Full",
         to_number("C_246Pool0530SQL"."_Inb Full"),
         "C_246Pool0530SQL"."_Empty",
         "C_246Pool0530SQL"."_Pl Empty",
         to_number("C_246Pool0530SQL"."_All Empty"),
         CASE
             WHEN to_number("C_246Pool0530SQL"."_Pl Empty today") IS NULL THEN 0
             ELSE to_number("C_246Pool0530SQL"."_Pl Empty today")
         END,
         to_number("C_246Pool0530SQL"."_Load yesterday"),
         "C_246Pool0530SQL"."_Summe",
         "C_246Pool0530SQL"."_COUNT",
         CASE
             WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '26'
             WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
             WHEN "C_246Pool0530SQL"."CARRIER"='Van Dieren'
                  AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '6'
             WHEN "C_246Pool0530SQL"."CARRIER"='LKW Walter'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '8'
             WHEN "C_246Pool0530SQL"."CARRIER"='DHL Freight Gmb'
                  AND "C_246Pool0530SQL"."LUTYPE"='S45' THEN to_number("C_246Pool0530SQL"."_All Empty") - '8'
             WHEN "C_246Pool0530SQL"."CARRIER"='SCHWARZ GMBH'
                  AND "C_246Pool0530SQL"."LUTYPE"='S50' THEN to_number("C_246Pool0530SQL"."_All Empty") - '34'
             WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '68'
             WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                  AND "C_246Pool0530SQL"."LUTYPE"='T80LB' THEN to_number("C_246Pool0530SQL"."_All Empty") - '0'
             WHEN "C_246Pool0530SQL"."CARRIER"='GEODIS'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '1'
             WHEN "C_246Pool0530SQL"."CARRIER"='KLOG'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '19'
             WHEN "C_246Pool0530SQL"."CARRIER"='GOPET'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
             WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '25'
             WHEN "C_246Pool0530SQL"."CARRIER"='EWALS'
                  AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '11'
             WHEN "C_246Pool0530SQL"."CARRIER"='LKW Walter'
                  AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '40'
             WHEN "C_246Pool0530SQL"."CARRIER"='P&O FERRYMASTER'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '15'
             WHEN "C_246Pool0530SQL"."CARRIER"='KLOG'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
             WHEN "C_246Pool0530SQL"."CARRIER"='CONTAINERSHIPS'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
             WHEN "C_246Pool0530SQL"."CARRIER"='DSV Road GmbH'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '6'
             WHEN "C_246Pool0530SQL"."CARRIER"='Codognotto Pols'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
             WHEN "C_246Pool0530SQL"."CARRIER"='BRING'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '3'
             WHEN "C_246Pool0530SQL"."CARRIER"='NOTHEGGER Trans'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '13'
             WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                  AND "C_246Pool0530SQL"."LUTYPE"='T80LB' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
             WHEN "C_246Pool0530SQL"."CARRIER"='Hellmann'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
             WHEN "C_246Pool0530SQL"."CARRIER"='GARTNER'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
             WHEN "C_246Pool0530SQL"."CARRIER"='WABERER'
                  AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '1'
             WHEN "C_246Pool0530SQL"."CARRIER"='CTJ Janssen Gmb'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
             WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                  AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN to_number("C_246Pool0530SQL"."_All Empty") - '24'
             WHEN "C_246Pool0530SQL"."CARRIER"='DFDS LOGISTICS'
                  AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN to_number("C_246Pool0530SQL"."_All Empty") - '5'
             WHEN "C_246Pool0530SQL"."CARRIER"='ERONTRANS SP. Z'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '11'
             WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                  AND "C_246Pool0530SQL"."LUTYPE"='RT150' THEN to_number("C_246Pool0530SQL"."_All Empty") - '2'
             WHEN "C_246Pool0530SQL"."CARRIER"='EUROPEGAZ'
                  AND "C_246Pool0530SQL"."LUTYPE"='T90L' THEN to_number("C_246Pool0530SQL"."_All Empty") - '4'
         END,
         to_number(CASE
                       WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                            AND "C_246Pool0530SQL"."LUTYPE"='T90' THEN '3'
                       WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                            AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN '6'
                       WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                            AND "C_246Pool0530SQL"."LUTYPE"='S45' THEN '2'
                       WHEN "C_246Pool0530SQL"."CARRIER"='BLG Cargo Logis'
                            AND "C_246Pool0530SQL"."LUTYPE"='C45HPW' THEN '2'
                       WHEN "C_246Pool0530SQL"."CARRIER"='UAB Girteka log'
                            AND "C_246Pool0530SQL"."LUTYPE"='T100' THEN '18'
                       WHEN "C_246Pool0530SQL"."CARRIER"='GARTNER'
                            AND "C_246Pool0530SQL"."LUTYPE"='T110' THEN '32'
                       WHEN "C_246Pool0530SQL"."CARRIER"='SENNDER GMBH'
                            AND "C_246Pool0530SQL"."LUTYPE"='T90' THEN '25'
                   END)