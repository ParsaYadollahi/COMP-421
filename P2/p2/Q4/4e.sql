CONNECT TO "CS421";


SELECT t1.cname, t2.prionum, numvaccinated from (
SELECT  t2.cname, COUNT(t2.hinsurnum) as numvaccinated FROM slot as t1
JOIN (
  SELECT t1.hinsurnum, t1.cname, t2.prionum
  FROM resident as t1 JOIN priority as t2
  ON t1.cname = t2.cname
  ) as t2
ON t1.hinsurnum = t2.hinsurnum
GROUP BY t2.cname
) as t1
JOIN priority as t2
ON t1.cname = t2.cname
;
