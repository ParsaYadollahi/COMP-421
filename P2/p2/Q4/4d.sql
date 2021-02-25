CONNECT TO "CS421";

SELECT t1.name, t1.phone, t1.hinsurnum
FROM resident as t1 JOIN slot as t2
ON t1.hinsurnum = t2.hinsurnum
WHERE t1.hinsurnum IN (
  SELECT  hinsurnum
  FROM  slot
  GROUP BY hinsurnum
  HAVING COUNT(slot.hinsurnum) = 1
)
AND t1.hinsurnum IN (
  SELECT hinsurnum
  FROM slot
  WHERE vdate < '2021-02-01' AND vname = 'Pfizer-BioNTech'
);
