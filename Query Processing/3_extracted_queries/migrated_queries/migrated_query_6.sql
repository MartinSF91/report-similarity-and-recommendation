SELECT DISTINCT TRIM(BOTH
                     FROM "PARTNO") "ARTNO",
                TRIM(BOTH
                     FROM "PARTREV") "ARTSUPNO",
                SUBSTR("PANUM", 1, 2) "ARTBANO",
                "PANUM" "ARTPANO"
FROM "L62T14",
     "L62T995"
WHERE SUBSTR("PANUM", 1, 2)<>'61'
  AND "PARTNO"="PARTNO"
  AND "PARTREV"="PARTREV"
  AND "DIVCODE"="DIVCODE"