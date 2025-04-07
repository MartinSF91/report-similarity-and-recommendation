SELECT "T0"."C0" "VICOrdLin_ArtNo",
       "T0"."C1" "VICOrdLin_SupNo",
       "T0"."C2" "ArtFea_RefKey_L62",
       "T0"."C3" "ARTName",
       "T0"."C4" "VICOrdLin_QtyReq",
       "T0"."C5" "StoBal_PickBal",
       "T0"."C6" - "T0"."C4" "Datenelement1",
       "T0"."C7" "OrdLine_LineStat",
       "T0"."C8" "OrdLine_SubLineStat",
       "T0"."C9" "DspDet_TripStat",
       "T0"."C10" "ArtLoc_PickMha",
       "T0"."C11" "ArtLoc_PickLocType"
FROM
  (SELECT trim(BOTH
               FROM "O08T15"."PARTNO") "C0",
          trim(BOTH
               FROM "O08T15"."PARTREV") "C1",
          "L62T16"."SHORTL62" "C2",
          "L62T16"."PARTDSC1" "C3",
          sum("O08T15"."REQQUANT") "C4",
          "L62T16"."BALPL" "C5",
          min("L62T16"."BALPL") "C6",
          "O08T15"."LINESTAT" "C7",
          "O06T17"."ORDSTAT" "C8",
          "R08T1"."TRIPSTAT" "C9",
          "L62T16"."PMHA" "C10",
          CASE
              WHEN "L62T16"."PICKLOC"=0 THEN 'Dynamisch'
              WHEN "L62T16"."PICKLOC"=2 THEN 'Fix'
              WHEN "L62T16"."PICKLOC"=1 THEN 'Fix PL, rflilable StUnitsFix'
          END "C11"
   FROM "O08T15",
        "L62T16",
        "O06T17",
        "R08T1" "R08T1"
   WHERE "O08T15"."LINESTAT" IN (2,
                                 4,
                                 22)
     AND "O06T17"."ORDSTAT" IN (2,
                                4,
                                22)
     AND "R08T1"."TRIPSTAT" IN (2)
     AND "L62T16"."PMHA" IN ('53P1 ',
                             '52P3 ',
                             '52P5 ',
                             '53P2 ',
                             '56P1 ',
                             '56P2 ',
                             '56P3 ',
                             '54P1 ',
                             '54P2 ',
                             '54P0 ')
     AND "O08T15"."SHORTL62"="L62T16"."SHORTL62"
     AND "O06T17"."SHORTO06"="O08T15"."SHORTO06"
     AND "O08T15"."SHORTR08"="R08T1"."SHORTR08"
   GROUP BY trim(BOTH
                 FROM "O08T15"."PARTNO"),
            trim(BOTH
                 FROM "O08T15"."PARTREV"),
            "L62T16"."SHORTL62",
            "L62T16"."PARTDSC1",
            "L62T16"."BALPL",
            "O08T15"."LINESTAT",
            "O06T17"."ORDSTAT",
            "R08T1"."TRIPSTAT",
            "L62T16"."PMHA",
            CASE
                WHEN "L62T16"."PICKLOC"=0 THEN 'Dynamisch'
                WHEN "L62T16"."PICKLOC"=2 THEN 'Fix'
                WHEN "L62T16"."PICKLOC"=1 THEN 'Fix PL, rflilable StUnitsFix'
            END
   HAVING sum("O08T15"."REQQUANT")>0
   AND min("L62T16"."BALPL") - sum("O08T15"."REQQUANT")<0) "T0"