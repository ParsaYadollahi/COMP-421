SELECT DISTINCT ename,
  t1.employeeid
FROM developer AS t1
  JOIN devassignments AS t2 ON t1.employeeid = t2.employeeid
WHERE t2.employeeid IN (
    SELECT employeeid
    FROM devassignments AS d
      JOIN project AS p ON d.pname = p.pname
    WHERE ptype = 'internal'
  )
  AND NOT t2.employeeid IN (
    SELECT employeeid
    FROM devassignments AS d
      JOIN project AS p ON d.pname = p.pname
    WHERE ptype = 'external'
  )
ORDER BY employeeid ASC;
;

--      ename      | employeeid
-- ----------------+------------
--  Melanie Carson |      90234
--  Zara Haas      |      93401
--  John Doe       |      93752
-- (3 rows)
