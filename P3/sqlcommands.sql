SELECT t1.* from (SELECT t1.*, t2.nname from (SELECT t1.*, t2.name FROM slot AS t1 JOIN resident AS t2 ON t1.hinsurnum = t2.hinsurnum) AS t1 JOIN nurse as t2 ON t1.cnlnumber = t2.cnlnumber) as t1 JOIN vial as t2 ON t1.vname = t2.vname AND t1.batchnumber = t2.batchnumber and t1.vialnumber = t2.vialnumber

SELECT count(*) AS num_vaccines_taken, t1.name as resident_name from (SELECT t1.*, t2.name FROM slot AS t1 LEFT JOIN resident AS t2 ON t1.hinsurnum = t2.hinsurnum) as t1 WHERE t1.hinsurnum = 3 AND vdate < (SELECT current date FROM sysibm.sysdummy1) GROUP BY t1.name

insert into vaccdates values ('Jewish General', '2022-02-06')
insert into nurseassignments values (2, 'Jewish General', '2022-02-06')

insert into slot values (14, '12:21', '2021-03-20', 'Jewish General', 2, 1, 2, 'Moderna', 78, '2021-03-19')


EXPORT TO /home/2019/pyadol/COMP-421/COMP-421/P3/p3_q4_data.csv OF DEL MESSAGES ON SELECT vdate, count(vialnumber) as num_people FROM slot WHERE hinsurnum IN (SELECT hinsurnum FROM slot GROUP BY hinsurnum HAVING COUNT(hinsurnum) = 1) GROUP BY vdate


insert into resident values ('78', 'dude 2', 'F', '1111-05-1', '514-123-4567', 'Montreal', 'E5E5E5', '5 five', '1111-05-2', 'Everbody Else')

update slot set hinsurnum = 15 where slotnum = 10 and hinsurnum = 14
