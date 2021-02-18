SELECT pname
FROM project
WHERE NOT pname IN
(
  SELECT pname FROM (
  SELECT pname, count(*) as num
  FROM devassignments
  GROUP BY pname
  ) AS t1
  WHERE t1.num > 2
)
ORDER BY pname ASC
;


--    pname
-- -----------
--  Albatrose
--  Capybara
--  Haddock
--  Snowy
-- (4 rows)
