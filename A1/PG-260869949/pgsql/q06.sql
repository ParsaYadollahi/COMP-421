
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


--      ename      | employeeid
-- ----------------+------------
--  May Owens      |      81532
--  Milly Fulton   |      82102
--  Tom Smith      |      82453
--  Tom Smith      |      82453
--  Alice Kay      |      87634
--  Isabel Lee     |      89374
--  Melanie Carson |      90234
--  Zara Haas      |      93401
--  Zara Haas      |      93401
--  John Doe       |      93752
--  John Doe       |      93752
-- (11 rows)
