SELECT t1.ename as employeename, t1.employeeid
FROM
      developer as t1
  JOIN
      (SELECT employeeid, pname
      FROM devassignments
      WHERE pname = 'Kodiak'

      UNION

      SELECT t1.employeeid, t2.pname
      FROM documentauthors as t1 JOIN document as t2
      ON t1.documentid = t2.documentid
      WHERE t2.pname = 'Kodiak'
      ) as t2
  ON t1.employeeid = t2.employeeid
  ORDER BY t1.employeeid
  ;


--   employeename  | employeeid
-- ----------------+------------
--  May Owens      |      81532
--  Milly Fulton   |      82102
--  Tom Smith      |      82453
--  Jane Doe       |      87642
--  Melanie Carson |      90234
--  Emery Woods    |      91243
--  Zara Haas      |      93401
-- (7 rows)
