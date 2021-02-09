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
