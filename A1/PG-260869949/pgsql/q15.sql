SELECT t1.pname, t1.pstartdate as startdate, t2.count as numdevs
FROM
  (SELECT *
  FROM project
  WHERE pstartdate >= (
    SELECT pstartdate as startdate
    FROM project
    ORDER BY pstartdate DESC
    LIMIT 1
  )) as t1
  JOIN
  (
    SELECT t2.pname, count(t1.employeeid) FROM
    devassignments AS t1 RIGHT JOIN project AS t2
    ON t2.pname = t1.pname
    GROUP BY t2.pname
  ) as t2
  ON t1.pname = t2.pname
  ORDER BY t1.pname
;

--   pname  | startdate  | numdevs
-- ---------+------------+---------
--  Haddock | 2021-01-23 |       0
--  Walleye | 2021-01-23 |       3
-- (2 rows)
