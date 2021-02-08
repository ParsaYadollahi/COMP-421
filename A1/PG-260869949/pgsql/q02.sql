SELECT * from developer
WHERE employeeid IN (
  SELECT employeeid FROM documentauthors
  WHERE documentid = 22
)
ORDER BY employeeid ASC
;
