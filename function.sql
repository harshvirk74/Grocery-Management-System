--Function that calculate no. of employees with slary higer than $100000
CREATE OR ALTER FUNCTION ufn_CountEmployeesWithHighSlaries(
)
RETURNS INT
AS BEGIN
	DECLARE @Count INT;

	SELECT @Count =COUNT(*)
	FROM Employees
	 WHERE salary > 100000;
	RETURN @Count
END;

SELECT dbo.ufn_CountEmployeesWithHighSlaries() AS HighSalaryEmployeeCount;