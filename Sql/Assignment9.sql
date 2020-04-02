/*Table Used: 
-   newstudent (studentid, surname, firstname, middlename, gender, admitdate)
NOTE :	[I] Please specify the CREATE query for above table as well.*/

CREATE TABLE NewStudent(
	StudentId int Primary Key Identity(1,1),
	SurName varchar(30) NOT NULL,
	FirstName varchar(30) NOT NULL,
	MiddleName varchar(30) NOT NULL,
	Gender varchar(6) NOT NULL,
	AdmitDate date NOT NULL
)


--In all below queries, fetch and display "Name" field in this format :  "Surname Firstname Middlename".
select SurName+' '+FirstName+' '+MiddleName as Name from NewStudent

--Q-1	List out the information of students whose surname is "Shah".
select * from NewStudent where SurName='Shah'

--Q-2	List out the information of all the Male students.
select * from NewStudent where Gender='Male'

--Q-3	List out the information of all the Female students, whose surname is "Patel" or have been admitted after than 1-Jan-2006.
 select * from NewStudent where AdmitDate > '01-01-2006' and Gender='female'

--Q-4	List out the information of all the students whose second name ends with "Bhai".	
select * from NewStudent where MiddleName like '%Bhai'

--Q-5	List out the information of all the students whose first name starts with "M" and 	second name has "ant".
select * from  NewStudent where FirstName like 'M%' and MiddleName like '%ant%'

--Q-6	List out the information of all the students whose surname has "c" in the third place.
select * from NewStudent where SurName like '__c%'

--Q-7	List the name's of the all the students in "Ekta R. Patel" format.
select FirstName+' '+MiddleName+' '+SurName as Name from NewStudent where MiddleName like '_.'

--Q-8	List out First Name as well as its respective length for all the students.
select FirstName ,len(FirstName) as Length from NewStudent;

--Q-9	Append the First Name with "bhai" for all the male students whose First Name does not contain "bhai".
select
		case 
		when  FirstName like '%bhai' then FirstName
		when FirstName not like '%bhai' then CONCAT(FirstName,'bhai')
		end
		from NewStudent where Gender = 'Male' 

--Q-10	List out First Name of all the male students with "Mr." before the First Name.
select 'Mr.'+FirstName from NewStudent where Gender='Male'

--Q-11	List out First Name of all the students which sounds like "Mira".
select * from NewStudent where FirstName='_ira'