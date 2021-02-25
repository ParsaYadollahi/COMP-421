-- Include your INSERT SQL statements in this file
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.



-- INSERT INTO MYTEST01 (id, value) VALUES(4, 1300);
-- -- A more complex syntax that saves you typing effort.
-- INSERT INTO MYTEST01 (id, value) VALUES
--  (7, 5144)
-- ,(3, 73423)
-- ,(6, -1222)
-- ;


INSERT INTO priority (cname, prionum) VALUES
  ('Elderly', 1),
  ('Teachers', 2),
  ('Healthcare', 1),
  ('Students', 3),
  ('Essential', 2),
  ('Childen', 2),
  ('Frontline', 1),
  ('Other', 4)
;

INSERT INTO vaccine (vname, waitperiod, doses) VALUES
  ('Moderna', 5, 3),
  ('Pfizer-BioNTech', 4, 5)
  -- ('Natoque', 3, 5),
  -- ('lacus', 4, 6)
  ;


INSERT INTO resident (hinsurnum, name, gender, birthdate, phone, city, postalcode, streetaddr, regdate, cname) VALUES
  (1, 'Tony', 'M', '1111-01-1', '514-123-4567', 'Montreal', 'A1A1A1', '1 one', '1111-01-2', 'Elderly'),
  (2, 'Jane Doe', 'F', '1111-02-1', '514-123-4567', 'Montreal', 'B2B2B2', '2 two', '2020-12-10',  'Teachers'),
  (3, 'Parsa', 'M', '1111-03-1', '514-123-4567', 'Montreal', 'C3C3C3', '3 three', '1111-03-2', 'Teachers'),
  (4, 'Montana', 'M', '1111-04-1', '514-123-4567', 'Montreal', 'D4D4D4', '3 three', '1111-04-2', 'Students')

  -- (4, 'Mikasas', 'M', '1111-04-1', '514-123-4567', 'Montreal', 'D1D1D1', '4 four', '1111-04-2', 'Teachers'),
  -- (5, 'GME', 'F', '1111-05-1', '514-123-4567', 'Toronto', 'E1E1E1', '5 five', '1111-05-2', 'Elderly'),
  -- (6, 'NIO', 'M', '1111-06-1', '514-123-4567', 'Toronto', 'F1F1F1', '6 six', '1111-06-2', 'Childen'),
  -- (7, 'Armin', 'F', '1111-07-1', '514-123-4567', 'Toronto', 'G1G1G1', '7 sevec', '1111-07-2', 'Essential'),
  -- (8, 'Levi', 'M', '1111-08-1', '514-123-4567', 'Ottawa', 'H1H1H1', '8 eight', '1111-08-2', 'Essential'),
  -- (9, 'Sasha', 'F', '1111-09-1', '514-123-4567', 'Ottawa', 'I1I1I1', '9 nine', '1111-09-2', 'Elderly'),
  -- (10, 'Connie', 'M', '1111-10-1', '514-123-4567', 'Ottawa', 'J1J1J1', '10 tem', '1111-10-2', 'Frontline'),
  -- (11, 'Bro', 'F', '1111-11-1', '514-123-4567', 'Gatineau', 'K1K1K1', '11 eleven', '1111-11-2', 'Other'),
  -- (12, 'Love', 'F', '1111-12-1', '514-123-4567', 'Gatineau', 'L1L1L1', '12 twelve', '1111-12-2', 'Other'),
  -- (13, 'You', 'M', '1111-01-2', '514-123-4567', 'Gatineau', 'M1M1M1', '13 thirteen', '1111-01-3', 'Elderly'),
  -- (14, 'Nokap', 'M', '1111-01-3', '514-123-4567', 'New York', 'N1N1N1', '14 fourteen', '1111-01-4', 'Healthcare')
;


INSERT INTO vacclocation (lname, city, postalcode, address) VALUES
  ('Montreal', 'Montreal', 'A2A2A2', 'address'),
  ('CHUM', 'Montreal', 'C2C2C2', 'address'),
  ('Jewish General', 'Montreal', 'E2E2E2', 'address'),
  ('Toronto hospital', 'Toronto', 'F2F2F2', 'address'),
  ('Gatineau hospital', 'Gatineau', 'G2G2G2', 'address'),
  ('General', 'Montreal', 'H2H2H2', 'address')
  ;



INSERT INTO hospital (lname) VALUES
  ('Montreal'),
  ('General'),
  ('CHUM'),
  ('Jewish General'),
  ('Toronto hospital'),
  ('Gatineau hospital')
;

INSERT INTO nurse (cnlnumber, nname, employer) VALUES
  (1, 'NameofARandomNurse', 'Montreal'),
  (2, 'GME', 'Montreal'),
  (3, 'NIO', 'General'),
  (4, 'BB', 'CHUM'),
  (5, 'BBBY', 'Jewish General'),
  (6, 'SDNL', 'Toronto hospital'),
  (7, 'TSLA', 'Gatineau hospital')
  -- ('8', 'AAPL', 'Gatineau hospital')
  ;

