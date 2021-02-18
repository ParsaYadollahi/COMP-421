SELECT COUNT(*) as "numprojects"
FROM project
WHERE date_part('year', project.pstartdate) = date_part('year', CURRENT_DATE);


--  numprojects
-- -------------
--            4
-- (1 row)
