select * from employeesdetails

select * from locationsemployee 

select * from jobemployee 

--1. Write a query to get the job_id and related employee's id. 
--Partial output of the query :
SELECT job_id,STRING_AGG(employee_id,',') FROM employeesdetails GROUP BY job_id;

--2. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
UPDATE employeesdetails SET phone_number = REPLACE(phone_number, '124', '999') WHERE phone_number LIKE '%124%';

--3. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.

SELECT * FROM employeesdetails WHERE LEN(first_name) >= 8;

--------4. Write a query to display leading zeros before maximum and minimum salary. ---------

--5. Write a query to append '@example.com' to email field.
--Sample Output :  --EMAIL --SKING@example.com --NKOCHHAR@example.com

  SELECT EMAIL+'@example.com' FROM employeesdetails

--6. Write a query to get the employee id, first name and hire month. 

SELECT Employee_ID,FIRST_NAME,DATEPART(MONTH,HIRE_DATE) as HireMonth from employeesdetails

--7. Write a query to get the employee id, email id (discard the last three characters). 

SELECT Employee_ID,LEFT(EMAIL,LEN(EMAIL)-3),EMAIL from employeesdetails

-------------8. Write a query to find all employees where first names are in upper case.--------------- 



--9. Write a query to extract the last 4 character of phone numbers. 

SELECT RIGHT(Phone_Number,4) as Last4 from employeesdetails

------------------10. Write a query to get the last word of the street address. ------------------------

--11. Write a query to get the locations that have minimum street length. 

select * from locationsemployee where len(street_address)  <= (select MIN(LEN(STREET_ADDRESS)) from locationsemployee)


-----------12. Write a query to display the first word in job title. -----------------


--13. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 

select *,len(first_name) as lengthFname from employeesdetails where last_name like '_c%'

--14. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. 

SELECT first_name as Name,LEN(first_name) as length FROM employeesdetails WHERE first_name LIKE 'J%' OR first_name LIKE 'M%' OR first_name LIKE 'A%' ORDER BY first_name ;

--15. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. 

Select right(replicate('$',10)+convert(varchar(10),Salary),10) from employeesdetails

--16. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.
------------------------------Not Completed------------------------------------
select SUBSTRING(first_name,1,8) as FirstFiveChar from employeesdetails ORDER BY salary DESC;

--17. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year. 

SELECT employee_id,first_name,last_name,hire_date FROM employeesdetails where (select DATEPART(DAY,HIRE_DATE)) =7 or (select DATEPART(MONTH,HIRE_DATE)) =7