INSERT INTO vaccdates (lname, vdate) VALUES
  ('Montreal', '2021-01-01'),
  ('General', '2021-01-01'),
  ('CHUM', '2021-02-06'),

  -- ('Gatineau hospital', '2021-03-20'),
  ('Jewish General', '2021-03-20'),
  ('Jewish General', '2021-02-06'),

  -- ('Gatineau hospital', '2021-03-03'),
  -- ('Toronto hospital', '2021-03-03'),
  -- ('Toronto hospital', '2021-04-04'),

  ('Jewish General', '2021-04-04'),
  ('Montreal', '2020-01-01')
  -- ('Toronto hospital', '2021-05-05')
  ;


INSERT INTO nurseassignments (cnlnumber, lname, vdate) VALUES
  (1, 'Jewish General', '2021-03-20'),
  (2, 'Jewish General', '2021-03-20'),
  (3, 'Jewish General', '2021-02-06'),
  (4, 'CHUM', '2021-02-06'),
  (1, 'Jewish General', '2020-01-01');
;


INSERT INTO batch (vname, batchnumber, manudate, expiradate, numvials, lname) VALUES
  ('Moderna', 1, '2021-02-01', '2021-03-20', 5, 'Montreal'),
  ('Moderna', 2, '2021-03-20', '2021-03-23', 6, 'Montreal'),
  ('Moderna', 3, '2021-03-23', '2021-03-24', 7, 'Montreal'),
  ('Moderna', 4, '2021-02-04', '2021-02-05', 8, 'Montreal'),
  ('Pfizer-BioNTech', 5, '2021-02-05', '2021-02-06', 5, 'CHUM'),
  ('Pfizer-BioNTech', 6, '2021-02-06', '2021-02-07', 5, 'CHUM')
  -- ('Natoque', 7, '2021-02-07', '2021-02-08', 4, 'Jewish General'),
  -- ('Natoque', 9, '2021-02-08', '2021-02-09', 5, 'Jewish General'),
  -- ('lacus', 10, '2021-02-09', '2021-02-10', 6, 'General')
  ;

INSERT INTO vial (vname, batchnumber, vialnumber) VALUES
  ('Moderna',1,  1),
  ('Moderna',2,  2),
  ('Moderna',1,  3),
  ('Moderna',2,  4),
  ('Moderna',1,  5),
  ('Moderna',2,  6),
  ('Moderna',1,  7),
  ('Moderna',2,  8),
  ('Moderna',1,  9),
  ('Moderna',2,  1),
  ('Moderna',3,  2),
  ('Moderna',2,  3),
  ('Moderna',3,  4),
  ('Moderna',2,  5),
  ('Moderna',3,  6),
  ('Moderna',2,  7),
  ('Moderna',3,  8),
  ('Moderna',2,  9),
  ('Pfizer-BioNTech',5,  1),
  ('Pfizer-BioNTech',5,  2),
  ('Pfizer-BioNTech',5,  3),
  ('Pfizer-BioNTech',5,  4),
  ('Pfizer-BioNTech',5,  5),
  ('Pfizer-BioNTech',5,  6),
  ('Pfizer-BioNTech',5,  7),
  ('Pfizer-BioNTech',5,  8),
  ('Pfizer-BioNTech',5,  9),
  ('Pfizer-BioNTech',6,  1),
  ('Pfizer-BioNTech',6,  2),
  ('Pfizer-BioNTech',6,  3),
  ('Pfizer-BioNTech',6,  4),
  ('Pfizer-BioNTech',6,  5),
  ('Pfizer-BioNTech',6,  6),
  ('Pfizer-BioNTech',6,  7),
  ('Pfizer-BioNTech',6,  8),
  ('Pfizer-BioNTech',6,  9)

  -- (1, 1, 'lacus')
;



INSERT INTO slot (slotnum, vtime, vdate, lname, cnlnumber, vialnumber, batchnumber, vname, hinsurnum) VALUES
  (1, '12:30', '2021-03-20', 'Jewish General', 1, 1, 1, 'Moderna', NULL),
  (2, '13:20', '2021-03-20', 'Jewish General', 2, 2, 2, 'Moderna', 2),
  (3, '14:30', '2021-03-20', 'Jewish General', 1, 2, 2, 'Moderna', 3),
  (4, '15:30', '2021-03-20', 'Jewish General', 2, 1, 2, 'Moderna', 4),
  (5, '16:30', '2021-02-06', 'Jewish General', 3, 5, 5, 'Pfizer-BioNTech', 2),
  (6, '12:30', '2020-01-01', 'Jewish General', 1, 5, 5, 'Pfizer-BioNTech', NULL);
  -- (3, '18:30', '2021-01-01', 'General', 3, 3, 7, 'Pfizer-BioNTech', 6),

  -- (1, '19:30', '2021-01-01', 'CHUM', 5, 2, 8, 'Pfizer-BioNTech', 7),
  -- (2, '20:30', '2021-01-01', 'CHUM', 5, 1, 9, 'Pfizer-BioNTech', 8)

  -- (1, '21:30', '2021-01-01', 'Montreal', 6, 1, 1, 'lacus', 9),
;
