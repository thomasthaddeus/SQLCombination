---------------------------------------------------------------------
-- Class:  IS360 - Database Technologies
-- Quarter: Spring 2022
-- Name:  Thaddeus Thomas
-- Assignment:  VL06
-- LAB Stored Procedures
---------------------------------------------------------------------

USE TSQL2018;
GO

-- Start fresh (if needed)
IF OBJECT_ID( 'Sales.GetTopCustomers' ) IS NOT NULL DROP PROCEDURE Sales.GetTopCustomers
GO
---------------------------------------------------------------------
--							Task 0								   --
---------------------------------------------------------------------
-- Execute the provided T-SQL code to return the custid, contactname and total sales
-- for the top ten customers based on their total sales value.
SELECT 
	c.custid,
	c.contactname,
	SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o
JOIN Sales.Customers AS c 
ON c.custid = o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

---------------------------------------------------------------------
--							Task 1								   --
---------------------------------------------------------------------
-- Create a stored procedure named Sales.GetTopCustomers. Use the query above for the procedure definition.
GO
CREATE PROCEDURE Sales.GetTopCustomers
AS
SET NOCOUNT ON;
SELECT 
	c.custid,
	c.contactname,
	SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o
JOIN Sales.Customers AS c 
ON c.custid = o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Write a T-SQL statement to execute the created procedure.
EXEC Sales.GetTopCustomers;
GO
-- Execute the T-SQL statement.

---------------------------------------------------------------------
--							Task 2								   --
---------------------------------------------------------------------
-- Modify the Sales.GetTopCustomers stored procedure to include a parameter of type int named @orderyear.
-- Add a WHERE clause to the query in the function definition to filter by order year.
-- Use the YEAR() function and the orderdate column from the Orders table, check if it equals the @orderyear parameter
ALTER PROCEDURE Sales.GetTopCustomers YEAR(@orderyear) int
AS
SET NOCOUNT ON;
GO
SELECT @orderyear, orderdate
FROM Sales.OrderValues
WHERE @orderyear = YEAR(orderdate)


-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure for the year 2016.
EXEC Sales.GetTopCustomers WHERE YEAR = 2016;


-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure for the year 2017.



-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure without a parameter. 



-- Execute the T-SQL statement. What happened? What is the error message?
--
-- If an application was designed to use the exercise 1 version of the stored procedure, 
-- would the modification made to the stored procedure in this exercise impact the usability of that application?

---------------------------------------------------------------------
--							Task 3								   --
--------------------------------------------------------------------- 
-- Modify the Sales.GetTopCustomers stored procedure to give the @orderyear parameter a default NULL
ALTER PROCEDURE Sales.GetTopCustomers 
	@orderyear int = NULL
AS
SET NOCOUNT ON

;


-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure without a parameter. 



-- Execute the T-SQL statement

---------------------------------------------------------------------
--							Task 4								   --
---------------------------------------------------------------------
-- Add the integer parameter @n to the Sales.GetTopCustomers stored procedure. Use this parameter to specify how many customers you want retrieved.
-- Use a default value of 10.
Sales.GetTopCustomers @n int
AS
SET NOCOUNT ON;
SELECT @n AS



-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure without any parameters.
EXECUTE Sales.GetTopCustomers;

-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure for order year 2017 and five customers.
EXECUTE Sales.GetTopCustomers @orderyear = 2017 AND TOP(custid(5));

-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure for the order year 20016.
EXECUTE Sales.GetTopCustomers @orderyear(20016)


-- Write an EXECUTE statement to invoke the Sales.GetTopCustomers stored procedure to retrieve 20 customers.
EXECUTE Sales.GetTopCustomers @custid = [1:20]


-- Do the applications using the stored procedure need to be changed because another parameter was added?




----------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------
-- Class:  IS360 - Database Technologies
-- Quarter: Spring 2022
-- Name:  Thaddeus Thomas
-- Assignment:  VL06
-- LAB CTE Exercises
---------------------------------------------------------------------

USE TSQL2018;
GO

-- Write a SELECT statement against Sales.OrderValues to retrieve each customer’s ID and total sales amount for the year 2017. 
SELECT YEAR(orderdate) AS orderyear, (DISTINCT custid) AS id
FROM Sales.OrderValues
WHERE YEAR(orderdate) = 2017
;

-- CTE Exercise Task 2
---------------------------------------------------------------------
-- Define a CTE named c2017 based on this query naming the CTE columns custid and salesamt2017. 
-- Join the Sales.Customers table and the c2017 CTE, returning the custid and contactname columns from the Sales.Customers table
-- and the salesamt2017 column from the c2017 CTE.
--
-- Execute the T-SQL code
WITH c2017_CTE AS
	(
	SELECT custid, contactname
	FROM Sales.Customers
	)
	SELECT custid, salesamt2017
	FROM c2017_CTE

