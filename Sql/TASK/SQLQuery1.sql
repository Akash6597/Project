--1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, SysDateTime()) - 3, 0)

--2. Write a query to display the last day of the month (in datetime format) three months before the current month.
--SELECT DATEADD (dd, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, SysDateTime()) - 3, 0))

SELECT DATEADD (DAY, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, SysDateTime()) - 2, 0))

Use TestDb;
Go

-----3. Write a query to get the distinct Mondays from hire_date in employees tables.--------

--SELECT DISTINCT(STR_TO_DATE(CONCAT(YEARWEEK(hire_date),'1'),'%x%v%w')) FROM employees;

--4. Write a query to get the first day of the current year. 
 SELECT  DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0) AS StartOfYear

--5. Write a query to get the last day of the current year. 
  SELECT DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) + 1, -1) AS EndOfYear

--6. Write a query to calculate the age in year. 
SELECT year(getdate())-year('2017/08/25') as age

--7. Write a query to get the current date in the following format. 
-- Sample date : 2014-09-04
-- Output : September 4, 2014
select convert(varchar, getdate())	
--Select CAST(GETDATE() AS nvarchar(30))

--8. Write a query to get the current date in the following format. 
--Thursday September 2014

SELECT CONCAT((SELECT DATENAME(WEEKDAY,GetDate())),'  ',(SELECT DATENAME(MONTH,GetDate())),'  ',(SELECT DATENAME(YEAR,GetDate())));

--9. Write a query to extract the year from the current date. 
SELECT DATENAME(YEAR,GETDATE()) as YEAR

-------10. Write a query to get the DATE value from a given day (number in N).------------ 
--Sample days : 730677
--Output : 2000-07-11

select CONVERT(datetime, convert(nvarchar, 125487));

--11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
SELECT FIRSTNAME,HIRE_DATE FROM employees where HIRE_DATE between '1987-06-01' AND '1987-07-30';

--12. Write a query to display the current date in the following format. 
--Sample output : Thursday 4th September 2014

SELECT FORMAT(getdate(),'dddd d MMMM yyyy')

--13.Write a query to display the current date in the following format. 
--Sample output : 05/09/2014

SELECT FORMAT(getdate(),'d/MM/yyyy')

--14.Write a query to display the current date in the following format. 
--Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT(SYSDATETIME(),'hh:mm tt MMMM dd, yyyy')

--15. Write a query to get the firstname, lastname who joined in the month of June. 

SELECT FIRSTNAME,LASTNAME,HIRE_DATE from employees where DATEPART(MONTH,HIRE_DATE) =6

--16. Write a query to get the years in which more than 10 employees joined. 

SELECT DATEPART(YEAR,HIRE_DATE) as year from employees GROUP BY DATEPART(YEAR,HIRE_DATE) HAVING COUNT(EMPLOYEEID) > 10

--17. Write a query to get the department ID, year, and number of employees joined. 

SELECT DEPARTMENT_ID,COUNT(EMPLOYEEID) as DepartmentEmployee,DATEPART(YEAR,HIRE_DATE) as year from employees GROUP BY DEPARTMENT_ID,DATEPART(YEAR,HIRE_DATE)

--18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. 

SELECT DEPARTMENT_NAME,FIRSTNAME,SALARY FROM employees right join departments on employees.MANAGER_ID=departments.MANAGER_ID where year(getdate())-year(HIRE_DATE) > 5 


-----19. Write a query to get employee ID, last name, and date of first salary of the employees. ------


--20. Write a query to get first name, hire date and experience of the employees. 

	SELECT FIRSTNAME,HIRE_DATE,year(getdate())-year(HIRE_DATE) as Experience from employees

--21. Write a query to get first name of employees who joined in 1987. 
SELECT FIRSTNAME from employees where year(HIRE_DATE)=1987
