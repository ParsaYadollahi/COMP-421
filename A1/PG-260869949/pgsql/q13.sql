SELECT t1.pname, COALESCE(t2.numdocs,0) as "numdocs"
FROM project as t1 LEFT JOIN
(SELECT pname, count(*) as numdocs
FROM document
GROUP BY pname) as t2

ON t1.pname = t2.pname
WHERE t1.ptype = 'internal'

ORDER BY COALESCE(t2.numdocs,0) DESC, t2.pname ASC
;


--    pname   | numdocs
-- -----------+---------
--  Charles   |       3
--  Otters    |       3
--  Albatrose |       2
--  Walleye   |       1
-- (4 rows)
