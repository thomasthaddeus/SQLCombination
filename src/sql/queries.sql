/*Tasks 
--#1. Write a query to display the names (first_name, last_name) using alias name "First Name", "Last Name" 
*/
SELECT 
    FirstName AS 'First Name', 
    LastName AS 'Last Name' 
FROM employee; 

--#2. Write a query to get unique department ID from Job table.  
SELECT DISTINCT DeptID 
FROM Job; 

--#3. Write a query to get all employee details from the employee table order by first name, descending.  
SELECT * 
FROM employee 
ORDER BY FirstName DESC; 

--#4. Write a query to get the names (FirstName, LastName), GrossPay, PF of all the employees (PF is calculated as 12% of salary).  
SELECT (e.FirstName + e.LastName) AS Names, j.Salary, j.CommPerc, j.BonusPerc, e.GrossPay 
FROM Employee e
INNER JOIN Job j
ON j.JobID = e.JobID
WHERE j.Salary > 10000
ORDER BY j.salary ASC; 

--#5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.  
SELECT e.EmployeeID, (e.FirstName || ' ' || e.LastName) AS Names, j.Salary 
FROM Employee e
INNER JOIN Job j
ON j.JobID = e.JobID
ORDER BY j.Salary ASC; 

--#6. Write a query to get the total salaries payable to employees.  
SELECT SUM(j.Salary) 
FROM Employee e
INNER JOIN Job j
ON j.JobID = e.JobID;

--#7. Write a query to get the maximum and minimum salary from the employees' table.  
SELECT  
    MAX(Salary) AS 'Maximum', 
    MIN(Salary) AS 'Minimum' 
FROM Job; 

SELECT  
    MAX(GrossPay) AS 'Maximum', 
    MIN(GrossPay) AS 'Minimum' 
FROM Employee; 

--#8 Write a query to get the average salary and number of employees in the employees' table  
SELECT 
    ROUND(AVG(j.Salary)) AS avg_salary,
    COUNT(DISTINCT e.EmployeeID) AS 'Total Employees' 
FROM Employee e
INNER JOIN Job j
ON j.JobID = e.JobID;
