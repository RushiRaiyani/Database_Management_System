CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

--Part – A:
--1. Find all persons with their department name & code.
SELECT Person.PersonName,Dept.DepartmentName,Dept.DepartmentCode from Person inner join Dept on Person.DepartmentID=Dept.DepartmentID
--2. Find the person's name whose department is in C-Block.
SELECT Person.PersonName,Dept.DepartmentName,Dept.Location FROM Person inner JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE Dept.Location='C-Block'
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT Person.PersonName,Person.City,Person.Salary,Dept.DepartmentName FROM Person left outer JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE Person.City='Jamnagar'
--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT Person.PersonName,Person.City,Person.Salary, Dept.DepartmentName FROM Person LEFT OUTER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE not Person.City='Rajkot'
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT Person.PersonName,Dept.DepartmentName, Person.JoiningDate FROM Person LEFT OUTER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE Person.JoiningDate>'1-Aug-2001' and Dept.DepartmentName='Civil'
--6. Find details of all persons who belong to the computer department.
SELECT Person.PersonName,Person.City, Person.Salary, Person.JoiningDate, Dept.DepartmentName, Dept.Location FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE Dept.DepartmentName='Computer'
--7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT Person.PersonName,Dept.DepartmentName, Person.JoiningDate FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID WHERE DATEDIFF(DAY,Person.JoiningDate,GETDATE())>365
--8. Find department wise person counts.
SELECT Dept.DepartmentName,COUNT(Dept.Departmentid)FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID GROUP BY Dept.DepartmentName
--9. Give department wise maximum & minimum salary with department name.
SELECT Dept.DepartmentName, MAX(Person.Salary) as MaxSalary, MIN(Person.Salary) as MinSalary FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID GROUP BY Dept.DepartmentName
--10. Find city wise total, average, maximum and minimum salary.
SELECT Person.City,Max(Person.Salary) as MaxSalary,MIN(Person.Salary) as MinSalary,AVG(Person.Salary) as AvgSalary,SUM(Person.Salary) as TotalSalary FROM Person GROUP BY Person.City
--11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(Person.Salary) as AvgSalary, Person.City FROM Person GROUP BY Person.City HAVING Person.City='Ahmedabad'
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
Select Person.PersonName + ' lives in ' + Person.City + ' and works in '+ Dept.DepartmentName + ' Department' FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID
--Part – B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT Person.PersonName + ' earns ' + CAST(Salary as varchar) +' from Department ' + Dept.DepartmentName + ' monthly ' FROM Person INNER JOIN Dept ON Person.DepartmentID=Dept.DepartmentID 
--2. Find city & department wise total, average & maximum salaries.
Select Person.City,Dept.DepartmentName,sum(Person.Salary),avg(Person.Salary),max(Person.Salary) from person inner join Dept on Person.DepartmentID=Dept.DepartmentID group by Person.city,Dept.DepartmentName
--3. Find all persons who do not belong to any department.
Select Person.PersonName from Person where Person.DepartmentID is NULL
--4. Find all departments whose total salary is exceeding 100000.
Select Dept.DepartmentName,SUM(Person.Salary) as TotalDeptSalary from person join Dept on Person.DepartmentID=Dept.DepartmentID Group by DepartmentName having sum(Person.Salary)>100000
--Part – C:
--1. List all departments who have no person.
select Dept.DepartmentName from person inner join Dept on Person.DepartmentID=Dept.DepartmentID group by Dept.DepartmentName having count(Person.DepartmentID)=0
--2. List out department names in which more than two persons are working.
Select Dept.DepartmentName,COUNT(*) as PersonCount from Person inner join Dept on Person.DepartmentID=Dept.DepartmentID group by Dept.DepartmentName having count(Person.DepartmentID)>2
--3. Give a 10% increment in the computer department employee’s salary. (Use Update)UPDATE Person SET Person.Salary=(Person.Salary+(Person.Salary*10)/100) from Person inner join Dept on Person.DepartmentID=Dept.DepartmentID where Dept.DepartmentName='computer'