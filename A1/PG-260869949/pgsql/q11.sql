SELECT pname
FROM
(
  SELECT pname, count(*) as num
  FROM devassignments
  GROUP BY pname
) as t1
WHERE t1.num > 2
ORDER BY t1.pname
;

--   pname
-- ---------
--  Charles
--  Kodiak
--  Otters
--  Walleye
-- (4 rows)
