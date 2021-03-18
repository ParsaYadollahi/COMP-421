SELECT COUNT(*) as "numprojects"
FROM
  (SELECT DISTINCT pname
  FROM documentauthors AS t1 LEFT JOIN document AS t2
  ON t1.documentid = t2.documentid
  WHERE t1.employeeid = 93401
  ) as t2
;

--  numprojects
-- -------------
--            3
-- (1 row)
