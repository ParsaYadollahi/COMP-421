SELECT t1.pname as "project name"
FROM document as t1
JOIN
  (SELECT *
  FROM documentauthors
  WHERE employeeid = 93401
  ) as t2

ON t1.documentid = t2.documentid
ORDER BY t1.pname ASC
;
