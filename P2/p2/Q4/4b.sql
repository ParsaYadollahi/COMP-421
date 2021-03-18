CONNECT TO "CS421";
SELECT expiradate FROM batch AS t1 RIGHT JOIN (
SELECT *
    FROM slot LEFT JOIN resident
    ON resident.hinsurnum = slot.hinsurnum
  ) as t2
ON t1.vname = t2.vname AND t1.batchnumber = t2.batchnumber
WHERE t2.name = 'Jane Doe' AND t2.vdate = '2021-02-06'
;
