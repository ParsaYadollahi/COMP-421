CONNECT "CS421";

CREATE VIEW mtlnurses AS
  SELECT t1.cnlnumber, t1.nname, t1.employer, t2.postalcode, t2.address
  FROM nurse as t1, vacclocation as t2
  WHERE t2.city = 'Montreal' AND t1.employer = t2.lname
;
