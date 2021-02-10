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
  (SELECT pname, count(*)
  FROM devassignments
  GROUP BY pname
  ) as t2
  ON t1.pname = t2.pname
  ORDER BY t1.pname
;


--   pname  | startdate  | numdevs
-- ---------+------------+---------
--  Walleye | 2021-01-23 |       3
-- (1 row)
