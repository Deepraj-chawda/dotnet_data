-- Task 1: Create the CareerHub database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CareerHub')
    CREATE DATABASE CareerHub;
GO

USE CareerHub;
GO

-- Task 2: Create the Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName NVARCHAR(255),
    Location NVARCHAR(255)
);

-- Task 3: Create the Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT FOREIGN KEY REFERENCES Companies(CompanyID),
    JobTitle NVARCHAR(255),
    JobDescription TEXT,
    JobLocation NVARCHAR(255),
    Salary DECIMAL,
    JobType NVARCHAR(255),
    PostedDate DATETIME
);

-- Task 4: Create the Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName NVARCHAR(255),
    LastName NVARCHAR(255),
    Email NVARCHAR(255),
    Phone NVARCHAR(20),
    Resume NVARCHAR(MAX)
);

-- Task 4: Create the Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT FOREIGN KEY REFERENCES Jobs(JobID),
    ApplicantID INT FOREIGN KEY REFERENCES Applicants(ApplicantID),
    ApplicationDate DATETIME,
    CoverLetter TEXT
);

-- Insert data into Companies table
INSERT INTO Companies (CompanyID, CompanyName, Location) VALUES
(1, 'ABC Tech Solutions', 'New York'),
(2, 'Innovate Solutions', 'San Francisco'),
(3, 'DataCrafters Inc.', 'Austin');

-- Insert data into Jobs table
INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(1, 1, 'Software Developer', 'Develop and maintain software applications', 'New York', 80000, 'Full-time', '2023-03-15'),
(2, 1, 'Data Analyst', 'Analyze and interpret data for business insights', 'New York', 70000, 'Part-time', '2023-04-01'),
(3, 2, 'Web Designer', 'Create visually appealing and user-friendly websites', 'San Francisco', 75000, 'Full-time', '2023-05-10'),
(4, 2, 'Network Engineer', 'Design and implement computer networks', 'San Francisco', 90000, 'Full-time', '2023-06-22'),
(5, 3, 'Database Administrator', 'Manage and optimize database systems', 'Austin', 85000, 'Contract', '2023-07-05'),
(6, 3, 'Machine Learning Engineer', 'Develop algorithms for predictive modeling', 'Austin', 95000, 'Full-time', '2023-08-12');

-- Insert data into Applicants table
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume) VALUES
(1, 'Alice', 'Johnson', 'alice@email.com', '123-456-7890', 'Alice Johnson Resume'),
(2, 'Bob', 'Miller', 'bob@email.com', '987-654-3210', 'Bob Miller Resume'),
(3, 'Charlie', 'Smith', 'charlie@email.com', '555-123-4567', 'Charlie Smith Resume'),
(4, 'David', 'Williams', 'david@email.com', '111-222-3333', 'David Williams Resume');

-- Insert data into Applications table with specified random ApplicationDate
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(1, 1, 1, '2023-03-20', 'Excited to contribute to software development at ABC Tech Solutions'),
(2, 2, 2, '2023-04-05', 'Passionate about data analysis and problem-solving'),
(3, 3, 3, '2023-05-15', 'Experience in creating visually appealing websites'),
(4, 4, 1, '2023-06-25', 'Interested in designing and implementing computer networks'),
(5, 5, 2, '2023-07-10', 'Database administration expertise and strong analytical skills'),
(6, 6, 3, '2023-08-18', 'Machine learning enthusiast with a focus on predictive modeling');

-- Task 5: Count the number of applications for each job listing
SELECT JobTitle, ISNULL(COUNT(ApplicationID), 0) AS ApplicationCount
FROM Jobs
LEFT JOIN Applications ON Jobs.JobID = Applications.JobID
GROUP BY JobTitle;

-- Task 6: Retrieve job listings within a salary range
DECLARE @MinSalary DECIMAL = 60000;
DECLARE @MaxSalary DECIMAL = 80000;
SELECT JobTitle, CompanyName, JobLocation, Salary
FROM Jobs
JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE Salary BETWEEN @MinSalary AND @MaxSalary;

-- Task 7: Retrieve job application history for a specific applicant
DECLARE @ApplicantID INT = 1; -- Replace with the desired ApplicantID
SELECT JobTitle, CompanyName, ApplicationDate
FROM Applications
JOIN Jobs ON Applications.JobID = Jobs.JobID
JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE ApplicantID = @ApplicantID;

-- Task 8: Calculate and display the average salary offered by all companies
SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- Task 9: Identify the company that has posted the most job listings
SELECT TOP 1 WITH TIES CompanyName, COUNT(JobID) AS JobCount
FROM Jobs
JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
GROUP BY CompanyName
ORDER BY JobCount DESC;

-- Task 10: Find applicants with at least 3 years of experience in 'CityX'
SELECT DISTINCT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
JOIN Jobs J ON Ap.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE  C.Location = 'Austin';

-- Task 11: Retrieve distinct job titles with salaries between $60,000 and $80,000
SELECT DISTINCT JobTitle, Salary
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

-- Task 12: Find jobs that have not received any applications
SELECT JobTitle
FROM Jobs
WHERE JobID NOT IN (SELECT JobID FROM Applications);

-- Task 13: Retrieve a list of job applicants with the companies and positions they applied for
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
LEFT JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
LEFT JOIN Jobs J ON Ap.JobID = J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

-- Task 14: Retrieve a list of companies with the count of jobs they have posted, even if they have not received any applications
SELECT C.CompanyName, COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
LEFT JOIN Applications Ap ON J.JobID = Ap.JobID
GROUP BY C.CompanyName;

-- Task 15: List all applicants with the companies and positions they have applied for, including those who have not applied
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
LEFT JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
LEFT JOIN Jobs J ON Ap.JobID = J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

-- Task 16: Find companies that have posted jobs with a salary higher than the average salary of all jobs
SELECT DISTINCT C.CompanyName
FROM Companies C
JOIN Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);

-- Task 17: Display a list of applicants with their names and a concatenated string of their city and state
SELECT A.FirstName, A.LastName, C.Location + ', ' + 'USA' AS Location
FROM Applicants A
JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
JOIN Jobs J ON Ap.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID;

-- Task 18: Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'
SELECT * FROM Jobs WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

-- Task 19: Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
FULL JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
FULL JOIN Jobs J ON Ap.JobID = J.JobID
FULL JOIN Companies C ON J.CompanyID = C.CompanyID;

-- Task 20: List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience
DECLARE @TargetCity NVARCHAR(255) = 'Austin';
SELECT A.FirstName, A.LastName, C.CompanyName
FROM Applicants A
CROSS JOIN Companies C
WHERE C.Location = @TargetCity ;
