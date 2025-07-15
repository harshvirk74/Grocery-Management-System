--Stored Procedures
--The employee name is Harshdeep Virk

CREATE OR ALTER PROCEDURE usp_GetEmployeeInformation
    @employee_id INT
AS
BEGIN
    DECLARE
        @Name NVARCHAR(50),
        @Salary DECIMAL(10,2),
        @Department NVARCHAR(50);
    SELECT 
        @Name = CONCAT(e.first_name, ' ', e.last_name), 
        @Salary = e.salary, 
        @Department = d.department_name
    FROM Employees e
    JOIN Departments d ON d.department_id = e.department_id
    WHERE e.employee_id = @employee_id;  

    -- Check if employee exists before printing
    IF @Name IS NOT NULL
    BEGIN
        PRINT 'The employee ' + @Name + ' is paid ' + CAST(@Salary AS NVARCHAR(20)) + ' and works in the ' + @Department + ' department';
    END
    ELSE
    BEGIN
        PRINT 'Employee with ID ' + CAST(@employee_id AS NVARCHAR(10)) + ' does not exist.';
    END
END;

--exec
EXEC usp_GetEmployeeInformation 3;