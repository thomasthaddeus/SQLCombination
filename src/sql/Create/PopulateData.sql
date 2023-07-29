USE employeedatabase;

/* Clear data in reverse order due to foriegn key constraints */
DELETE FROM Employee WHERE EmployeeID > 0;
DELETE FROM Job WHERE JobID > 0;
DELETE FROM Department WHERE DeptID > 0;

/* Populate Departments first */

INSERT INTO Department (DeptID, DeptName)
VALUES (1, 'Corporate');
INSERT INTO Department (DeptID, DeptName)
VALUES (2, 'Regional Management');
INSERT INTO Department (DeptID, DeptName)
VALUES (3, 'HR');
INSERT INTO Department (DeptID, DeptName)
VALUES (4, 'Accounting');
INSERT INTO Department (DeptID, DeptName)
VALUES (5, 'Qwality Assurance');
INSERT INTO Department (DeptID, DeptName)
VALUES (6, 'Customer Service');
INSERT INTO Department (DeptID, DeptName)
VALUES (7, 'Sales');
INSERT INTO Department (DeptID, DeptName)
VALUES (8, 'IT');
INSERT INTO Department (DeptID, DeptName)
VALUES (9, 'Reception');
INSERT INTO Department (DeptID, DeptName)
VALUES (10, 'Office Management');

/* Populate Jobs Next */

INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (1, 1, 'CEO', 300000.00, NULL, 40.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (2, 1, 'CFO', 280000.00, NULL, 40.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (3, 2, 'General Manager', 180000.00, NULL, 30.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (4, 2, 'Assistant to the General Manager', 130000.00, NULL, 15.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (5, 3, 'HR Rep', 80000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (6, 4, 'Accountant', 90000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (7, 5, 'QA Engineer', 80000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (8, 6, 'Customer Success Manager', 70000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (9, 7, 'Sales Manager', 70000.00, 30.0, NULL);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (10, 8, 'IT Specialist', 95000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (11, 9, 'Receptionist', 55000.00, NULL, 10.0);
INSERT INTO Job (JobID, DeptID, JobName, Salary, CommPerc, BonusPerc)
VALUES (12, 10, 'Office Manager', 60000.00, NULL, 10.0);

/* Employee Table Last */

INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (1, 2, 'David', 'Wallace', 'david.wallace@office.com', '5555555000', 380000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (2, 3, 'Michael', 'Scott', 'michael.scott@office.com', '5555555000', 220000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (3, 4, 'Dwight', 'Schrute', 'dwight.schrute@office.com', '5555555000', 145000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (4, 5, 'Toby', 'Flenderson', 'toby.flenderson@office.com', '5555555000', 85000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (5, 6, 'Angela', 'Martin', 'angela.martin@office.com', '5555555000', 94000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (6, 7, 'Creed', 'Bratton', 'creed.bratton@office.com', '5555555000', 85000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (7, 8, 'Kelly', 'Kapoor', 'kelly.kapoor@office.com', '5555555000', 73000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (8, 9, 'Jim', 'Halpert', 'jim.halpert@office.com', '5555555000', 97000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (9, 11, 'Erin', 'Hannon', 'erin.hannon@office.com', '5555555000', 55000.00, '2006-03-03 01:15:00');
INSERT INTO Employee (EmployeeID, JobID, FirstName, LastName, EmailAddress, Phone, GrossPay, HireDate)
VALUES (10, 12, 'Pam', 'Halpert', 'pam.halper@office.com', '5555555000', 70000.00, '2006-03-03 01:15:00');
