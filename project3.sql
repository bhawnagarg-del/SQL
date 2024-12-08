create database project3
use project3
select*from [dbo].[Book4]
select*from [dbo].[Programmer]
select*from  [dbo].[studies]


the Table  STUDIES, SOFTWARE & PROGRAMMER.
Tasks to be performed:
--1. Find out the selling cost AVG for packages developed in Pascal.
select developin, avg(scost)average from [dbo].[Book4] where developin='pascal' group by developin

--2. Display Names, Ages of all Programmers.
select  pname,DATEDIFF(year,dob,getdate())age from  [dbo].[Programmer]

--3. Display the Names of those who have done the DAP Course.
SELECT PNAME,COURSE FROM [dbo].[studies] WHERE COURSE='DAP' 

--4. Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME,DATENAME(MONTH,DOB)MONTHS FROM [dbo].[Programmer] WHERE DATENAME(MONTH,DOB)='JANUARY'

--5. What is the Highest Number of copies sold by a Package?
select*from [dbo].[Book4]
SELECT MAX(SOLD)MAXIMUM FROM [DBO].[BOOK4]


--6. How many programmers done the PGDCA Course
SELECT COALESCE(PNAME,'TOTAL')PNAME, COUNT(COURSE)PROGRAMMERS FROM [dbo].[studies] WHERE COURSE='PGDCA' GROUP BY ROLLUP(PNAME)
/*COALESCE IS used for the total */

--7. How much revenue has been earned thru sales of Packages Developed in C.???????????????????????
SELECT DEVELOPIN,SUM(SOLD)REVENUE FROM [dbo].[Book4] WHERE DEVELOPIN ='C' GROUP BY DEVELOPIN

--9. Display the Details of the Software Developed by Ramesh.
select*from [dbo].[Book4]
SELECT PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD FROM [dbo].[Book4] WHERE PNAME ='RAMESH' GROUP BY 
PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD

--10. How many Programmers Studied at Sabhari?
select COALESCE(PNAME,'TOTAL')PNAME,COUNT(*)TOTAL from [dbo].[studies]
WHERE INSTITUTE='SABHARI' GROUP BY ROLLUP (PNAME)


--11. What is the cost of the costliest software development in Basic?
SELECT DEVELOPIN, MAX(DCOST)COST FROM  [dbo].[Book4] WHERE DEVELOPIN ='BASIC'GROUP BY DEVELOPIN
SELECT * FROM  [dbo].[Book4]

--12. How many Packages Developed in DBASE?
SELECT DEVELOPIN, COUNT( DEVELOPIN)COUNTS FROM  [dbo].[Book4] WHERE  DEVELOPIN ='DBASE' GROUP BY  DEVELOPIN


--13. How many programmers studied in Pragathi?
SELECT* FROM STUDIES
SELECT COALESCE(PNAME,'TOTAL')PNAME, COUNT(PNAME)COUNTS FROM  STUDIES WHERE INSTITUTE='PRAGATHI' GROUP BY  ROLLUP(PNAME)


--14. How many Programmers Paid 5000 to 10000 for their course?
SELECT* FROM STUDIES
SELECT COUNT( PNAME) FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000

--15. What is AVG Course Fee
SELECT AVG(COURSE_FEE)AVERAGE_FEE FROM  STUDIES

--16. How many Programmers know either COBOL or PASCAL.
SELECT COUNT(PNAME)COUNTS FROM  [dbo].[Book4] WHERE DEVELOPIN IN ('COBOL','PASCAL')


--17. How many Programmers Don’t know PASCAL and C
SELECT COUNT(PNAME) FROM  [dbo].[Book4] WHERE  DEVELOPIN!= 'PASCAL' AND DEVELOPIN!='C'

--18. How old is the Oldest Male Programmer.
SELECT*FROM PROGRAMMER
SELECT TOP (1) MAX( DATEDIFF(YEAR,DOB,GETDATE()))AGE FROM [DBO].[PROGRAMMER] WHERE GENDER='M'

--19. What is the AVG age of Female Programmers?
SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE()))AGE FROM [DBO].[PROGRAMMER]  WHERE GENDER='F'

--20. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select* from programmer
select* from book4
select* from studies
select PNAME,DATEDIFF(year,DOJ,getdate())EXP from [dbo].[Programmer] order by EXP DESC;

--21. Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT PNAME,MONTH(DOB)BDAY FROM [dbo].[Programmer] WHERE MONTH(DOB)=MONTH(GETDATE())

--22. How many Female Programmers are there?
SELECT COUNT(PNAME)FEMALE FROM [dbo].[Programmer] WHERE GENDER='F'

