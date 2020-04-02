--Q-1	Display Full Name of all the male students whose first name ends with "h" and are admitted between 1st January 2006 to 1st August 2006.

select concat(UPPER(LEFT(fname,1)),' ',UPPER(LEFT(sname,1)),' ',UPPER(LEFT(surname,1))) as NAME 
from Student where Gender='male' and fname like '%h' and AdmitDate between '2006-01-01' and '2006-08-01';

/*
Q-1	Find Name of all those sales representatives whose offices are in cities ending with 
	"pur" and who have atleast 2 customers. The sales representative must be hired before 
	1st January 2006 and his/her minimum age should be 21 yrs.

	Display fields : Sales Rep. Name, Office City, No. of Customers, Hired on
*/
SELECT Salesreps.Name,Offices.City,COUNT(Customers.CustomerId),Salesreps.HireDate from Salesreps
INNER JOIN Offices on Salesreps.OfficeId=Offices.OfficeId inner join
Customers on Customers.SalesrepsId=Salesreps.SalesrepsId
where Offices.City Like '%pur' and Salesreps.HireDate<'2006-01-01' and Salesreps.Age>21

/*Q-2	Find following information for each customer:
	Display fields : Company Name, Sales Rep. Name, Sales Rep. Office City, Company Credit*/

SELECT Customers.Company,Salesreps.Name, Offices.City, Customers.CreditLimit
FROM   Salesreps INNER JOIN Customers ON Customers.salesrepsid = Salesreps.salesrepsid INNER JOIN
   Offices ON Salesreps.officeid = Offices.OfficeId 

/*Q-3	Find following information for each office:
	Office city, Total Sales Rep., Total sale by all sales Rep.,
	Target Sales, Actual Sales, Difference of Target and Actual Sales.
	Display fields : Office City, No. of Sales Rep., Total Sale, Target Sales, Actual  Sales, Difference.*/
Select Offices.City,COUNT(Salesreps.SalesrepsId) as SalesRepsentive,SUM(Salesreps.Sales) as SumSale,
Offices.TargetSales,Offices.ActualSales,(Offices.TargetSales-Offices.ActualSales) as Diffrence from Offices  left join salesreps 
on Offices.OfficeId = Salesreps.OfficeId
group by(Salesreps.OfficeId)

/*Q-4	Find following information for each product:
	Product description, Price, Quantity on hand, Total no. of 
	orders for each product, Total quantity ordered, Total amount of the orders for each product.
	Display fields : Description, Price, Quantity, Orders, Quantity, Total Amount*/
select Products.Descrption,Products.Price,Products.QtyOnHand,SUM(Orders.amount),SUM(Orders.Qty),sum(Orders.amount) from
Products  left join Orders
on Products.ProductId = Orders.ProductId
group by(Orders.ProductId)
	
/*Q-5	Find order details for all the customers. There will be one row per customer displaying 	
	total quantity ordered by them and the amount spent by each customer.
	Display fields : Company Name, Total Quantity Ordered, Total Amount*/

	
select Customers.Company , SUM(Orders.Qty) ,SUM(Orders.amount) from Customers
inner join Orders on Customers.CustomerId=Orders.CustomerId
group by(Orders.CustomerId)

/*Q-6	Display all the sales representatives hired within the past five years from today along with thier Quota and 
	Sales information.
	Display fields : Sales Rep. Name, Hired on, Quota, Sales*/
select Salesreps.Name,Salesreps.HireDate,Salesreps.Quota,Salesreps.Sales from Salesreps where HireDate between '2015-01-01' and '2020-01-01'	

/*Q-7	Find total number of customers for all the products ordered. There will be one row per 	
	order displaying product description, and total number of customers who have ordered 	that product.
	Display fields : Product Description, Total No. of Customers who Ordered this Product.*/

select Products.Descrption ,COUNT(Orders.CustomerId) as TotalCustomers from Products  left join Orders on Products.ProductId=Orders.ProductId inner join Customers 
on Orders.CustomerId=Customers.CustomerId group by(Orders.ProductId)
