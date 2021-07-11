===========================================================================================================
-- Create 2< meaningful tables with primary keys and the correct datatypes 
-- 1< table should have 5< fields & 10< entries 
===========================================================================================================
CREATE DATABASE BusinessTransformationCompany

USE BusinessTransformationCompany
---------------------------------------------------------------------------------------------------


CREATE TABLE Roles(
RoleID INT IDENTITY PRIMARY KEY,
Position VARCHAR(20) NOT NULL,
HourlyRate DECIMAL(5,2),
OvertimeRate DECIMAL(5,2),
hoursPday DECIMAL(3,1),
daysPweek DECIMAL(2,1)	);

INSERT INTO Roles
VALUES	('Managing Director', 40, 35, 10, 4),
	('Product Owner', 18.5, 23, 8, 5),
	('Recepionist', 10.98, 14, 10, 5),
	('Business Analyst', 14.72, 18.5, 8, 5),
	('Data Analyst', 14.72, 18.5, 12, 3.5),
	('Junior Analyst', 10.48, 14, 12, 5);

---------------------------------------------------------------------------------------------------
CREATE TABLE Employees(
EmployeeID INT IDENTITY PRIMARY KEY,
RoleID INT,
Fname VARCHAR(50),
Sname VARCHAR(50) NOT NULL,
Email VARCHAR(100),
Number CHAR(11),
Address VARCHAR(200),
Postcode VARCHAR(10),
PermanentStaff BIT DEFAULT 0,
StartDate DATE DEFAULT '01-31-2021');

INSERT INTO Employees
VALUES	(1, 'Fatima','Jallow', 'F.Jallow@outlook.com', 07000000001, '354 Frankish Street', 'B1 95J', 1, DEFAULT),
	(2, 'Adrian','Peters', 'peter006@outlook.com', 07000000023, '72 Dutch Crescent Road', 'B1 97J', 1, '02-15-2021'),
	(5, 'Mica','Angelo', 'miangelo@gmail.com', 07006800001, '64 Zoo Lane', 'B30 3SD', 1, '02-15-2021'),
	(6, 'Isabella','Angelo', 'isabella.angel0@gmail.com', 07000640001, '3 Mingle Street', 'B31 6TZ', 0, '08-01-2021'),
	(4, 'Richie','Venus', 'ricvus@outlook.com', 07780000001, '81 Bramford Road', 'B15 9YR', 0, '02-15-2021'),
	(4, 'Stuart','Walton', 's.walton@outlook.com', 07000000489, '106 Manderfield Drive', 'B21 9DS', 1, '05-07-2021'),
	(3, 'Felipa','Trovolski', 'Trovolskipa@outlook.com', 07000066721, '45 Crosscriss Road', 'B17 6FJ', 0, '05-13-2021'),
	(6, 'Michele','Barr', 'm.barr@outlook.com', 07087100001, '12 Andalusian Street', 'B1 9PY', 1, '02-13-2021'),
	(5, 'Damien','Richards', 'damien.r@outlook.com', 07011220001, '71 Richards Road', 'B28 5QD', 0, '03-15-2021'),
	(4, 'Harvey','Blacksmith', 'harvs@outlook.com', 07000543201, '91 Richards Road', 'B28 5QD', 1, '04-15-2021');

---------------------------------------------------------------------------------------------------
CREATE TABLE Inventory(
InventoryID INT IDENTITY PRIMARY KEY,
Device VARCHAR(50) DEFAULT 'Miscellaneous',
Virtual BIT DEFAULT 0,
Cost DECIMAL(10,2),
MandatoryRenewal BIT DEFAULT 0,
Quantity INT DEFAULT 1,
Supplier VARCHAR(50)	);

INSERT INTO Inventory
VALUES('Computer', 0, 400, 0, 9, 'TechFarm'),
	('Monitors', 0, 125, 0, 18, 'TechFarm'), 
	('Laptop', 0, 1500, 0, 3, 'AnalystGear'),
	('Eikon', 1, 22000.50, 1, 1, 'Thomson Reuters'),
	('Wireframe Tool', 0, 839.99, 1, 2, 'Figma'),
	('PowerBI', 1, 119.99, 1, 2, 'Microsoft');



---------------------------------------------------------------------------------------------------
CREATE TABLE InventoryAccess(
iAcessID INT IDENTITY PRIMARY KEY,
RoleID INT,
InventoryID INT,
Quantity INT	);

INSERT INTO InventoryAccess
VALUES	(1, 1, 1), (1, 2, 2),
	(2, 1, 1), (2, 2, 2),(2, 4, 1),
	(3, 1, 1), (3, 2, 2),
	(4, 1, 1), (4, 2, 2), (4, 4, 1), (4, 5, 1),
	(5, 3, 1), (5, 4, 1), (5, 6, 1),
	(6, 1, 1), (6, 2, 2), (6, 4, 1), (6, 5, 1), (6, 6, 1); 

===========================================================================================================
View & Show all table structures
Update a record
Delete a record
===========================================================================================================
--EXPLAIN = SP_HELP
SP_HELP InventoryAccess
SP_HELP Inventory
SP_HELP Employees
SP_HELP Roles

SELECT * FROM InventoryAccess
SELECT * FROM Inventory
SELECT * FROM Employees
SELECT * FROM Roles


INSERT INTO Inventory(Virtual, Quantity, Cost, Supplier)
VALUES (1, 10, 249.99, 'Microsoft'),(1, 10, 249.99, 'Microsoft');
Update Inventory
SET Device = 'Office'
WHERE InventoryID = 7

Update Inventory
SET MandatoryRenewal = 1
WHERE Device = 'Office'

DELETE FROM Inventory WHERE InventoryID = 8

SELECT * FROM Inventory

===========================================================================================================
Join Tables
Filter Data uing comparison operators
run a simple query
run a complex query highlighting relationship between multiple tables
Order in ascending order
===========================================================================================================
SELECT * From Inventory Where Supplier != 'TechFarm'

SELECT e.Fname + ' ' + e.Sname AS "Name",r.Position, e.Email, r.HourlyRate, SUM(r.HourlyRate * r.hoursPday) AS "Day",
SUM(r.HourlyRate * r.hoursPday * r.daysPweek) AS "Week", ROUND(SUM(r.HourlyRate * r.hoursPday * r.daysPweek * 52),2) AS "Year"
FROM Employees e
JOIN Roles r ON r.RoleID = e.RoleID
GROUP BY e.Fname, e.Sname, r.position, e.email, r.hourlyrate
ORDER BY "Year" ASC

SELECT r.Position, I.Device, ia.Quantity AS "Permitted Access"
FROM InventoryAccess ia
Join Roles r on r.RoleID = ia.RoleID
Join Inventory i on i.InventoryID = ia.InventoryID
GROUP BY Position, Device, ia.Quantity