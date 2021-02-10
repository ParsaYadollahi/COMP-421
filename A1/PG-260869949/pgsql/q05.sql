SELECT *
FROM project
WHERE pstartdate > '2020-05-01' AND pstartdate < '2020-08-31'
;


--   pname   | pstartdate |  ptype   |  budget
-- ----------+------------+----------+----------
--  Otters   | 2020-05-13 | internal | 46100000
--  Kodiak   | 2020-05-20 | external | 50000000
--  Capybara | 2020-08-22 | external | 19500000
-- (3 rows)
