-- SQLite ready

CREATE TABLE Department
(   [DeptID] INT NOT NULL,
    [DeptName] [nvarchar](50) NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY ([DeptID] ASC)
);
CREATE TABLE Job
(
    [JobID] INT NOT NULL,
    [DeptID] INT NOT NULL,
    [JobName] [nvarchar](50) NOT NULL,
    [Salary] [money] NULL,
    [GrossPay] [money] NULL,
    [CommPerc] [decimal](18, 0) NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY(JobID),
    CONSTRAINT [FK_Job_Department] FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
CREATE TABLE Employee
(
    [EmployeeID] INT NOT NULL,
    [JobID] INT NOT NULL,
    [FirstName] [nvarchar](50) NULL,
    [LastName] [nvarchar](50) NULL,
    [EmailAddress] [nvarchar](50) NULL,
    [Phone] [char](12) NULL,
    [HireDate] [datetime] NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY(EmployeeID),
    CONSTRAINT FK_Employee_Job FOREIGN KEY (JobID) REFERENCES Job(JobID)
);
 