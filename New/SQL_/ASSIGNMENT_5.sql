--1. Arrange the ‘Orders’ dataset in decreasing order of amount

CREATE TABLE ORDERS(
ORDER_ID INT,
ORDER_DATE DATE,
AMOUNT INT,
CUSTOMER_ID INT
)

INSERT INTO ORDERS VALUES
(100,'2020-10-01',9000,20),
(110,'2020-10-02',8000,30),
(111,'2020-10-03',7000,3),
(112,'2020-10-04',6000,2),
(113,'2020-10-05',5000,5),
(114,'2020-10-06',4000,10)

SELECT * FROM ORDERS ORDER BY AMOUNT DESC

/*2. Create a table with the name ‘Employee_details1’ consistingof thesecolumns: 
‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 
Create another tablewiththe name ‘Employee_details2’ consisting of the same columns asthefirst
table.
*/
-- Table 1
CREATE TABLE Employee_details1(Emp_id INT,Emp_name VARCHAR(50),Emp_salary INT);INSERT INTO Employee_details1 VALUES(1,'FERNA',5000),(2,'APPLE',6000),(3,'DANNY',7000),(4,'JOHN',8000);SELECT * FROM Employee_details1--TABLE 2CREATE TABLE Employee_details2(Emp_id INT,Emp_name VARCHAR(50),Emp_salary INT);INSERT INTO Employee_details2 VALUES(1,'FERNA',5000),(2,'VISHWA',60000),(3,'CHANDAN',70000),(4,'VIKAS',80000);
select * from Employee_details1
select * from Employee_details2
--Q3 Apply union
select * from Employee_details1
union
select * from Employee_details2
-- UNION ALL (interview que)
select * from Employee_details1
union ALL
select * from Employee_details2
-- Q4 apply intersect
select * from Employee_details1
intersect
select * from Employee_details2
-- Q5 apply Except
select * from Employee_details1
EXCEPT
select * from Employee_details2
--
select * from Employee_details2
EXCEPT
select * from Employee_details1

