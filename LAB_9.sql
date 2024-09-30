CREATE TABLE STUDENT_DATA(
NO INT,
NAME VARCHAR(50),
CITY VARCHAR(50),
DID INT
);
INSERT INTO STUDENT_DATA VALUES (101,'RAJU','RAJKOT',10),
(102,'AMIT','AHMEDABAD',20),
(103,'SANJAY','BARODA',40),
(104,'NEHA','RAJKOT',20),
(105,'MEERA','AHMEDABAD',30),
(106,'MAHESH','BARODA',10)
CREATE TABLE ACADEMIC(
RNO INT,
SPI DECIMAL(4,2),
BKLOG INT
);
INSERT INTO ACADEMIC VALUES
(101,8.8,0),
(102,9.2,2),
(103,7.6,1),
(104,8.2,4),
(105,7.0,2),
(106,8.9,3)
CREATE TABLE DEPARTMENT(
DID INT,
DNAME VARCHAR(50)
);
INSERT INTO DEPARTMENT VALUES
(10,'COMPUTER'),
(20,'ELECTRICAL'),
(30,'MECHANICAL'),
(40,'CIVIL')
--Part – A:
--1. Display details of students who are from computer department.
Select Name from Student_Data where did in (Select DID from DEPARTMENT where DNAME='Computer')
--2. Displays name of students whose SPI is more than 8.
Select NAME from Student_Data where no in (Select RNO from ACADEMIC where spi>8)
--3. Display details of students of computer department who belongs to Rajkot city.
select * from Student_Data where did in (select DID from DEPARTMENT where DNAME='computer') and city='rajkot'
--4. Find total number of students of electrical department.
select count(name) from STUDENT_DATA where did=(select did from DEPARTMENT where DNAME='electrical')
--5. Display name of student who is having maximum SPI.
SELECT NAME FROM STUDENT_DATA WHERE no = ( SELECT RNO FROM Academic WHERE SPI = ( SELECT MAX(SPI) FROM Academic))
--6. Display details of students having more than 1 backlog.
SELECT NAME FROM STUDENT_DATA WHERE no in ( SELECT RNO FROM Academic WHERE BKLOG>1)
--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
select name from STUDENT_DATA where DID in (select did from DEPARTMENT where DNAME in ('computer','mechanical'))
--2. Display name of students who are in same department as 102 studying in.
select name from STUDENT_DATA where did in (select did from STUDENT_DATA where no=102)
--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
select name from STUDENT_DATA where no in (select rno from ACADEMIC where spi>9) and did in (select did from DEPARTMENT where DNAME='electrical')
--2. Display name of student who is having second highest SPI.
SELECT NAME FROM STUDENT_DATA WHERE NO=(SELECT RNO FROM ACADEMIC WHERE SPI=( SELECT TOP 1 SPI FROM (SELECT DISTINCT TOP 2 SPI FROM ACADEMIC ORDER BY SPI DESC)as temp ORDER BY SPI ASC));
--3. Display city names whose students branch wise SPI is 9.2
SELECT DISTINCT City FROM STUDENT_DATA WHERE no IN ( SELECT Rno FROM Academic WHERE SPI = 9.2)


--SET OPERATOR
CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);
INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');
CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);
INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');
--PART-A
--1. Display name of students who is either in Computer or in Electrical.
select name from computer union select name from Electrical
--2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT Name FROM Computer UNION ALL SELECT Name FROM Electrical 
--3. Display name of students who is in both Computer and Electrical.
SELECT Name FROM Computer INTERSECT SELECT Name FROM Electrical 
--4. Display name of students who are in Computer but not in Electrical.
SELECT Name FROM Computer EXCEPT SELECT Name FROM Electrical
--5. Display name of students who are in Electrical but not in Computer.
SELECT Name FROM Electrical EXCEPT SELECT Name FROM Computer
--6. Display all the details of students who are either in Computer or in Electrical.
SELECT * FROM Computer UNION SELECT * FROM Electrical
--7. Display all the details of students who are in both Computer and Electrical.SELECT * FROM Computer INTERSECT SELECT * FROM Electrical
------------------ PART B ----------------------

CREATE TABLE Emp_DATA (
    EID INT,
    Name VARCHAR(50)
);
INSERT INTO Emp_DATA (EID, Name) VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');
CREATE TABLE Customer (
    CID INT,
    Name VARCHAR(50)
);
INSERT INTO Customer (CID, Name) VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

--1. Display name of persons who is either Employee or Customer.
SELECT Name FROM Emp_DATA UNION SELECT Name FROM Customer
--2. Display name of persons who is either Employee or Customer including duplicate data.
SELECT Name FROM Emp_DATA UNION ALL SELECT Name FROM Customer
--3. Display name of persons who is both Employee as well as Customer.
SELECT Name FROM Emp_DATA INTERSECT SELECT Name FROM Customer
--4. Display name of persons who are Employee but not Customer.
SELECT Name FROM Emp_DATA EXCEPT SELECT Name FROM Customer 
--5. Display name of persons who are Customer but not Employee.
SELECT Name FROM Customer EXCEPT SELECT Name FROM Emp_DATA

--Part – C: 
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only
--1
SELECT EID,Name FROM Emp_DATA UNION SELECT CID, Name FROM Customer 
--2
SELECT EID,Name FROM Emp_DATA UNION ALL SELECT CID,Name FROM Customer 
--3
SELECT EID,Name FROM Emp_DATA INTERSECT SELECT CID,Name FROM Customer 
--4
SELECT EID,Name FROM Emp_DATA EXCEPT SELECT CID,Name FROM Customer 
--5
SELECT CID,Name FROM Customer EXCEPT SELECT EID,Name FROM Emp_DATA 