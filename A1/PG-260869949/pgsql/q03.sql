SELECT ename, t1.employeeid
FROM developer as t1 RIGHT JOIN devassignments as t2
ON t1.employeeid = t2.employeeid
WHERE NOT t2.employeeid IN (
	SELECT employeeid
  FROM documentauthors as t1 LEFT JOIN document as t2
	ON t2.documentid = t1.documentid
	WHERE t2.pname = 'Kodiak'
)
AND t2.pname = 'Kodiak'
ORDER BY t1.employeeid;

--    ename    | employeeid
-------------+------------
-- May Owens   |      81532
-- Emery Woods |      91243-
