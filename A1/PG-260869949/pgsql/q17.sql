SELECT pname, budget
FROM project
WHERE budget >
  (SELECT AVG(budget)
  FROM project
  WHERE ptype = 'internal'
  )
  ORDER BY budget, pname
;


--   pname   |  budget
-- ----------+----------
--  Capybara | 19500000
--  Otters   | 46100000
--  Kodiak   | 50000000
-- (3 rows)