--23. What are the Languages studied by Male Programmers.
SELECT PNAME,PROF1,PROF2 FROM [dbo].[Programmer] WHERE GENDER='M'
USE PROJECT3
--24. What is the AVG Salary?
SELECT AVG(SALARY)AVERAGE_SALARY FROM  [dbo].[Programmer]

--25. How many people draw salary 2000 to 4000?
SELECT COUNT(PNAME)NAME FROM [dbo].[Programmer] WHERE SALARY BETWEEN 2000 AND 4000 

--26. Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT *FROM [dbo].[Programmer]  WHERE PROF1!='CLIPPER' AND PROF1!='COBOL'AND  PROF1!='PASCAL'
AND PROF2!='CLIPPER' AND  PROF2!='COBOL' AND  PROF2!='PASCAL'

--27. Display the Cost of Package Developed By each Programmer.
SELECT*FROM  [dbo].[Programmer] 
SELECT PNAME, SUM(DCOST)TOTAL_COST FROM  [dbo].[BOOK4] GROUP BY PNAME

--28. Display the Number of Packages sold by Each Programmer.
SELECT PNAME, SUM(SOLD) TOTAL_SALES FROM [dbo].[BOOK4] GROUP BY PNAME

--29. Display the sales cost of the packages Developed by each Programmer Language wise.
SELECT DEVELOPIN, SUM(SCOST)SALES_COST FROM [dbo].[BOOK4] GROUP BY DEVELOPIN

--30. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN,AVG(DCOST)AVERGE_DEVT,AVG(SCOST)SELLING_COST,AVG(SOLD) FROM [dbo].[BOOK4] GROUP BY  DEVELOPIN

--31. Display each institute name with number of Courses, Average Cost per Course.
SELECT institute,count(course)counts ,avg(course_fee)average from studies group by institute

--32. Display each institute Name with Number of Students.
select institute,count(pname) from studies group by institute

--33. Display Names of Male and Female Programmers. Gender also.
select pname,gender from [dbo].[Programmer] group by pname,gender
select*from  [dbo].[Book4]

--34. Display the Name of Programmers and Their Packages.
select pname,developin from  [dbo].[Book4]

--35. Display the Number of Packages in Each Language Except C and C++.
select developin, sum(sold)total from  [dbo].[Book4] where  developin!='c' and  developin!='c++'  group by  developin

SELECT DEVELOPIN AS LANGUAGE,SUM(SOLD)TOTAL_PACKAGE FROM  [dbo].[Book4]
WHERE DEVELOPIN NOT IN ('C' , 'C++')
GROUP BY DEVELOPIN;

--36. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select*from Book4
select developin,count(title)counts from  Book4 where dcost<1000 group by developin

--37. Display AVG Difference between SCOST, DCOST for Each Package.
select avg(scost-dcost)diff from  Book4


--38. Display Highest, Lowest and Average Salaries for those earning more than 2000.
select max(salary)high_salary,min(salary)low_salary,avg(salary)average_salary from [dbo].[Programmer] where salary>2000

--39. Who is the Highest Paid C Programmers?
select top(1) pname, max(salary)highest from [dbo].[Programmer] where prof1='c' or prof2='c' group by pname order by max(salary) desc;

select*from  [dbo].[Programmer]

--40. Who is the Highest Paid Female COBOL Programmer?
select top(1) pname,max(salary)salry from  [dbo].[Programmer] where prof1='cobol' or prof2='cobol' and gender='f' group by pname
select*from  [dbo].[book4]


--41. Who is the least experienced Programmer.
select min(datediff(year,doj,getdate()))min_exp from  [dbo].[Programmer] 

--42. Who is the most experienced male programmer knowing PASCAL.
select  max(datediff(year,doj,getdate()))max_exp from [dbo].[Programmer]  where gender='M' and prof1='pascal' OR prof2='pascal'



--43. Who is the Youngest Programmer knowing DBASE?
SELECT MIN(DATEDIFF(YEAR,DOJ,GETDATE()))YOUNGEST_AGE FROM [dbo].[Programmer] WHERE  PROF1='DBASE' OR PROF2='DBASE'


--44. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE???????????????????
SELECT PNAME,SALARY FROM [dbo].[Programmer] WHERE GENDER='F' AND SALARY>3000 AND (PROF1 NOT IN ('C','C++','ORACLE','DBASE') OR PROF2 NOT IN 
('C','C++','ORACLE','DBASE'))

---45. Which Institute has most number of Students?
SELECT TOP(1) INSTITUTE, COUNT( INSTITUTE)TOTAL FROM [dbo].[studies] GROUP BY INSTITUTE  ORDER BY  TOTAL DESC 
SELECT* FROM  [dbo].[studies]

