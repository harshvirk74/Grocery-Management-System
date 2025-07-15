
-- Insert data into Supplier table
INSERT INTO Supplier (supplier_id, first_name, last_name, phone_no)
VALUES 
(1, 'John', 'Doe', '123-456-7890'),
(2, 'Jane', 'Smith', '987-654-3210');

-- Insert data into Departments table
INSERT INTO Departments (department_id, department_name)
VALUES 
(2, 'Electronics'),
(3, 'Clothing');

-- Insert data into Jobs table
INSERT INTO Jobs (job_id, job_title, job_description)
VALUES 
(1, 'Sales Associate', 'Assists customers and processes sales'),
(2, 'Manager', 'Oversees department operations');

-- Insert data into Employees table
INSERT INTO Employees (employee_id, first_name, last_name, salary, hiring_date, manager_id, department_id, employee_no)
VALUES 
(2, 'Alice', 'Johnson', 50000.00, '2023-01-15', NULL, 1, 1001),
(3, 'Bob', 'Williams', 45000.00, '2023-02-20', 1, 3, 1002),
(4, 'Charlie', 'Brown', 55000.00, '2023-03-10', NULL, 2, 1003);

-- Insert data into Employee_Job table
INSERT INTO Employee_Job (employee_id, job_id)
VALUES 
(1, 2),
(2, 1),
(3, 2);

-- Insert data into Items table
INSERT INTO Items (item_id, item_name, department_id, sales, stock_price, shelf_price, profit_margin, quantity, supplier_id)
VALUES 
(1, 'Smartphone', 1, 100, 300.00, 500.00, 200.00, 50, 1),
(2, 'T-shirt', 2, 200, 10.00, 20.00, 10.00, 100, 2),
(3, 'Laptop', 1, 50, 600.00, 1000.00, 400.00, 30, 1);

-- Insert data into Stocklog table
INSERT INTO Stocklog ( item_id,change_time, new_qauntity, comment)
VALUES 
( 1, '2023-11-22 10:00:00', 45, 'Sold 5 units'),
(2, '2023-11-22 11:30:00', 95, 'Sold 5 units');