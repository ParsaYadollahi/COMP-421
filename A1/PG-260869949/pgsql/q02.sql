SELECT * from developer
WHERE employeeid IN (
  SELECT employeeid FROM documentauthors
  WHERE documentid = 22
)
ORDER BY employeeid ASC
;


--  employeeid |    ename
-- ------------+--------------
--       82102 | Milly Fulton
--       93401 | Zara Haas
-- (2 rows)
