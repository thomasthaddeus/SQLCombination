mysql -h 127.0.0.1 -P 3307 -p -u root
When prompted for password: passwd
----------------------------------------------------------------------------------
USE DATABASE classicmodels;
CREATE SCHEMA test;
SHOW DATABASES;
DROP SCHEMA test;
SHOW DATABASES;
----------------------------------------------------------------------------------
USE DATABASE classicmodels;
CREATE SCHEMA zoo;
----------------------------------------------------------------------------------
CREATE TABLE pet (name   VARCHAR(20),
                 owner   VARCHAR(20),
                 species VARCHAR(20),
                 sex     CHAR(1),
                 birth   DATE,
                 death   DATE);
SHOW TABLES;
DESCRIBE pet;
DROP TABLE pet;
----------------------------------------------------------------------------------
INSERT INTO pet VALUES(Papito, Clark, Chihuahua, m, ‘2007-09-30’, NULL);
INSERT INTO pet VALUES ('Papito', 'Clark', 'Chihuahua', 'm', '2007-09-30', NULL);
SELECT * FROM pet;
SELECT * FROM pet WHERE name = 'Papito';UPDATE pet SET species = 'dog' WHERE name = 'Papito';
----------------------------------------------------------------------------------
UPDATE pet SET species = 'dog' WHERE name = 'Papito';
UPDATE pet SET species = 'dog' WHERE name = 'Papito';
SELECT * FROM pet;
----------------------------------------------------------------------------------
DELETE FROM pet WHERE name = ‘Meowser’;
SELECT * FROM pet;
DELETE FROM pet WHERE sex = 'm';
SELECT * FROM pet;
----------------------------------------------------------------------------------
--Create a schema called donut_shop
--Use the donut_shop database
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
CREATE TABLE Customer
(
CustomerID INT NOT NULL AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
StreetAddress varchar(20) NOT NULL,
Apartment varchar(20) NOT NULL,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
Zip varchar(7) NOT NULL,
HomePhone varchar(14) NOT NULL,
MobilePhone varchar(14),
OtherPhone varchar(14),
PRIMARY KEY (CustomerID)
);

CREATE TABLE Invoice
(
DonutOrderID INT NOT NULL AUTO_INCREMENT,
CustomerID INT NOT NULL,
OrderDate Date NOT NULL,
Notes varchar(255),
PRIMARY KEY (DonutOrderID),
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID )
);

CREATE TABLE Donut
(
DonutID INT NOT NULL AUTO_INCREMENT,
DonutName varchar(20) NOT NULL,
Description varchar(30) NOT NULL,
UnitPrice decimal(5,2) NOT NULL,
PRIMARY KEY (DonutID)
);

CREATE TABLE InvoiceLineItem
(
DonutOrderID INT NOT NULL,
DonutID INT NOT NULL,
Qty INT NOT NULL,
PRIMARY KEY (DonutOrderID,DonutID),
FOREIGN KEY (DonutOrderID) REFERENCES Invoice (DonutOrderID) ,
FOREIGN KEY (DonutID) REFERENCES Donut (DonutID )
);
----------------------------------------------------------------------------------
--Show the tables of the database
----------------------------------------------------------------------------------
