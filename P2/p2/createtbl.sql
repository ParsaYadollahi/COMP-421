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
  cname VARCHAR(50) NOT NULL,
  PRIMARY KEY (cname)
);

CREATE TABLE vaccine
(
  vname VARCHAR(50) NOT NULL,
  waitperiod INTEGER NOT NULL,
  doses INTEGER NOT NULL,
  PRIMARY KEY (vname)
);

CREATE TABLE resident
(
	hinsurnum VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  gender VARCHAR(50) NOT NULL,
  birthdate DATE NOT NULL,
  phone VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  postalcode VARCHAR(50) NOT NULL,
  streetaddr VARCHAR(50) NOT NULL,
  regdate DATE NOT NULL,
  cname VARCHAR(50) NOT NULL,
  PRIMARY KEY (hinsurnum),
  FOREIGN KEY (cname) REFERENCES priority
);

CREATE TABLE vacclocation
(
  lname VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  postalcode VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  PRIMARY KEY (lname)
);

CREATE TABLE hospital
(
  lname VARCHAR(50) NOT NULL,
  PRIMARY KEY (lname),
  FOREIGN KEY (lname) references vacclocation
);


CREATE TABLE nurse
(
  cnlnumber VARCHAR(50) NOT NULL,
  nname VARCHAR(50) NOT NULL,
  employer VARCHAR(50) NOT NULL,
  PRIMARY KEY (cnlnumber),
  FOREIGN KEY (employer) REFERENCES hospital
);


CREATE TABLE vaccdates
(
  lname VARCHAR(50) NOT NULL,
  vdate DATE NOT NULL,
  PRIMARY KEY(lname, vdate),
  FOREIGN KEY (lname) references vacclocation
);

CREATE TABLE nurseassignments
(
	cnlnumber VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	vdate DATE NOT NULL,
  PRIMARY KEY (cnlnumber, lname, vdate),
	FOREIGN KEY(cnlnumber) REFERENCES nurse,
	FOREIGN KEY(lname,vdate) REFERENCES vaccdates
);


CREATE TABLE batch
(
  vname VARCHAR(50) NOT NULL,
  batchnumber INTEGER NOT NULL,
  manudate DATE NOT NULL,
  expiradate DATE NOT NULL,
  numvials INTEGER NOT NULL,
  lname VARCHAR(50) NOT NULL,
  PRIMARY KEY (vname, batchnumber),
  FOREIGN KEY (vname) REFERENCES vaccine,
  FOREIGN KEY (lname) REFERENCES vacclocation
);

CREATE TABLE vial
(
  vname VARCHAR(50) NOT NULL,
  batchnumber INTEGER NOT NULL,
  vialnumber INTEGER NOT NULL,
  PRIMARY KEY (vname, batchnumber, vialnumber),
  FOREIGN KEY (vname, batchnumber) REFERENCES batch
);

CREATE TABLE slot
(
  slotnum INTEGER NOT NULL,
  vtime TIME NOT NULL,
  vdate DATE NOT NULL,
  lname VARCHAR(50) NOT NULL,
  cnlnumber VARCHAR(50),
  vialnumber INTEGER,
  batchnumber INTEGER,
  vname VARCHAR(50),
  hinsurnum VARCHAR(50),
  asgndate DATE,
  PRIMARY KEY (slotnum, vdate, lname, vtime),
  FOREIGN KEY (lname, vdate) REFERENCES vaccdates,
  FOREIGN KEY (cnlnumber) REFERENCES nurse,
  FOREIGN KEY (hinsurnum) REFERENCES resident,
  FOREIGN KEY (vname, batchnumber, vialnumber) REFERENCES vial
);
