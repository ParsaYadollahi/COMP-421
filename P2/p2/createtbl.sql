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


CREATE TABLE resident
(
	hinsurnum VARCHAR(30) NOT NULL
  ,name VARCHAR(30) NOT NULL
  ,gender VARCHAR(1) NOT NULL
  ,birthdate DATE NOT NULL
	,phone VARCHAR(10) NOT NULL
  ,city VARCHAR(15) NOT NULL
  ,postalcode VARCHAR(15) NOT NULL
  ,streetaddr VARCHAR(30) NOT NULL
  ,regdate DATE NOT NULL
  ,PRIMARY KEY (hinsurnum)
);
