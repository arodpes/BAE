USE Northwind
SELECT CompanyName
FROM Customers
WHERE CustomerID IN 
   (SELECT CustomerID FROM Orders WHERE OrderDate > '1/1/95')

SELECT CompanyName
FROM Customers inner join Orders
on Customers.CustomerID=Orders.CustomerID
where OrderDate > '1/1/95'
group by CompanyName

-- otra
USE Northwind
SELECT OrderID, CustomerID
FROM Orders o
WHERE 20 < (SELECT Quantity 
               FROM [Order Details] od
               WHERE o.OrderID = od.OrderID AND od.ProductID = 23)

SELECT DISTINCT ProductName, Quantity
FROM [Order Details] od1 JOIN Products p
ON od1.ProductID = p.ProductID
WHERE Quantity = (SELECT MAX(Quantity)
               FROM [Order Details] od2
               WHERE od1.ProductID = od2.ProductID)

SELECT LastName, EmployeeID
FROM Employees e
WHERE EXISTS (SELECT * FROM Orders
          WHERE e.EmployeeID = Orders.EmployeeID
          AND OrderDate = '9/5/97')

SELECT LastName, e.EmployeeID
FROM Orders INNER JOIN Employees e
     ON Orders.EmployeeID = e.EmployeeID
WHERE OrderDate = '9/5/97'

SELECT OrderDate, SUM(Freight) AS SumFreight,
(SELECT SUM(CONVERT(money, ([Order Details].UnitPrice * [Order Details].Quantity) * (1 - [Order Details].Discount) / 100) * 100) AS
Subtotal
FROM [Order Details] INNER JOIN Orders ON [Order Details].OrderID =
Orders.OrderID
WHERE (Orders.OrderDate >= '19960704') AND (Orders.OrderDate <=
'19960706')) As SumOrders
FROM Orders
GROUP BY OrderDate 

Select p.productname,  
       Datepart(MM,o.OrderDate),  
       od.Quantity  
from orders o  
inner join [Order Details] od  
  on o.OrderID = od.OrderID  
inner join Products p  
  on p.ProductID=od.ProductID  
Where YEAR(o.OrderDate)=1997  
Group by Datepart(MM,o.OrderDate), od.Quantity,p.productname 

-- Get subtotal for each order.
select OrderID, 
    sum(UnitPrice * Quantity * (1 - Discount)) as Subtotal
from [Order Details]
group by OrderID
order by OrderID;
