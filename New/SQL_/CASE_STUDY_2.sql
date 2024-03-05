USE DB004_PROD_SQL
--Simple Queries:
--1. List all the employee details.
SELECT * FROM EMPLOYEE
--2. List all the department details. 
SELECT * FROM DEPARTMENT
--3. List all job details.
SELECT * FROM JOB
--4. List all the locations. 
SELECT * FROM LOCATION
--5. List out the First Name, Last Name, Salary, Commission for allEmployees. 
SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE

/*6. List out the Employee ID, Last Name, Department ID for all employeesandalias
Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id". */
SELECT EMPLOYEE_ID AS [ID of the Employee],
LAST_NAME AS [NAME of the EMPLOYEE],
DEPARTMENT_ID AS Dep_id
FROM EMPLOYEE
--7. List out the annual salary of the employees with their names only.
select first_name, last_name, middle_name, salary from employee
--order by salary

/*WHERE Condition:
1. List the details about "Smith". */
select * from employee
where last_name = 'smith'

--2. List out the employees who are working in department 20. 
select * from employee
where department_id = 20

--3. List out the employees who are earning salaries between 3000and4500. 
select * from employee
where salary between 3000 and 4500

--4. List out the employees who are working in department 10 or 20. 
select * from employee
where DEPARTMENT_ID = 10 or DEPARTMENT_ID =20

--5. Find out the employees who are not working in department 10 or 30. 
select * from employee
where DEPARTMENT_ID !=30 or DEPARTMENT_ID !=10

--6. List out the employees whose name starts with 'S'.
select * from employee
where last_name like 'S%'

--7. List out the employees whose name starts with 'S' and ends with'H'. 
select * from employee
where last_name like 'S%' and last_name like '%H'

--8. List out the employees whose name length is 4 and start with 'S'. 
select * from employee
where last_name like 'S____' 

--9. List out employees who are working in department 10 and draw salaries more than 3500. 
select * from EMPLOYEE
where
DEPARTMENT_ID = 10 and SALARY>3500

--10. List out the employees who are not receiving commission.*/
select * from EMPLOYEE
where
comm is null

/*ORDER BY Clause:*/
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select employee_id, last_name from EMPLOYEE
order by EMPLOYEE_ID asc

--2. List out the Employee ID and Name in descending order based on salary. 
select employee_id, last_name from EMPLOYEE
order by salary desc

--3. List out the employee details according to their Last Name in ascending-order.
select * from EMPLOYEE
order by LAST_NAME asc

/*4. List out the employee details according to their Last Name in ascendingorder and 
then Department ID in descending order.*/
select * from EMPLOYEE
order by LAST_NAME, department_id desc

/*GROUP BY and HAVING Clause:*/
--1. How many employees are in different departments in theorganization?
select department_id, count(1) as [no. of emp]
from employee
group by department_id


--2. List out the department wise maximum salary, minimumsalary andaverage salary of the employees. 
select department_id,
avg(salary) as avg_salary,max(salary) as MAX_sal, min(salary) as MIN_sal from employee
group by department_id



--3. List out the job wise maximum salary, minimum salary and averagesalary of the employees. 
select job_id,
avg(salary) as avg_salary,max(salary) as MAX_sal, min(salary) as MIN_sal from employee
group by job_id
--having sum(salary)>=800
--use DB004_PROD_SQL
--4. List out the number of employees who joined each month in ascendingorder.

select month(hire_date) as month, count(*) as [no. of emp] from employee
group by month(hire_date)

--5. List out the number of employees for each month and year in ascending order based on the year and month.
select year(hire_date) as year, month(hire_date) as month, count(*) as emp_mon
from employee
group by month(hire_date),year(hire_date)

--6. List out the Department ID having at least four employees. 
select department_id, count(1) as [no. of emp] from EMPLOYEE

group by DEPARTMENT_ID
having
count(DEPARTMENT_ID)>=4
--7. How many employees joined in the month of January?

select month(hire_date), count(1) as [no. of emp] from EMPLOYEE
where datename(MM,hire_date) = 'January'
group by month(HIRE_DATE)

