USE master;
GO

-- Change The name if you want a different name for the db
IF DB_ID('DBMS_456') IS NOT NULL DROP DATABASE DBMS_456;

CREATE TABLE [dbo].[Department]
(
    [DeptID] INT NOT NULL IDENTITY,
    [DeptName] [nvarchar](50) NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY ([DeptID] ASC)
);
CREATE TABLE [dbo].[Job]
(
    [JobID] INT NOT NULL IDENTITY,
    [DeptID] INT NOT NULL,
    [JobName] [nvarchar](50) NOT NULL,
    [Salary] [money] NULL,
    [GrossPay] [money] NULL,
    [CommPerc] [decimal](18, 0) NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY(JobID),
    CONSTRAINT [FK_Job_Department] FOREIGN KEY(DeptID) REFERENCES [dbo].[Department](DeptID)
	ON DELETE CASCADE
);
GO
CREATE TABLE [dbo].[Employee]
(
    [EmployeeID] INT NOT NULL IDENTITY,
    [JobID] INT NOT NULL,
    [FirstName] [nvarchar](50) NULL,
    [LastName] [nvarchar](50) NULL,
    [EmailAddress] [nvarchar](50) NULL,
    [Phone] [char](12) NULL,
    [HireDate] [datetime] NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY(EmployeeID),
    CONSTRAINT FK_Employee_Job FOREIGN KEY(JobID) REFERENCES [dbo].[Job](JobID)
    ON DELETE CASCADE
);
