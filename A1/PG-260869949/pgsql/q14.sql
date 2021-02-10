SELECT pname, pstartdate as startdate
FROM project
WHERE pstartdate <= (
  SELECT pstartdate as startdate
  FROM project
  ORDER BY pstartdate ASC
  LIMIT 1
)
;

--   pname  | startdate
-- ---------+------------
--  Charles | 2019-12-08
-- (1 row)
