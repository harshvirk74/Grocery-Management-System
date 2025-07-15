/*
Name:Harshdeep Virk
Project: Final Project
Description :3. Physical Model 	
*/


	/*Note: DDL -  - all TSQL statements need to be saved in a .sql file		
		3.1	Create Database 
		3.2	Create all Tables in the Database (mapped to ERD) 
		3.3	Create all relationship constraints
			- Respecting Referential Integrity where appropriate
		3.4	Create one other type of constraint included e.g. check constraint
		3.5	Create a minimum of 2 indexes and explain purpose
		3.6	Create a minimum of 1 trigger, explain  and demonstrate purpose
			eg. trigger to enforce RI , error handling, other? (Must not be an audit trigger)
		3.7	Create two views that operate and restrict data in some way
		3.8	Create 1 function, explain and demonstrate its use
			
		3.9.1	Create 1 Stored Procedure, explain and demonstrate its use (cannot be one that calculates a person's age)
		3.9.2	Create 1 Stored procedure including the use of a transaction, explain and demonstrate its use
		*/

--3.2

USE EE;
--Table for Suppliers
CREATE TABLE Supplier(
	
	supplier_id INT,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	phone_no NVARCHAR(13),

	CONSTRAINT SupplierPK
		PRIMARY KEY(supplier_id)
		)
--Table for Deparments
CREATE TABLE Departments(
	
	department_id INT,
	department_name VARCHAR(20) NOT NULL,
	
	CONSTRAINT DepartmentsPK
		PRIMARY KEY(department_id)
		)

--Table for Jobs
CREATE TABLE Jobs(

	job_id INT,
	job_title NVARCHAR(25) NOT NULL,
	job_description NVARCHAR(255) NOT NULL,

	CONSTRAINT JobsPK
		PRIMARY KEY(job_id),
	CONSTRAINT JobTitleUnique
		UNIQUE(job_title)
		)

--Table for Employees
CREATE TABLE Employees(

	employee_id INT,
	first_name NVARCHAR(25) NOT NULL,
	last_name NVARCHAR(25) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	hiring_date DATETIME NOT NULL,
	manager_id INT,
	department_id INT,
	employee_no INT NOT NULL,

	CONSTRAINT EmployeesPK
		PRIMARY KEY(employee_id),
	CONSTRAINT employeeNumberUnique
		UNIQUE(employee_no),
	CONSTRAINT EmployeesDepartmentsFK
		FOREIGN KEY(department_id)
			REFERENCES Departments(department_id)

			)

--Table for Employee_Job(linking table)
 CREATE TABLE Employee_Job(
	
	employee_id INT,
	job_id INT,


	CONSTRAINT Employee_JobPK
		PRIMARY KEY(employee_id,job_id),
	CONSTRAINT Employee_JobEmployeesFK
		FOREIGN KEY(employee_id)
			REFERENCES Employees(employee_id),
	CONSTRAINT Employee_JobJobsFK
		FOREIGN KEY(job_id)
			REFERENCES Jobs(job_id)
			)

--Table for Items
CREATE TABLE Items(
	
	item_id INT,
	item_name NVARCHAR(50) NOT NULL,
	department_id INT ,
	sales INT,
	stock_price DECIMAL(6,2) NOT NULL,
	shelf_price DECIMAL(6,2) NOT NULL,
	profit_margin DECIMAL(6,2) NOT NULL,
	quantity INT NOT NULL,
	supplier_id INT

	CONSTRAINT ItemsPK
		PRIMARY KEY(item_id),
	CONSTRAINT ItemSupplierFK
		FOREIGN KEY(supplier_id)
			REFERENCES Supplier(supplier_id),
	CONSTRAINT Stock_pricepositive 
		CHECK(stock_price <= shelf_price),
	
	)

ALTER TABLE Items
ADD CONSTRAINT departmentItemsFK
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id);


--Table for StockLog


CREATE TABLE Stocklog(
    log_id INT IDENTITY(1,1),
    item_id INT,
    change_time DATETIME NOT NULL,
    new_qauntity INT NOT NULL,
    comment NVARCHAR(255) NOT NULL,

    CONSTRAINT StocklogPK
        PRIMARY KEY(log_id),
    CONSTRAINT ItemStocklogFK
        FOREIGN KEY(item_id)
            REFERENCES Items(item_id)
)



--create INDEX 

--easy to get all of the items of the specific departments 
CREATE NONCLUSTERED INDEX Item_department
	ON Items(department_id);

SELECT *
FROM Items
WHERE department_id =1;

--Non-clustered index it gets the logs per item
CREATE NONCLUSTERED INDEX logs_per_item
ON dbo.Stocklog(item_id);


SELECT *
FROM Stocklog
WHERE item_id =1;


--Views
SELECT * FROM dbo.employee_department;

SELECT* FROM dbo.employee_salaries;
