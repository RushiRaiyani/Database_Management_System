--Select Operation
--Part-A
--1-Retrieve all data from table DEPOSIT. 
SELECT*FROM DEPOSIT
--2-Retrieve all data from table BORROW
SELECT*FROM BORROW
--3. Retrieve all data from table CUSTOMERS. 
SELECT*FROM CUSTOMERS
--4. Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO AS AccountNo,CNAME AS CustomerName,AMOUNT FROM DEPOSIT
--5. Display Loan No, Amount from BORROW.
SELECT LOANNO AS LoanNo,AMOUNT FROM BORROW
--6. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
SELECT LOANNO,CNAME,BNAME,AMOUNT FROM BORROW WHERE BNAME='ANDHERI'
--7. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.
SELECT ACTNO AS AccountNo,AMOUNT FROM DEPOSIT WHERE ACTNO=106
--8. Give name of borrowers having amount greater than 5000 from borrow table. 
SELECT CNAME AS Name FROM BORROW WHERE AMOUNT>=5000
--9. Give name of customers who opened account after date '1-12-96' from deposit table. 
SELECT CNAME AS Name FROM DEPOSIT WHERE ADATE>='1996-12-01'
--10. Display name of customers whose account no is less than 105 from deposit table.
SELECT CNAME AS Name FROM DEPOSIT WHERE ACTNO<=105
--11. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (OR & IN)
SELECT CNAME AS Name FROM CUSTOMERS WHERE CITY='NAGPUR' or CITY='DELHI'
SELECT CNAME AS Name FROM CUSTOMERS WHERE CITY in ('NAGPUR','DELHI')
--12. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table.
SELECT CNAME AS Name,BNAME AS Branch FROM DEPOSIT WHERE AMOUNT>=4000 and ACTNO<=105
--13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (AND & BETWEEN)
SELECT CNAME AS Name FROM BORROW WHERE AMOUNT>=3000 AND AMOUNT<=8000
SELECT CNAME AS Name FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000
--14. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
SELECT CNAME AS Name FROM DEPOSIT WHERE BNAME <> 'ANDHERI'
--15. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G.ROAD’ and Account No is less than 104 from deposit table.
SELECT ACTNO AS AccountNo,CNAME AS Name,AMOUNT FROM DEPOSIT WHERE BNAME in ('AJNI','KAROBAGH','M.G.ROAD') AND ACTNO<104

--Part-B
--1. Display all the details of first five customers from deposit table.
SELECT TOP 5* FROM DEPOSIT
--2. Display all the details of first three depositors whose amount is greater than 1000.
SELECT TOP 3* FROM DEPOSIT WHERE AMOUNT>1000
--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’ from borrow table.
SELECT TOP 5 LOANNO AS LoanNO,CNAME AS Name  FROM BORROW WHERE BNAME <>'ANDHERI'
--4. Retrieve all unique cities using DISTINCT. (Use Customers Table)
SELECT DISTINCT CITY FROM CUSTOMERS
--5. Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT BNAME FROM BRANCH

--Part-C
--1. Retrieve top 50% record from table BORROW.
SELECT TOP 50 PERCENT * FROM BORROW
--2. Display top 10% amount from table DEPOSIT.
SELECT TOP 10 PERCENT AMOUNT FROM DEPOSIT
--3. Display top 25% customer who deposited more than 5000.
SELECT TOP 25 PERCENT CNAME FROM DEPOSIT WHERE AMOUNT>5000
--4. Retrieve first 10% Loan Amounts.
SELECT TOP 10 PERCENT AMOUNT FROM BORROW
--5. Retrieve all unique customer names with city.
SELECT DISTINCT CITY FROM CUSTOMERS
--6. Retrieve all Loan records with one more column in Loan Amount as 10% extra amount.
SELECT*,(AMOUNT+AMOUNT*0.1) AS 'EXTRA AMOUNT' FROM BORROW
--7. Retrieve all odd/even value loan number from Borrow table
SELECT *FROM BORROW WHERE LOANNO %2=1;