-- MySql
-- Database for IS456 Team Project

USE EmployeeDB;

-- Table: Department 
DROP TABLE IF EXISTS Department; 
CREATE TABLE Department (
    DeptID INT NOT NULL,
    DeptName NVARCHAR(50) NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptID ASC)
);
-- Table: Job 
DROP TABLE IF EXISTS Job;
CREATE TABLE Job (
    JobID INT NOT NULL,
    DeptID INT NOT NULL,
    JobName NVARCHAR(50) NOT NULL,
    Salary DECIMAL(13,2) NULL,
    CommPerc DECIMAL(18, 0) NULL,
    BonusPerc DECIMAL(18, 0) NULL,
    CONSTRAINT PK_Job PRIMARY KEY(JobID),
    CONSTRAINT FK_Job_Department FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Table: Employee 
DROP TABLE IF EXISTS Employee; 
CREATE TABLE Employee (
    EmployeeID INT NOT NULL,
    JobID INT NOT NULL,
    FirstName NVARCHAR(50) NULL,
    LastName NVARCHAR(50) NULL,
    EmailAddress NVARCHAR(50) NULL,
    Phone CHAR(12) NULL,
    GrossPay DECIMAL(13,2) NULL,
    HireDate DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY(EmployeeID),
    CONSTRAINT FK_Employee_Job FOREIGN KEY (JobID) REFERENCES Job(JobID),
    CONSTRAINT GrossPay_chk CHECK ((GrossPay > 1000))
);

-- Index: JobID 
ALTER TABLE Job ADD INDEX JobID_IDX (JobID);

-- Views for IS456 Team Project
DROP VIEW IF EXISTS Employee_Job;

CREATE VIEW Employee_Job AS
SELECT 
    CONCAT(e.FirstName,' ', e.LastName) AS full_name,
    j.JobName AS job_title
FROM Employee e
JOIN
Job j ON j.JobID = e.JobID
GROUP BY full_name, job_title;

-- View: Job_Name_ID_Employee 
DROP VIEW IF EXISTS Job_Name_ID_Employee; 

CREATE VIEW Job_Name_ID_Employee  AS 
SELECT 
    j.JobID AS job_code, 
    j.JobName AS Job, 
    CONCAT(e.FirstName,' ', e.LastName) AS employee_name
FROM Job j 
JOIN Employee e
  ON j.JobID = e.JobID; 