--8. How many employees joined in the month of January orSeptember?
select month(hire_date), count(1) as [no. of emp] from EMPLOYEE
where datename(MM,hire_date) in ('January','September')
group by month(HIRE_DATE)

--9. How many employees joined in 1985?
select year(hire_date), count(1) as [no. of emp] from EMPLOYEE
where datename(yy,hire_date) = '1985'
group by year(HIRE_DATE)

--10. How many employees joined each month in 1985?
select month(hire_date) month,year(hire_date),count(1) as [no. of emp] from EMPLOYEE
where datename(yy,hire_date) = '1985'
group by month(HIRE_DATE), year(hire_date)

--11. How many employees joined in March 1985?
select month(hire_date) month,year(hire_date),count(1) as [no. of emp] from EMPLOYEE
where datename(yy,hire_date) = '1985' and datename(MM,hire_date) = 'March'
group by month(HIRE_DATE), year(hire_date)

--12. Which is the Department ID having greater than or equal to 3 employeesjoining in April 1985?*/
select Department_id, count(1) as [no. of emp] from EMPLOYEE
where datename(yy,hire_date) = '1985' and datename(MM,hire_date) = 'April'
group by department_id, month(HIRE_DATE), year(hire_date)
having count(1)>=3


--Joins:
--1. List out employees with their department names. 
select * from employee 
inner join department
on 
employee.department_id = department.department_id

--2. Display employees with their designations. 
select * from employee 
inner join job
on 
employee.job_id = job.job_id

--3. Display the employees with their department names and regional groups. 
select Last_name, LOCATION.City as [regional group], employee.DEPARTMENT_ID, department.Name from employee 
inner join Department
on 
employee.DEPARTMENT_ID = department.Department_Id
inner join LOCATION
on
DEPARTMENT.Location_Id=LOCATION.Location_ID

--4. How many employees are working in different departments? Displaywithdepartment names. 

select 
name, DEPARTMENT_ID , count(1) as [no. of employee] from  
(select name, department.department_id from DEPARTMENT
inner join employee
on 
DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID) N
group by name,Department_Id

--5. How many employees are working in the sales department?
select 
name, DEPARTMENT_ID , count(1) as [no. of employee] from
 
(select name, department.department_id from DEPARTMENT
inner join employee
on 
DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID) M
where name = 'sales'
group by name,Department_Id
--where name = 'sales' as dept_nam

/*6. Which is the department having greater than or equal to 5 employees? 
Display the department names in ascending order. */
select 
name, DEPARTMENT_ID  from
(select *, department_id, count(1) as [no. of employee]
from 
(select * from DEPARTMENT
inner join employee
on 
DEPARTMENT.Department_Id = EMPLOYEE.DEPARTMENT_ID) M
group by name
) de
where de.[no. of employee] >= 5
order by name asc
--select * from employee
--7. How many jobs are there in the organization? Display with designations. 
select 
designation, job_ID , count(1) as [job_nam] from
 
(select designation, job.job_id from JOB
inner join employee
on 
job.Job_ID = EMPLOYEE.JOB_ID) M

group by designation,job_Id
--8. How many employees are working in "New York"?

select employee.department_id, location.Location_ID, location.City, DEPARTMENT.Name
from((DEPARTMENT
inner join EMPLOYEE on DEPARTMENT.DEPARTMENT_ID = EMPLOYEE.Department_Id)
inner join location on DEPARTMENT.Location_Id = LOCATION.Location_ID)
where city = 'New york'
order by city, name

--9. Display the employee details with salary grades. Use conditional statementtocreate a grade column. 
select *,
case when salary>2000 then 'higher'
when salary<2000 then 'lower' 
else 
'average' 
end as grade
from employee

--10. List out the number of employees grade wise. Use conditional statementtocreate a grade column. 
select distinct grade,count(1) as [no. of employee] from
(select salary,
case when salary>2000 then 'higher'
when salary<2000 then 'lower' 
else 
'average' 
end as grade, employee_id from employee) H

group by H.grade
--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 
select distinct grade,count(1) as [no. of employee] from
(select salary,
case when salary>2000 then 'higher'
when salary<2000 then 'lower' 
else 
'average' 
end as grade, employee_id from employee
) H

