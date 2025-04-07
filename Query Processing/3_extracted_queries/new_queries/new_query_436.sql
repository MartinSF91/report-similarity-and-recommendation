
SELECT "L48T1"."MHA" "Ziel",
       count("L48T1"."L54UNIQ") "ANZAHL"
FROM "L48T1" "L48T1"
WHERE "L48T1"."MHA" IN ('OUTML',
                        'OUTOS')
GROUP BY "L48T1"."MHA"