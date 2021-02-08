SELECT pname,
  pstartdate
from project
WHERE ptype = 'internal'
ORDER BY pname ASC;
