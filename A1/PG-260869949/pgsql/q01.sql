SELECT pname,
  pstartdate
from project
WHERE ptype = 'internal'
ORDER BY pname ASC;


--    pname   | pstartdate
-- -----------+------------
--  Albatrose | 2021-01-20
--  Charles   | 2019-12-08
--  Otters    | 2020-05-13
--  Walleye   | 2021-01-23
-- (4 rows)
