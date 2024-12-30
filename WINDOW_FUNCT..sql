create database window_functions
use window_functions

create table employee_data( EmployeeID INT Primary Key,Name VARCHAR(50),Department VARCHAR(30),Salary DECIMAL(10, 2), JoinDate DATE)

SELECT*FROM EMPLOYEE_DATA
--. 1. Write a query to assign a unique row number to each employee based on their salary in descending order using ROW_NUMBER().
select row_number() over(order by Salary desc)as "rank_salary"
from EMPLOYEE_DATA

-- 2. Create a query that ranks employees within each department based on their salary using the RANK() function.?????
WITH CTE AS
(select*, rank() over(partition by Department order by Salary DESC)AS "RANK" FROM EMPLOYEE_DATA)
SELECT Department FROM CTE WHERE RANK<=1

-- 3. Use the DENSE_RANK() function to rank employees by their join date across all departments.
SELECT*, dense_rank()over(order by JoinDate)as "dense_rank" from EMPLOYEE_DATA

.-- 4. Write a query to find the cumulative sum of salaries in the 'Employees' table using the SUM() window function.
select*, sum(Salary) over(order by EmployeeID)as "cumlative_salary" from EMPLOYEE_DATA

-- 5. Use the LAG() function to get the previous salary for each employee, ordered by EmployeeID.
select*, LAG(Salary)OVER(ORDER BY EmployeeID)AS "LAG" FROM EMPLOYEE_DATA

-- 6. Write a query to display the next department for each employee using the LEAD() function.
select*, lead(Department)over(order by EmployeeID)as "LEAD" from EMPLOYEE_DATA

-- 7. Create a query that partitions employees by department and assigns a row number within each partition using ROW_NUMBER().
select*, row_number()over(partition by Department order by EmployeeID),
ROW_NUMBER()over(partition by Department order by EmployeeID),
DENSE_RANK()over(partition by Department order by EmployeeID)from EMPLOYEE_DATA

-- 8. Write a query to divide employees into four equal salary buckets using the NTILE(4) function.
select ntile(4)over(order by Salary)as "ntile_salary" from  EMPLOYEE_DATA

-- 9. Calculate the average salary of employees within each department using the PARTITION BY clause.
select*, avg(Salary)over(partition by Department ORDER BY Salary)as "avg_salary" from  EMPLOYEE_DATA

-- 10. Use the FIRST_VALUE() function to retrieve the earliest join date for employees in each department.
select*, first_value(JoinDate)over(order by JoinDate)as "earlist_value" from  EMPLOYEE_DATA

--Q11. Find the running cumulative for SALARY
SELECT*,SUM(SALARY)OVER(ORDER BY EmployeeID)AS "RUNNING_TOTAL" FROM EMPLOYEE_DATA

--12. Find the running cumulative total qty by department.
select*,sum(salary)over(partition by Department order by salary)as "total_qty" from EMPLOYEE_DATA

--13 When are the top 2 saalary for each dept.
with cte as (select Department,Salary,rank()over(partition by  Department order by Salary desc)as "top1" from EMPLOYEE_DATA)
select Department,Salary from cte where top1=1

with cte as (select Department,Salary,rank()over(order by Salary desc)as "top1" from EMPLOYEE_DATA)
select Department,Salary from cte where top1<=1

----13 When are the worst saalary for each dept.
with cte as (select Department,Salary,row_number()over(order by Salary asc)as "worst" from EMPLOYEE_DATA)
select Department,Salary from cte where worst in (1,2)

-- Find the  salary compared to the previous day.
select JoinDate,Salary,lag(Salary)over(order by Salary)as "percentage" from  EMPLOYEE_DATA

-- Show the minimum and maximum ‘salary’  each dept. as separate columns.??
select distinct(Department),max(Salary)over(partition by Department)a,min(Salary)over(partition by Department)b
from EMPLOYEE_DATA

with cte as(select distinct(Department),Salary, row_number()over(partition by Department order by Salary asc)a,
row_number()over(partition by Department order by Salary desc)b
from EMPLOYEE_DATA)
select  distinct(Department),min(case when a=1 then Salary end)m,
max(case when b=1 then Salary end)n from cte group by Department

USE questions
select*from EMPLOYEE_DATA
--Ranking Employees by Salary within Each Department
select EmployeeID,Department,rank()over(partition by Department order by Salary desc)"ranking" from EMPLOYEE_DATA

--Calculate Cumulative Salary Sum within Each Department
select Department, sum(Salary)over(partition by Department order by JoinDate)"cum_salary" from EMPLOYEE_DATA

--Average Salary in Each Department
select distinct(Department), avg(Salary)over(partition by Department)"cum_salary" from EMPLOYEE_DATA

--Rank Employees by date
select  rank()over(order by Salary desc)"rank_as_date" from  EMPLOYEE_DATA

--Number of Employees in Each Department
select distinct(Department),count(*)over(partition by Department)"total_emp" from  EMPLOYEE_DATA
select*from hr

--Employee's income tax Compared to Department's Avg SALARY
use questions
select Employee_ID,Department,Income_Tax_INR-avg(Salary_before_Tax_INR)
over(partition by Department)as "diff" from
hr
USE WINDOW_FUNCTIONS

--First Employee to Join in Each Department
with cte as (SELECT EmployeeID ,Department,JoinDate,Row_number()OVER(partition by Department ORDER BY JoinDate)
"first_emp" from EMPLOYEE_DATA group by EmployeeID,Department,JoinDate)
select  EmployeeID ,Department,JoinDate from cte where first_emp=1

select*from EMPLOYEE_DATA

--Employee with the Highest Salary in Each Department
with cte as (select Department,EmployeeID,Salary,row_number()OVER(partition by Department ORDER BY Salary DESC)
"MAX_SALARY" FROM EMPLOYEE_DATA)
SELECT Department,EmployeeID,Salary FROM cte where MAX_SALARY=1

--Percentile Rank of Employees' Salaries
select PERCENT_RANK()OVER(ORDER BY Salary desc)as "percent" from EMPLOYEE_DATA

--Employees' Performance on basis of tax and Comparison to the Department's Average salary before tax
select EmployeeID,Department,Salary,Salary-avg(Salary)over(partition by Salary)as "avg_salary" from
EMPLOYEE_DATA

--Advanced Questions:


--Moving Average of Employees' Salaries over the Last 3 Employees
select name,JoinDate,avg(Salary)over( order by JoinDate rows between 2 preceding and current row)as "avgs" 
from EMPLOYEE_DATA


--Employees' Rank and Top 10% Salary Range
with cte as (select  employeeid, name,Salary,percent_rank()over( order by Salary desc)as "avg_per" 
from EMPLOYEE_DATA)
select employeeid, name,Salary from cte where avg_per<=0.1

use window_functions





