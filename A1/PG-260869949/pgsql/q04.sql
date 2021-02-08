SELECT devassignments.pname, asgndate, ptype
from devassignments JOIN project
ON devassignments.pname = project.pname
WHERE employeeid = 82102
ORDER BY pname ASC
;