----------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------
-- Class:  IS360 - Database Technologies
-- Quarter: Spring 2022
-- Name:  Thaddeus Thomas
-- Assignment:  VL06
-- LAB UDF and TFV Exercise
---------------------------------------------------------------------

USE TSQL2018;
GO

---------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------
-- Create a User Defined Function called getEmpName in the HR schema
-- that has an integer input parameter called @empid
-- The function returns the concatenated firstname and lastname values from HR.Employees
-- for the employee whose empid matches the parameter value
CREATE FUNCTION HR.getEmpName AS getEmpName
FROM @empid INT

;GO
---------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------
--
-- Write a SELECT statement against the Sales.OrderValues view to retrieve the custid and total sum of the val column when grouped by custid. 
-- Filter the results to include orders only for the order year 2016.


--
-- Execute the written statement to test the code and verify the results
--

-- Define an inline table-valued function using the following function header and add your previous query after the RETURN clause.
-- Include an integer input parameter called @orderyear
-- modify the query by replacing the '2016' in the WHERE clause with the parameter @orderyear.

CREATE FUNCTION dbo.fnGetSalesByCustomer
-- finish function code


-- Highlight the completed code and execute it. This will create an inline table-valued function named dbo.fnGetSalesByCustomer.

-- 
-- Write a SELECT statement to retrieve the custid and totalsalesamount columns from the dbo.fnGetSalesByCustomer inline table-valued function. 
-- Use the value 2015 for the parameter and execute the query



-- Change the value to 2016 for the parameter then execute the query again



-- Bonus: Alter the dbo.fnGetSalesByCustomer function using two input parameters
-- one for the year and one for the custid

-- test the new function passing two arguments


----------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------
-- Class:  IS360 - Database Technologies
-- Quarter: Spring 2022
-- Name:  Thaddeus Thomas
-- Assignment:  VL06
-- LAB VIEWS
---------------------------------------------------------------------
-- Task 1
--
-- Write a SELECT statement to return the productid, productname, supplierid, unitprice, and discontinued columns from the Production.Products table. 
-- Filter the results to include only products that belong to categoryid equals 1.
USE TSQL2018;
GO
SELECT productid, productname, supplierid, unitprice, discontinued
FROM Productions.Products
WHERE categoryid = 1 ;


-- Modify the T-SQL code to include the following supplied T-SQL statement. Put this statement before the SELECT clause:
-- CREATE VIEW Production.ProductsBeverages AS
-- Execute the complete T-SQL statement. This will create an object view named ProductBeverages under the Production schema.
CREATE VIEW Production.ProductsBeverages AS
SELECT productid, productname, supplierid, unitprice, discontinued
FROM Productions.Products
WHERE categoryid = 1

---------------------------------------------------------------------
---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to return the productid and productname columns from the Production.ProductsBeverages view. 
-- Filter the results to include only products where supplierid equals 1. 
--
-- Execute the written statement

---------------------------------------------------------------------
---------------------------------------------------------------------
-- Task 3
-- 
-- The IT department has written a T-SQL statement that adds an ORDER BY clause to the view created in task 1.
--
-- Execute the provided code. What happened? What is the error message? Why did the query fail?
--
-- Modify the supplied T-SQL statement by including the TOP (100) PERCENT option. The query should look like this: 
--
-- Execute the modified T-SQL statement. By applying the needed changes, you have altered the existing view. 
-- Notice that you are still using the ORDER BY clause. 
--
---------------------------------------------------------------------

ALTER VIEW Production.ProductsBeverages AS
SELECT
	productid, productname, supplierid, unitprice, discontinued
FROM Production.Products
WHERE categoryid = 1
ORDER BY productname;

GO

---------------------------------------------------------------------
-- Task 4
-- 
-- The IT department has written a T-SQL statement that adds an additional calculated column to the view created in task 1. 
--
-- Execute the provided query. What happened? What is the error message? Why did the query fail?
--
-- Apply the changes needed to get the T-SQL statement to execute properly.
---------------------------------------------------------------------

ALTER VIEW Production.ProductsBeverages AS
SELECT
	productid, productname, supplierid, unitprice, discontinued,
	CASE WHEN unitprice > 100. THEN N'high' ELSE N'normal' END
FROM Production.Products
WHERE categoryid = 1;

GO

---------------------------------------------------------------------
-- Task 5
-- 
-- Remove the created view by executing the provided T-SQL statement. Execute this code exactly as written inside a query window.
---------------------------------------------------------------------

IF OBJECT_ID(N'Production.ProductsBeverages', N'V') IS NOT NULL
	DROP VIEW Production.ProductsBeverages;