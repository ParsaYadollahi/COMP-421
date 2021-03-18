SELECT pname, budget
FROM project
WHERE budget >
  (SELECT AVG(budget)
  FROM project
  WHERE ptype = 'internal'
  )
  ORDER BY budget DESC, pname ASC
;


--   pname   |  budget
-- ----------+----------
--  Kodiak   | 50000000
--  Otters   | 46100000
--  Capybara | 19500000
-- (3 rows)
