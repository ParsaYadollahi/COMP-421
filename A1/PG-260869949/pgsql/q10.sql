SELECT COUNT(*) as "numprojects"
FROM document as t1
JOIN
  (SELECT *
  FROM documentauthors
  WHERE employeeid = 93401
  ) as t2

ON t1.documentid = t2.documentid
;


--  numprojects
-- -------------
--            6
-- (1 row)
