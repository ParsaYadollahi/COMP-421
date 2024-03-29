CONNECT TO cs421;

INSERT INTO priority (cname, prionum) VALUES
  ('Health Care Workers', 1),
  ('Elderly', 1),
  ('Immunologically Comprised', 1),
  ('Teachers', 2),
  ('Childen', 2),
  ('Physical proximity first', 2),
  ('Essential Service', 2),
  ('Students', 3),
  ('Physical proximity second', 2),
  ('Everbody Else', 4)
;

INSERT INTO vaccine (vname, waitperiod, doses) VALUES
  ('Moderna', 5, 3),
  ('Pfizer-BioNTech', 4, 5),
  ('Natoque', 3, 5),
  ('lacus', 4, 6),
  ('Another vaccine', 5, 2)
  ;

INSERT INTO resident (hinsurnum, name, gender, birthdate, phone, city, postalcode, streetaddr, regdate, cname) VALUES
  ('1', 'Tony', 'M', '1111-01-1', '514-123-4567', 'Montreal', 'A1A1A1', '1 one', '1111-01-2', 'Elderly'),
  ('2', 'Jane Doe', 'F', '1111-02-1', '514-123-4567', 'Montreal', 'B2B2B2', '2 two', '2020-12-10',  'Teachers'),
  ('3', 'Parsa', 'M', '1111-03-1', '514-123-4567', 'Montreal', 'C3C3C3', '3 three', '1111-03-2', 'Teachers'),
  ('4', 'Montana', 'M', '1111-04-1', '514-123-4567', 'Montreal', 'D4D4D4', '4 four', '1111-04-2', 'Students'),
  ('5', 'GME to the moon please', 'F', '1111-05-1', '514-123-4567', 'Montreal', 'E5E5E5', '5 five', '1111-05-2', 'Everbody Else')
;

INSERT INTO vacclocation (lname, city, postalcode, address) VALUES
  ('Montreal', 'Montreal', 'A2A2A2', '298 Place Youville'),
  ('CHUM', 'Montreal', 'C2C2C2', '1553 Blvd le Corbusier'),
  ('Jewish General', 'Montreal', 'E2E2E2', '8105 Decarie Blvd'),
  ('Toronto hospital', 'Toronto', 'F2F2F2', '39 St Paul St E'),
  ('General', 'Montreal', 'H2H2H2', '1181 Rue de la Montagne')
  ;

INSERT INTO hospital (lname) VALUES
  ('Montreal'),
  ('General'),
  ('CHUM'),
  ('Jewish General'),
  ('Toronto hospital')
;

INSERT INTO nurse (cnlnumber, nname, employer) VALUES
  (1, 'NameofARandomNurse', 'Montreal'),
  (2, 'GME', 'Montreal'),
  (3, 'NIO', 'General'),
  (4, 'BB', 'CHUM'),
  (5, 'BBBY', 'Jewish General'),
  (6, 'SDNL', 'Toronto hospital')
  ;

INSERT INTO vaccdates (lname, vdate) VALUES
  ('Montreal', '2021-01-01'),
  ('General', '2021-01-01'),
  ('CHUM', '2021-02-06'),
  ('Jewish General', '2021-03-20'),
  ('Jewish General', '2021-02-06'),
  ('Jewish General', '2021-04-04'),
  ('Jewish General', '2020-01-01'),
  ('Montreal', '2020-01-01'),
  ('Montreal', '2022-01-01')
  ;

INSERT INTO nurseassignments (cnlnumber, lname, vdate) VALUES
  (1, 'Jewish General', '2021-03-20'),
  (1, 'Jewish General', '2020-01-01'),
  (2, 'Jewish General', '2021-03-20'),
  (3, 'Jewish General', '2021-02-06'),
  (4, 'CHUM', '2021-02-06'),
  (5, 'Montreal', '2020-01-01'),
  (6, 'Montreal', '2022-01-01')
;

INSERT INTO batch (vname, batchnumber, manudate, expiradate, numvials, lname) VALUES
  ('Moderna', 1, '2021-02-01', '2021-03-20', 5, 'Montreal'),
  ('Moderna', 2, '2021-03-20', '2021-03-23', 6, 'Montreal'),
  ('Moderna', 3, '2021-03-23', '2021-03-24', 7, 'Montreal'),
  ('Moderna', 4, '2021-02-04', '2021-02-05', 8, 'Montreal'),
  ('Pfizer-BioNTech', 5, '2021-02-05', '2021-02-06', 5, 'CHUM'),
  ('Pfizer-BioNTech', 6, '2021-02-06', '2021-02-07', 5, 'CHUM'),
  ('Pfizer-BioNTech', 7, '2020-01-01', '2025-02-05', 8, 'Montreal')
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
;

INSERT INTO slot (slotnum, vtime, vdate, lname, cnlnumber, vialnumber, batchnumber, vname, hinsurnum, asgndate) VALUES
  (1, '12:30', '2021-03-20', 'Jewish General', 1, 1, 1, 'Moderna', '1', '2021-03-19'),
  (2, '13:20', '2021-03-20', 'Jewish General', 2, 2, 2, 'Moderna', NULL, '2021-03-19'),
  (3, '14:30', '2021-03-20', 'Jewish General', 1, 2, 2, 'Moderna', '3', '2021-03-19'),
  (4, '15:30', '2021-03-20', 'Jewish General', 2, 1, 2, 'Moderna', '4', '2021-03-19'),
  (5, '16:30', '2021-02-06', 'Jewish General', 3, 5, 5, 'Pfizer-BioNTech', '2', '2021-02-05'),
  (6, '12:30', '2020-01-01', 'Jewish General', 1, 5, 5, 'Pfizer-BioNTech', NULL, '2020-01-01'),
  (7, '13:30', '2020-01-01', 'Montreal', 1, 5, 5, 'Pfizer-BioNTech', '5', '2020-01-01')
;
