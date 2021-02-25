CONNECT TO "CS421";
SELECT totnumvacc FROM
(
  SELECT COUNT(*) as totnumvacc
  FROM slot JOIN vacclocation
  ON slot.lname = vacclocation.lname
  WHERE slot.vdate = '2021-02-06' AND vacclocation.city = 'Montreal' AND hinsurnum IS NOT NULL
) AS t1
;
