--ACL

USE EE;

--Drop Users
DROP USER IF EXISTS BTen;
DROP USER IF EXISTS AJohnson;
DROP USER IF EXISTS  BWilliams;
--logins
CREATE LOGIN BenTen WITH PASSWORD = '0396742',DEFAULT_DATABASE = EE,CHECK_POLICY =OFF;
CREATE LOGIN AliceJohnson WITH PASSWORD = '0396742',DEFAULT_DATABASE = EE,CHECK_POLICY =OFF;
CREATE LOGIN BobWilliams WITH PASSWORD = '0396742',DEFAULT_DATABASE =  EE,CHECK_POLICY =OFF;


--users
CREATE USER Bten FOR LOGIN BenTen WITH DEFAULT_Schema =[DBO];
CREATE USER AJohnson FOR LOGIN AliceJohnson WITH Default_Schema =[DBO];
CREATE USER BWilliams FOR LOGIN BobWilliams WITH default_Schema =[DBO];

--Roles
CREATE ROLE salesperson;
CREATE ROLE manager;

--PREMISSIONS
GRANT select ON Items TO salesperson;

--manager premissions
GRANT SELECT, INSERT, DELETE ON Employees TO manager;
GRANT SELECT, INSERT, DELETE ON Items TO manager;
GRANT SELECT, INSERT, DELETE ON Jobs TO manager;
GRANT SELECT, INSERT, DELETE ON Stocklog TO manager;
GRANT SELECT, INSERT, DELETE ON Supplier TO manager;
GRANT SELECT, INSERT, DELETE ON Departments TO manager;

--Assign user to the role
EXEC sp_addrolemember 'salesperson','Bten';
EXEC sp_addrolemember 'manager','AJohnson';
EXEC sp_addrolemember 'salesperson', 'BWilliams';



--testing for user Bten

REVERT;
EXEC AS USER ='BTen';
SELECT USER;
--
SELECT * FROM Items;

--Testing for Managers
REVERT;
EXEC AS USER ='AJohnson'
SELECT USER;
--
SELECT* FROM Employees;




