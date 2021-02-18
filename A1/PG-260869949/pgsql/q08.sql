SELECT DISTINCT t1.pname
FROM document as t1
  JOIN (
    SELECT *
    FROM documentauthors
    WHERE employeeid = 93401
  ) as t2 ON t1.documentid = t2.documentid
ORDER BY t1.pname ASC;
--  project name
-- --------------
--  Kodiak
--  Otters
--  Snowy
-- (3 rows)
