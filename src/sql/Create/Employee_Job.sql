CREATE VIEW Employee_Job AS
    SELECT CONCAT(e.FirstName, ' ', e.LastName) AS [Full Name],
           j.JobName AS [Job Title]
      FROM Employee e
           JOIN
           Job j ON j.JobID = e.JobID
     GROUP BY 'Full Name',
              'Job Title';