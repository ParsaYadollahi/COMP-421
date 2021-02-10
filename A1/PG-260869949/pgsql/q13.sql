SELECT t1.pname, t2.numdocs
FROM project as t1 JOIN
(SELECT pname, count(*) as numdocs
FROM document
GROUP BY pname) as t2

ON t1.pname = t2.pname
WHERE t1.ptype = 'internal'

ORDER BY t2.numdocs DESC, t2.pname ASC
;


--    pname   | numdocs
-- -----------+---------
--  Charles   |       3
--  Otters    |       3
--  Albatrose |       2
--  Walleye   |       1
-- (4 rows)
