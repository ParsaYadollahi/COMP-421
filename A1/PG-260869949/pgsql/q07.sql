SELECT t1.pname as "project name", t1.employeeid as "employee id"
FROM

(SELECT t1.employeeid, t2.pname
FROM documentauthors as t1 JOIN document as t2
ON t1.documentid = t2.documentid)
as t1

JOIN

(SELECT t1.employeeid, t1.pname
FROM devassignments as t1)
 as t2

ON t1.employeeid = t2.employeeid

WHERE
  t1.employeeid = t2.employeeid
  AND
  t1.pname != t2.pname

ORDER BY t1.pname
;


--  project name | employee id
-- --------------+-------------
--  Albatrose    |       93752
--  Albatrose    |       82453
--  Albatrose    |       82453
--  Albatrose    |       82453
--  Albatrose    |       82453
--  Capybara     |       81532
--  Capybara     |       91243
--  Capybara     |       81532
--  Charles      |       82453
--  Charles      |       82453
--  Charles      |       82453
--  Charles      |       82453
--  Charles      |       81532
--  Charles      |       82102
--  Charles      |       82102
--  Charles      |       82102
--  Charles      |       87634
--  Charles      |       81532
--  Charles      |       81532
--  Kodiak       |       93401
--  Kodiak       |       82102
--  Kodiak       |       82102
--  Kodiak       |       93401
--  Kodiak       |       93401
--  Kodiak       |       82453
--  Kodiak       |       82453
--  Kodiak       |       90234
--  Kodiak       |       82102
--  Kodiak       |       93401
--  Otters       |       89374
--  Otters       |       93401
--  Otters       |       93401
--  Otters       |       93401
--  Snowy        |       93401
--  Snowy        |       93401
-- (35 rows)
