
CREATE DATABASE IF NOT EXISTS sql_project;
USE sql_project;

CREATE TABLE Customers (
  CustomerID       INT PRIMARY KEY,
  CustomerName     VARCHAR(100),
  Gender           VARCHAR(10),
  City             VARCHAR(50),
  State            VARCHAR(50),
  Email            VARCHAR(100),
  Phone            BIGINT,          
  RegistrationDate DATE
);

CREATE TABLE Orders (
  OrderID      INT PRIMARY KEY,
  CustomerID   INT,
  ProductName  VARCHAR(100),
  Category     VARCHAR(50),
  Quantity     INT,
  Price        DECIMAL(10,2),
  OrderDate    DATE,
  PaymentMode  VARCHAR(30),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

select * from orders;
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Orders;
SELECT MIN(OrderDate), MAX(OrderDate) FROM Orders; 

SELECT * FROM Orders WHERE OrderID = 1004;  
CREATE TABLE Customers_backup AS SELECT * FROM Customers;
CREATE TABLE Orders_backup AS SELECT * FROM Orders;

-- SQL Project Questions
-- 1. Display all records from the Customers table.
select * from customers;
-- 2. Display only CustomerName, City, and State from the Customers table.
select  CustomerName, City, State from customers;
-- 3. Display ProductName, Category, Price, and PaymentMode from the Orders table.
select ProductName, Category, Price,  PaymentMode from orders;
-- 4. Display customers who belong to Ahmedabad.
select * from customers where city ="Ahmedabad";
-- 5. Display orders where Price > 20000.
select * from orders where Price > 20000;
-- 6. Display customers whose Gender = 'Female'.
select * from customers where Gender = 'Female';
-- 7. Find customers whose names start with 'A'.
select * from customers where CustomerName like "A%";
-- 8. Find customers whose email contains 'gmail'.
select * from customers where Email like "%gmail%";
-- 9. Display orders where the Price is between 10000 and 30000.
select * from orders where Price  between 10000 and 30000;
-- 10. Display customers registered between '2023-06-01' and '2024-01-01'.
select CustomerName, RegistrationDate from customers where RegistrationDate between '2023-06-01' and '2024-01-01';
-- 11. Display customers from Ahmedabad, Surat, and Mumbai.
select * from customers where City in ("Ahmedabad" , "Surat" ,"Mumbai");
-- 12. Display orders whose payment mode is UPI, Card, or EMI.
select * from orders where PaymentMode in ("UPI", "Card", "EMI");
-- 13. Display products belonging to Electronics and Home categories.
select * from orders where Category in ("Electronics", "Home");
-- 14. Display Electronics products costing more than ₹20,000.
select category , price from orders where Category="Electronics" and price > 20000;
-- 15. Find female customers from Ahmedabad.
select * from customers where gender= "Female" and city="Ahmedabad";
-- 16. Find orders where Quantity > 2 AND Price > 10000.
select * from orders where Quantity > 2 AND Price > 10000;
-- 17. Display customers from Delhi OR Mumbai.
select * from customers where City in ('Delhi','Mumbai');
-- 18. Display orders paid using Cash OR Card.
select * from orders where PaymentMode in ('Cash','Card');
-- 19. Display products that belong to Fashion OR Accessories.
select * from orders where Category in ('Fashion','Accessories');
-- 20. Display customers not from Ahmedabad.
Select * from customers where city <> "Ahmedabad";
-- 21. Display products not in the Electronics category.
select * from orders where category <>"ELectronics";
-- 22. Display orders not paid using Cash.
select * from orders where PaymentMode <> "Cash";

-- 23. Display all customers ordered by CustomerName.
SELECT * from customers ORDER BY CustomerName ASC;
-- 24. Display products ordered by Price (Highest to Lowest).
select * from orders order by price DESC;
-- 25. Display orders ordered by OrderDate (Latest First).
Select * from orders order by  OrderDate Desc;
-- 26. Display unique cities.
select Distinct city from customers;
-- 27. Display unique states.
select Distinct state from customers;
-- 28. Display unique product categories.
Select Distinct Category from orders;
-- 29. Count the total number of customers.
Select Distinct count(CustomerName) from customers;
-- 30. Count the total number of orders.
select count(*) from orders;
-- 31. Count the number of customers in each city.
select city , count(CustomerName) as Number_Of_Customer from customers group by city;
-- 32. Calculate total sales (Price × Quantity).
select sum(Price* Quantity) as Total_sales from orders;

-- 33. Calculate total quantity sold.
Select  SUM(Quantity) AS Total_Quantity_Sold FROM orders;
-- 34. Calculate total sales for Electronics products.
select sum(Price* Quantity) as Total_sales from orders where category="Electronics";
-- 35. Find the average product price.
select avg(Price) as Average_Price from orders;
-- 36. Find the average quantity ordered
select avg(quantity) as Average_Quantity  from orders;
-- 37. Find the average sales amount per order.

Select AVG(Price * Quantity) AS Average_Sales_Per_Order from orders;
-- 38. Find the minimum product price.
select min(Price) as Minimum_Price from orders;
-- 39. Find the earliest registration date.
Select  MIN(RegistrationDate) AS Earliest_Registration_Date FROM customers;
-- 40. Find the minimum order quantity.
select min(Quantity) as Minimum_order from orders;
-- 41. Find the highest product price.
select max(Price) as Highest_Price from orders;
-- 42. Find the latest order date.
select max(OrderDate) as Latest_ordrDate from orders;
-- 43. Find the maximum quantity ordered.
select Max(Quantity) as Maximum_Quantity_ordered from orders;
-- 44. Display total sales by category.
select category,sum(quantity*price) as TotalSales from orders group  by category;
-- 45. Display customer count by city.
select city, count(*) as CustomerCount from customers group by city;

-- 46. Display total revenue by payment mode.
SELECT PaymentMode,SUM(Price * Quantity) AS Total_Revenue FROM orders
GROUP BY PaymentMode;
-- 47. Display categories having sales greater than ₹50,000.
select category, sum(quantity* price) as Total_sales from orders group by category having Total_sales>50000;
-- 48. Display cities having more than three customers.
select city, count(*) as Customer_count from customers group by city having Customer_count>3;
-- 49. Display payment modes with total sales above ₹30,000.
select PaymentMode,sum(quantity* Price) as total_sales from orders 
group by PaymentMode having  total_sales >30000;
-- 50. Display customer names along with the products they purchased.
select c.CustomerName, o.ProductName 
from customers c 
Inner join 
Orders o
on
c.customerID=o.customerID;
-- 51. Display customer city and payment mode.
select c.CustomerName, c.city,o.paymentmode
from customers c
Inner join
Orders o
on
c.customerID=o.customerID;

-- 52. Display customer registration date and order date.
select c.CustomerName,c.RegistrationDate,O.orderDate
from Customers c
Inner join
Orders o
On 
c.customerID=o.customerID;
-- 53. Display all customers with their orders.
select c.* ,o.*  from customers c 
Left join
Orders o
on 
c.customerID=o.customerID;
-- 54. Find customers who have not placed any orders.
select c.* from customers c
left join
orders o
on 
c.customerID=o.customerID
where o.customerID is NULL;
-- 55. Display customer names even if they have no purchases.
select c.CustomerName , o.ProductName from customers c
left join
orders o
on 
c.customerID=o.customerID;
-- 56. Display products priced above the average price.
select ProductName, price from orders where price >(select avg(price) from orders) ;
-- 57. Find customers whose total purchases exceed the average customer purchase.
select c.CustomerID,c.CustomerName, sum( o.Quantity * o.Price) as total_purchase
from customers c
join orders o 
on 
c.CustomerID=o.CustomerID
group by c.customerId,c.customerName
having sum( o.Quantity * o.Price)>(select avg(total_purchase) from (select sum(price* quantity) as total_purchase
from orders group by CustomerID)x);

-- 58. Find the second highest priced product.
select ProductName,Max(price)as Second_highestPrice from orders group by ProductName 
having Second_highestPrice<(select Max(Price) from orders)
ORDER BY Second_highestPrice DESC
LIMIT 1;
-- 59. Display customers whose total sales exceed ₹50,000 using a CTE.
WITH CustomerSales AS (
    SELECT CustomerID,SUM(Price * Quantity) AS TotalSales FROM orders
    GROUP BY CustomerID)
SELECT CustomerID, TotalSales
FROM CustomerSales
WHERE TotalSales > 50000;
-- 60. Assign row numbers to orders based on descending price.
select * ,price,row_number()over( order by price desc) as Ranked from orders;

-- 61. Number customers alphabetically.
SELECT CustomerName, ROW_NUMBER() OVER (ORDER BY CustomerName ASC) AS RowNum
FROM customers;
-- 62. Number products within each category.
select ProductName,Row_number() over(partition by category order by ProductName ) as RowNumber from orders;
-- 63. Rank products by price.
select ProductName, Price, rank() over (order by Price desc) as Price_Rank from orders;
-- 64. Rank customers by total sales.
select CustomerID,sum(Price* Quantity) as total_sales , 
dense_rank() over( order by sum(Price* Quantity) desc ) as  sales_rank from orders group by CustomerID;
-- 65. Rank categories by revenue.
select Category,sum(Price* Quantity) as revenue , 
dense_rank() over( order by sum(Price* Quantity) desc ) as  sales_rank from orders group by Category;
-- 66. Display dense rank of products by price.
select ProductName, Price ,dense_rank() over( order by price) as Product_rank from orders;
-- 67. Display each order price along with the previous order's price.
select OrderID,OrderDate,Price, lag(Price) over (order by OrderID) as PreviousPrice from orders;
-- 68. Display each order price along with the next order's price.
select OrderID,OrderDate,Price, lead(Price) over (order by OrderID) as NextOrderPrice from orders;
-- 69. Divide products into four price groups.

SELECT ProductName, Price,
       NTILE(4) OVER (ORDER BY Price DESC) AS price_group
FROM orders;

-- 70. Divide customers into four groups based on total purchases.

select CustomerID, Sum(Price* Quantity) as total_Sales,
  NTILE(4) OVER (ORDER BY Sum(Price*Quantity) DESC) AS Purchase_group
FROM orders
group by CustomerID;

-- 71. Divide orders into four quartiles based on revenue.
SELECT OrderID, CustomerID, ProductName, Price, Quantity,
       Price * Quantity AS revenue,
       NTILE(4) OVER (ORDER BY Price * Quantity DESC) AS revenue_quartile
FROM orders;

-- 72. Update the city of CustomerID = 105 to Gandhinagar.
UPDATE customers
SET City = 'Gandhinagar'
WHERE CustomerID = 105;

-- 73. Update the payment mode of OrderID = 1005 to UPI.
UPDATE orders
 set PaymentMode= "UPI"
 Where OrderID=1005;
-- 74. Increase the price of all Electronics products by 10%.
SELECT OrderID, ProductName, Category, Price FROM orders WHERE Category = 'Electronics';
SET SQL_SAFE_UPDATES = 0;
UPDATE orders
SET Price = Price * 1.10
WHERE Category = 'Electronics';
SET SQL_SAFE_UPDATES = 1;

-- 75. Delete the order with OrderID = 1050.
DELETE FROM orders WHERE OrderID = 1050;
-- INSERT INTO orders SELECT * FROM orders_backup WHERE OrderID = 1050;

-- 76. Delete customers from Rajkot.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM orders
WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE City = 'Rajkot');
DELETE FROM customers WHERE City = 'Rajkot';
SET SQL_SAFE_UPDATES = 1;

-- 77. Delete orders where the quantity is 1.

SET SQL_SAFE_UPDATES = 0;
DELETE FROM orders WHERE quantity= 1;
SET SQL_SAFE_UPDATES = 1;

-- 78. Add a new column Age INT to the Customers table.
ALTER TABLE customers ADD COLUMN Age INT;
DESCRIBE customers;
SELECT * FROM customers;

-- 79. Add a new column Discount DECIMAL(5,2) to the Orders table.
ALTER TABLE orders ADD COLUMN Discount Decimal(5,2);
DESCRIBE orders;
SELECT * FROM orders;

-- 80. Rename the Phone column to MobileNumber (or modify its data type, depending on
-- your SQL database).
ALTER TABLE customers CHANGE COLUMN Phone MobileNumber BIGINT;
