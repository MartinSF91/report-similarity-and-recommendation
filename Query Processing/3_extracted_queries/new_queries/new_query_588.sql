SELECT *
FROM l16t3
WHERE substr(to_char(datreg, 'DD-MM-YYYY HH24:MI:SS'), 12, 2)=substr(to_char(sysdate, 'DD-MM-YYYY HH24:MI:SS'), 12, 2)-1
  AND (to_char(datreg, 'DD-MM-YYYY'))=(to_char(sysdate, 'DD-MM-YYYY'))