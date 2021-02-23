-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE MYTEST01
(
  id INTEGER NOT NULL
 ,value INTEGER
 ,PRIMARY KEY(id)
);



CREATE TABLE priority
(
  prionum INTEGER NOT NULL,
  cname VARCHAR(30) NOT NULL,
  PRIMARY KEY (cname)
);

CREATE TABLE resident
(
	hinsurnum INTEGER NOT NULL,
  name VARCHAR(30) NOT NULL,
  gender VARCHAR(1) NOT NULL,
  birthdate DATE NOT NULL,
  phone VARCHAR(30) NOT NULL,
  city VARCHAR(15) NOT NULL,
  postalcode VARCHAR(15) NOT NULL,
  streetaddr VARCHAR(30) NOT NULL,
  regdate DATE NOT NULL,
  cname VARCHAR(30) NOT NULL,
  PRIMARY KEY (hinsurnum),
  FOREIGN KEY (cname) REFERENCES priority
);

CREATE TABLE hospital
(
  lname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  postalcode VARCHAR(30) NOT NULL,
  address VARCHAR(30) NOT NULL,
  PRIMARY KEY (lname)
);

CREATE TABLE nurse
(
  cnlnumber INTEGER NOT NULL,
  nname VARCHAR(30) NOT NULL,
  employer VARCHAR(30) NOT NULL,
  PRIMARY KEY (cnlnumber),
  FOREIGN KEY (employer) REFERENCES hospital
);

CREATE TABLE vacclocation
(
  lname VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  postalcode VARCHAR(30) NOT NULL,
  address VARCHAR(30) NOT NULL,
  PRIMARY KEY (lname)
);

CREATE TABLE vaccdates
(
  lname VARCHAR(30) NOT NULL,
  vdate DATE NOT NULL,
  PRIMARY KEY(lname, vdate),
  FOREIGN KEY (lname) references vacclocation
);

CREATE TABLE vaccine
(
  vname VARCHAR(30) NOT NULL,
  waitperiod INTEGER NOT NULL,
  doses INTEGER NOT NULL,
  PRIMARY KEY (vname)
);

CREATE TABLE batch
(
  batchnumber VARCHAR(30) NOT NULL,
  mfgdate VARCHAR(30) NOT NULL,
  expdate VARCHAR(30) NOT NULL,
  numdoses VARCHAR(30) NOT NULL,
  vname VARCHAR(30) NOT NULL,
  lname VARCHAR(30) NOT NULL,
  PRIMARY KEY (batchnumber, vname),
  FOREIGN KEY (vname) REFERENCES vaccine,
  FOREIGN KEY (lname) REFERENCES vacclocation
);

CREATE TABLE vial
(
  vid INTEGER NOT NULL,
  batchnumber VARCHAR(30) NOT NULL,
  vname VARCHAR(30) NOT NULL,
  PRIMARY KEY (vid, batchnumber, vname),
  FOREIGN KEY (vname, batchnumber) REFERENCES batch
);

CREATE TABLE slot
(
  slotnum INTEGER NOT NULL,
  vtime TIME NOT NULL,
  vdate DATE NOT NULL,
  lname VARCHAR(30) NOT NULL,
  cnlnumber INTEGER NOT NULL,
  vid INTEGER NOT NULL,
  batchnumber VARCHAR(30) NOT NULL,
  vname VARCHAR(30) NOT NULL,
  hinsurnum INTEGER NOT NULL,
  PRIMARY KEY (slotnum, vdate, lname),
  FOREIGN KEY (lname, vdate) REFERENCES vaccdates,
  FOREIGN KEY (cnlnumber) REFERENCES nurse,
  FOREIGN KEY (hinsurnum) REFERENCES resident,
  FOREIGN KEY (vid, batchnumber, vname) REFERENCES vial
);
