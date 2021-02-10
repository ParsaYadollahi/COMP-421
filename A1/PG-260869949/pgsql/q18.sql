
select t1.pname, t1.devcost from (
  SELECT *, budget/num as devcost from (
    SELECT t1.pname, t1.budget, t2.num FROM
      project as t1
      JOIN
      (SELECT pname, count(*) as num
      FROM devassignments
      GROUP BY pname
      ) as t2
    ON t1.pname = t2.pname) as t1
    ORDER BY devcost DESC
) as t1
WHERE t1.devcost >= (
    SELECT budget/num as devcost from (
    SELECT t1.pname as projectname, t1.budget, t2.num FROM
      project as t1
      JOIN
      (SELECT pname, count(*) as num
      FROM devassignments
      GROUP BY pname
      ) as t2
    ON t1.pname = t2.pname) as t1
    ORDER BY devcost DESC
    LIMIT 1
)
ORDER BY t1.pname
;

--  NOTE - not sure what they mean by Do not include projects with no developers assigned for this calculation??
--  All employeeID's are primary key so all projects have and employee assigned to is since it can't be null

--  pname  | devcost
-- --------+----------
--  Otters | 15366666
-- (1 row)
