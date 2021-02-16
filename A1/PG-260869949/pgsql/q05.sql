SELECT pname, pstartdate
FROM project
WHERE pstartdate > '2020-05-01' AND pstartdate < '2020-08-31'
ORDER BY pstartdate, pname
;


--   pname   | pstartdate
-- ----------+------------
--  Otters   | 2020-05-13
--  Kodiak   | 2020-05-20
--  Capybara | 2020-08-22
-- (3 rows)
