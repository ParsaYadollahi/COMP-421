SELECT devassignments.pname, asgndate, ptype
from devassignments JOIN project
ON devassignments.pname = project.pname
WHERE employeeid = 82102
ORDER BY pname ASC
;


--   pname  |  asgndate  |  ptype
-- ---------+------------+----------
--  Charles | 2019-12-08 | internal
--  Kodiak  | 2020-06-07 | external
-- (2 rows)
