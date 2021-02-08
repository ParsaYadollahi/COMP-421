
SELECT ename, employeeid
FROM (
        SELECT devassignments.employeeid, pname, developer.ename
        FROM devassignments JOIN developer
        ON devassignments.employeeid = developer.employeeid
      ) AS t1
      JOIN
      (
        SELECT *
        FROM project
        WHERE ptype = 'internal' and ptype != 'external'
      ) AS t2
ON t1.pname = t2.pname
ORDER BY employeeid
;