--46. What is the Costliest course?
SELECT TOP(1) COURSE,MAX(COURSE_FEE)COSTLY FROM  [dbo].[studies] GROUP BY COURSE ORDER BY COSTLY DESC

--47. Which course has been done by the most of the Students?
SELECT TOP(1) COURSE,COUNT(PNAME)STUDENTS FROM  [dbo].[studies] GROUP BY COURSE ORDER BY STUDENTS DESC

--48. Which Institute conducts costliest course.
SELECT TOP(1) INSTITUTE,COURSE,MAX(COURSE_FEE)MAX_COURSE FROM [dbo].[studies] GROUP BY INSTITUTE,COURSE ORDER BY MAX_COURSE DESC

--49. Display the name of the Institute and Course, which has below AVG course fee.
SELECT INSTITUTE,COURSE,COURSE_FEE FROM [dbo].[studies] WHERE COURSE_FEE <(SELECT AVG(COURSE_FEE) FROM   [dbo].[studies])

--50. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee.
SELECT COURSE,COURSE_FEE FROM  [dbo].[studies] WHERE COURSE_FEE BETWEEN ((SELECT AVG(COURSE_FEE) FROM [dbo].[studies])-1000) AND
((SELECT  AVG(COURSE_FEE) FROM [dbo].[studies])+1000)

--51. Which package has the Highest Development cost?
SELECT TOP(1) DEVELOPIN AS PACKAGES, MAX(DCOST) FROM [dbo].[Book4] GROUP BY  DEVELOPIN ORDER BY MAX(DCOST) DESC


--52. Which Package has the lowest selling cost?
SELECT TOP(1) DEVELOPIN , MIN(SCOST)SELLING_COST  FROM [dbo].[Book4] GROUP BY  DEVELOPIN ORDER BY SELLING_COST ASC
 SELECT* FROM [dbo].[Book4]

--53. Who Developed the Package that has sold the least number of copies?
SELECT TOP(1) PNAME , MIN (SOLD)LEAST_COPIES FROM  [dbo].[Book4]  GROUP BY  PNAME ORDER BY LEAST_COPIES ASC


--54. How many copies of package that has the least difference between development and selling cost where sold.
SELECT  TOP(1) TITLE, MIN(SCOST-DCOST)COUNTS FROM [dbo].[Book4] GROUP BY TITLE ORDER BY  MIN(SCOST-DCOST);

--55. Which is the costliest package developed in PASCAL.
select top(1) title ,max(scost)maximum from [dbo].[Book4] where developin='pascal' group by  title order by maximum desc

--56. Which language was used to develop the most number of Packages.
select top(1) title, count(developin) from  [dbo].[Book4] group by title order by count(developin) desc

--57. Which programmer has developed the highest number of Packages?
select top(1) pname, count(*)counts from [dbo].[Book4] group by  pname order by counts desc

---58. Who is the Author of the Costliest Package?
select* from Book4
select top(1) pname, max(scost)maxi from [dbo].[Book4] group by pname order by max(scost) desc

--59. Display the names of the packages, which have sold less than the AVG number of copies.

select title, sum(sold)total from [dbo].[Book4] where sold<(select avg(sold) from  [dbo].[Book4]) group by title


--60. Who are the male programmers earning below the AVG salary of Female Programmers?
select*from [dbo].[Programmer]
select pname,salary from [dbo].[Programmer] where gender='m' and  salary<(select avg(salary)total from  [dbo].[Programmer] where gender='f')

--61. Who are the Female Programmers earning more than the Highest Paid?
select pname,salary from [dbo].[Programmer] where gender='f' and salary>(select max(salary) from [dbo].[Programmer]) 


--62. Which language has been stated as the proficiency by most of the Programmers?
select top(1) pname, developin,count(pname) from [dbo].[Book4]  group by pname,developin  order by count(pname)  desc
select* from Book4

--63. Display the details of those who are drawing the same salary.
select pname, salary from  [dbo].[Programmer] where salary in (select salary from [dbo].[Programmer] group by salary having count(pname)>1)

--64. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
select pname,prof1,prof2,salary from  [dbo].[Programmer] where gender='m' and salary>3000

--65. Display the details of the packages developed in Pascal by the Female Programmers.
select pname,salary,dob,doj from [dbo].[Programmer] where gender='f' and prof1='pascal' or prof2='pascal'


--66. Who are the programmers who have the same Prof2?
select pname,prof2 from  Programmer  where prof2 in (select prof2 from Programmer group by prof2 having count(pname)>1)