where salary between 2000 and 5000 
group by grade

--12. Display all employees in sales or operation departments.*/

select *from DEPARTMENT
inner join EMPLOYEE on DEPARTMENT.DEPARTMENT_ID = employee.Department_Id
where department.name = 'sales' or department.name ='Operation'
order by employee.Department_Id


/*SET Operators:
1. List out the distinct jobs in sales and accounting departments.*/

SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES'))
      
UNION
SELECT DESIGNATION
FROM JOB WHERE JOB_ID IN(SELECT JOB_ID FROM EMPLOYEE
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))

     
--2. List out all the jobs in sales and accounting departments. 
SELECT DESIGNATION FROM JOB WHERE JOB_ID
IN
(SELECT JOB_ID FROM EMPLOYEE
WHERE
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES'))	 

UNION ALL
SELECT DESIGNATION FROM JOB WHERE JOB_ID
IN
(SELECT JOB_ID FROM EMPLOYEE
WHERE
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))
	

--3. List out the common jobs in research and accounting departments in ascending order.*/
SELECT DESIGNATION FROM JOB WHERE JOB_ID
IN
(SELECT JOB_ID FROM EMPLOYEE
WHERE
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='RESEARCH'))	 

INTERSECT
SELECT DESIGNATION FROM JOB WHERE JOB_ID
IN
(SELECT JOB_ID FROM EMPLOYEE
WHERE
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='ACCOUNTING'))
ORDER BY Designation
     
/*Subqueries:
1. Display the employees list who got the maximum salary.*/
SELECT * FROM EMPLOYEE
WHERE SALARY IN 
(SELECT MAX(SALARY) FROM EMPLOYEE
WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE))
--2. Display the employees who are working in the sales department. 
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME='SALES')

--3. Display the employees who are working as 'Clerk'.

select * from employee
where
job_id in 
(select job_id from job
where Designation = 'Clerk')

--4. Display the list of employees who are living in "New York". 

select * from employee
where
Department_id in
(select department_id from department
where location_id in
(select Location_ID from location
where City = 'New York'))

--5. Find out the number of employees working in the sales department. 

SELECT count(*) as [no. emp] FROM EMPLOYEE
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM DEPARTMENT
WHERE NAME='SALES')

--6. Update the salaries of employees who are working as clerks on the basis of 10%. 
UPDATE EMPLOYEE 
SET 
SALARY=(SALARY*110)
WHERE JOB_ID IN(SELECT JOB_ID FROM JOB
WHERE Designation ='CLERK')
select * from employee

--7. Delete the employees who are working in the accounting department. 
DELETE FROM EMPLOYEE
WHERE DEPARTMENT_ID 
IN
(SELECT DEPARTMENT_ID FROM DEPARTMENT
WHERE NAME='ACCOUNTING')

--8. Display the second highest salary drawing employee details.
SELECT * FROM EMPLOYEE
WHERE SALARY IN(SELECT MAX(SALARY) FROM EMPLOYEE
WHERE SALARY <(SELECT MAX(SALARY) FROM EMPLOYEE))

--10. List out the employees who earn more than every employee in department 30.
SELECT * FROM EMPLOYEE
WHERE SALARY>ALL(SELECT SALARY FROM EMPLOYEE
WHERE DEPARTMENT_ID=30)
/*11. List out the employees who earn more than the lowest salary in
department.Find out whose department has no employees. */
SELECT * FROM EMPLOYEE
WHERE SALARY>ANY(SELECT MIN(SALARY) FROM EMPLOYEE
)
SELECT DEPARTMENT_ID,NAME FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN(SELECT DEPARTMENT_ID FROM EMPLOYEE)

--12. Find out which department has no employees.
SELECT DEPARTMENT_ID,NAME FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN(SELECT DEPARTMENT_ID FROM EMPLOYEE)
--13. Find out the employees who earn greater than the average salary for their department
SELECT * FROM EMPLOYEE as EMP
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE
WHERE DEPARTMENT_ID  =EMP.DEPARTMENT_ID
GROUP BY DEPARTMENT_ID)
