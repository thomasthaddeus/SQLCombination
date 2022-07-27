--
-- File generated with SQLiteStudio v3.3.3 on Mon Jul 18 05:01:40 2022
--
-- Text encoding used: System

USE Company;
GO

-- View: Job_Name_ID_Employee
DROP VIEW IF EXISTS Job_Name_ID_Employee;
CREATE VIEW Job_Name_ID_Employee
(
    [Job Code],
    Job,
    [Employee Name]
)
AS
    (SELECT JobID AS [Job Code],
        JobName AS Job,
        (FirstName + LastName) AS [Employee Name]
    FROM JOB
        JOIN
        Employee ON Job.JobID = Employee.JobID
    );
