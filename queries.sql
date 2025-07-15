/*
Name:Harshdeep Virk
project:final_proj
subject:DBMS2
topic:DML
*/

--5.1.1	Write a query (inner join) to retrieve data from 2 tables
--Employees that have department assigned to them.
SELECT e.first_name, e.last_name ,d.department_name
FROM Employees e 
JOIN Departments d
 ON d.department_id = e.department_id;

--5.1.2	Write a query (inner) to retrieve data from 3 or more tables
--Employees with their job titles
SELECT e.first_name, e.last_name ,j.job_title
FROM Employees e
JOIN Employee_Job ej
	ON ej.employee_id = e.employee_id
JOIN Jobs j
	ON ej.job_id = j.job_id;
	
--5.2.1	Write a query (outer join) to retrieve data from 2 tables (must be able to explain the purpose)
--Departments without employees, departments with employees ,excludes employee that are not assigned a department
SELECT e.first_name, e.last_name ,d.department_name
FROM Employees e 
RIGHT OUTER JOIN Departments d
 ON d.department_id = e.department_id;

--5.2.2	Write a query (outer join) to retrieve data from 3 or more tables
--Retrieves all the employees  and their job title if they have\not
SELECT e.first_name, e.last_name ,j.job_title
FROM Employees e
LEFT OUTER JOIN Employee_Job ej
	ON ej.employee_id = e.employee_id
LEFT OUTER JOIN Jobs j
	ON ej.job_id = j.job_id;
	
--5.3.1	Write a non-correlated subquery
--people who make more than the avg salary
SELECT first_name, last_name
FROM Employees
WHERE salary >( SELECT AVG(salary) FROM Employees);

--5.4.1	Write a correlated subquery
--All the people who make more than the avg salary in their department
SELECT e.salary ,e.first_name,e.department_id
FROM Employees e
WHERE e.salary >(SELECT AVG(E.salary) FROM Employees E WHERE E.department_id  = e.department_id);

--5.5.2	Aggregate the data in some way
SELECT department_id, AVG(salary) AS average_salary
FROM Employees
GROUP BY department_id;