SELECT DISTINCT t1.pname, t1.employeeid
FROM
  (
    SELECT t1.employeeid, t2.pname
    FROM documentauthors as t1 LEFT JOIN document as t2
    ON t1.documentid = t2.documentid) as t1
LEFT JOIN
  (
    SELECT *
    FROM devassignments as t1) as t2
ON t1.employeeid = t2.employeeid and t1.pname = t2.pname
WHERE t2.asgndate IS NULL
ORDER BY t1.pname, t1.employeeid
;

--   pname   | employeeid
-- ----------+------------
--  Capybara |      91243
--  Charles  |      81532
--  Kodiak   |      90234
--  Kodiak   |      93401
--  Snowy    |      93401
-- (5 rows)
