use northwind
go

--1.- Clientes, indicando el nº de pedidos
select CompanyName, 
(select COUNT(*) from orders 
  where CustomerID = C.CustomerID) as [Nº de pedidos]
from Customers  as C 
where CustomerID in (select CustomerID from Orders)
select CompanyName,COUNT(orders.CustomerID)
from Customers
inner join Orders 
on Orders.CustomerID=Customers.CustomerID
group by CompanyName

--sacando todos los clientes
select CompanyName,COUNT(orders.CustomerID)--para que no cuente los NULL
from Customers
left join Orders 
on Orders.CustomerID=Customers.CustomerID
group by CompanyName

--2.- Clientes con algún pedido.
select companyname from customers
where customerid in (select CustomerID from Orders)

select CompanyName
from Customers
left join Orders 
on Orders.CustomerID=Customers.CustomerID
group by CompanyName

--3.- Clientes que solicitan algún pedido en la misma fecha que 
--"Ana Trujillo Emparedados y helados"
select distinct CompanyName from Orders
inner join Customers on orders.CustomerID=
         customers.CustomerID
where (customers.CompanyName<>'Ana Trujillo Emparedados y helados') and
 OrderDate in 
(select OrderDate 
from Orders 
inner join Customers on orders.CustomerID=customers.CustomerID
where customers.CompanyName='Ana Trujillo Emparedados y helados')

--fecha pedidos
select OrderDate 
from Orders 
inner join Customers 
on orders.CustomerID=customers.CustomerID
where customers.CompanyName='Ana Trujillo Emparedados y helados'


--4.- Dar el número de pedido, la fecha del pedido 
--y el máximo del precio unitario en ese pedido.
SELECT Ord.OrderID, Ord.OrderDate
       ,(SELECT MAX(OrdDet.UnitPrice)
        FROM Northwind.dbo.[Order Details] AS OrdDet
        WHERE Ord.OrderID = OrdDet.OrderID) AS MaxUnitPrice
FROM Northwind.dbo.Orders AS Ord

SELECT Orderid,MAX(OrdDet.UnitPrice)
        FROM Northwind.dbo.[Order Details] AS OrdDet
        group by OrdDet.OrderID

--sin subconsultas       
select Ord.OrderID, Ord.OrderDate,MAX(Orddet.UnitPrice)
from  orders ord
inner join[Order Details] as Orddet
on ord.OrderID=orddet.OrderID
group by Ord.OrderID, Ord.OrderDate
       
--5.- Último pedido y su fecha enviados a Paris, 
--dando el código del pedido, 
-- la fecha del último pedido y los días de diferencia.

SELECT TOP 1 OrderId,
       CONVERT(CHAR(10), OrderDate,121) Last_Paris_Order,
       (SELECT CONVERT(CHAR(10),MAX(OrderDate),121)
          FROM Orders) Last_OrderDate,
       DATEDIFF(dd,OrderDate,(SELECT MAX(OrderDate)
                                FROM Orders)) Day_Diff
  FROM Northwind.dbo.Orders
 WHERE ShipCity = 'Paris'
ORDER BY OrderDate DESC 

--fecha último pedido
SELECT MAX(OrderDate)
          FROM Orders

--último pedido de París          
SELECT TOP 1 OrderId,
       OrderDate as Last_Paris_Order
FROM Northwind.dbo.Orders
 WHERE ShipCity = 'Paris'
ORDER BY OrderDate DESC 

--6.- Lista de países en los que viven los clientes 
--y no hay proveedores en ese país. 

SELECT DISTINCT country
 FROM Customers
WHERE country NOT IN (SELECT DISTINCT country
                        FROM Northwind.dbo.Suppliers) 
--otra forma 1
SELECT DISTINCT country
FROM Customers as C
WHERE not exists (SELECT country
                        FROM Northwind.dbo.Suppliers as S
                        where c.Country=s.Country)
--otra forma 2
SELECT DISTINCT c.country
FROM Customers as C
left join Northwind.dbo.Suppliers as S
on c.Country=s.Country --aunque el enlace no viene definido en la estructura
where s.Country is null

--7.- Clientes del país con el menor número de pedidos.

SELECT Country,
CompanyName
FROM Customers
WHERE country = any (SELECT TOP 1 country
FROM Customers C
inner JOIN Orders O
ON C.CustomerId = O.CustomerID
GROUP BY country
ORDER BY count(*))

--país con menor nº de pedidos
SELECT TOP 1 with ties country
FROM Customers C
inner JOIN Orders O
ON C.CustomerId = O.CustomerID
GROUP BY country
ORDER BY count(*)

--8.- Pedidos donde el cliente compra menos del 10% 
--de la cantidad media vendida para cada producto.

SELECT DISTINCT OrderId
FROM [Order Details] OD
WHERE Quantity < (SELECT AVG(Quantity) * .1
					FROM [Order Details]
					WHERE OD.ProductID = ProductID)
-- 10% de la cantidad media vendida para cada producto
SELECT ProductID,AVG(Quantity) * .1
FROM [Order Details]
group by  ProductID

--9.- Calcular una rebaja de 75 euros por cada compra si todas sus compras fueron superiores a 750 euros.


SELECT C.CompanyName ,
COUNT(*) * 75 Rebaja
FROM Customers C
inner JOIN Orders O 
ON C.CustomerID = O.CustomerID
WHERE DATEPART(yy,OrderDate) = '1998'

and (750 < all (SELECT SUM(UnitPrice * Quantity * (1 - Discount))
				FROM Orders O
				JOIN [Order Details] OD
				ON O.OrderID = OD.OrderID
				WHERE O.CustomerID = C.CustomerId
				AND DATEPART(yy,O.OrderDate) = '1998'
				GROUP BY O.OrderId))
GROUP BY C.CompanyName

--revisar cliente
 select SUM(UnitPrice * Quantity) -75 
from
 [Order Details]
 group by OrderID
 having SUM(UnitPrice * Quantity)>750
     

--10.- Clientes a los que venda el empleado con más pedidos.
select distinct companyname from Customers
inner join Orders 
on Orders.CustomerID=Customers.CustomerID
where Orders.employeeID = (
select employeeID from Orders 
group by employeeID
having COUNT(*)=
(select MAX(v.nVentas) 
  from
    (select employeeID, count(*) as nVentas from Orders 
     group by employeeID) as v
 )
 )

-- otra forma de ver el cliente:
select top 1 employeeID, count(*) as nVentas from Orders 
     group by employeeID
     order by count(*) desc

--11.- OrderID, OrderDate y Companyname del primer día en que cada cliente hizo un pedido.
--    primer día de cada cliente
select CustomerID, MIN(OrderDate) as dia
from Orders
group by CustomerID
--
select orderID, Orderdate, companyname 
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
inner join 
(select CustomerID, MIN(OrderDate) as dia
from Orders
group by CustomerID)as M
on m.CustomerID=Customers.CustomerID
where OrderDate=dia



--12.- Clientes que tienen pedidos en el día más reciente en que se han realizado.
select companyname
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
where orders.OrderDate =
(select Max(orders.OrderDate) from Orders)

--13.- Para cada pedido de cada artículo dar: el id del pedido, cantidad vendida y el total de las ventas de ese artículo en el mismo mes.
select Orders.OrderID, Quantity,Tot.CA
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join 
(select [Order Details].ProductID as PR, sum(Quantity)as CA,datepart(month,OrderDate) as Mes
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
group by [Order Details].ProductID,datepart(month,OrderDate))as Tot
on (tot.PR=[Order Details].ProductID)
    and (tot.Mes= datepart(month,OrderDate))



--14.- lista de clientes que han pedido después del 1/1/1995
set dateformat dmy
select distinct companyname from Customers
inner join Orders 
on Orders.CustomerID=Customers.CustomerID
where Orders.OrderDate>'01/01/1995'

--15.- Lista de clientes que han pedido más de 20 artículos del producto Tunnbröd de una vez (en un pedido).

select distinct CompanyName
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
where (Products.ProductName='Tunnbröd') and ([Order Details].Quantity>20)

--16.- Lista de productos y el pedido mayor que se ha realizado del mismo.
select ProductName,MAX(quantity) as [pedido mayor]
from [Order Details]
inner join Products
on [Order Details].ProductID=Products.ProductID
group by ProductName

--17.- Lista de empleados que recibieron pedidos el 9/5/1997

set dateformat dmy
select distinct firstname+' '+lastname as nombre
from Orders
inner join employees on
Employees.employeeid =orders.EmployeeID
where orders.OrderDate='09/05/1997'

--18.- Pedidos de clientes de Madrid
select distinct orderid
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
where customers.City='Madrid'

--19.- Carga (freight) y su media para pedidos del mismo cliente.
select companyname,orderID,freight,t.med
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
inner join (
select Orders.customerID as Cli,avg(freight) as med
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
group by Orders.customerID) as t
on (t.Cli=Customers.CustomerID) 

--20.- Ventas (importe) por año
select datepart(year,OrderDate) as [Año] 
,sum(unitprice*quantity-(unitprice*quantity*discount)) as ventas
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
group by datepart(year,OrderDate)

--21.- Ventas (importe) de empleado por año.
select Firstname+' '+LastName as Nombre,datepart(year,OrderDate) as [Año] 
,sum(unitprice*quantity-(unitprice*quantity*discount)) as ventas
from Orders
inner join employees on
Employees.employeeid =orders.EmployeeID
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
group by Firstname+' '+lastname,datepart(year,OrderDate)

--22.- Ventas (importe) por categoría
select CategoryName,
sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) as ventas
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join Categories
on Categories.CategoryID=Products.CategoryID
group by CategoryName

--23.- Ventas (importe) por categoría, incluyendo la diferencia con la media de ventas por categoría.
select CategoryName,
sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) as ventas
,sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) 
-
(
select avg([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) as ventas
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join Categories
on Categories.CategoryID=Products.CategoryID
) as diferencia

from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join Categories
on Categories.CategoryID=Products.CategoryID
group by CategoryName

--24.- Once productos más caros
select top 11 with ties Productname,unitprice
from Products
order by unitprice desc

--25.- Diez productos con más ventas (importe).
select top 10 with ties ProductName
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join Categories
on Categories.CategoryID=Products.CategoryID
group by ProductName
order by sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) desc

--26.- Ventas (importe) por categoría para 1997
select CategoryName,
sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) as ventas1997
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
inner join Categories
on Categories.CategoryID=Products.CategoryID
where datepart(year,orderdate)='1997'
group by CategoryName
 
--27.- Productos cuyo precio unitario es mayor que el precio 
--unitario de venta de cualquier artículo vendido 
--con descuento mayor o igual que el 25%.

select products.ProductName
from Products
where Products.UnitPrice> all
(select [Order Details].UnitPrice
from [Order Details]
inner join Products
on [Order Details].ProductID=Products.ProductID
where discount >=0.25)


--28.- Nombre y total de ventas de todos los productos 
--con el mismo precio que Chai
select Products.ProductName,
sum([Order Details].unitprice*quantity-([Order Details].unitprice*quantity*discount)) as ventas
from [Order Details]
inner join Products
on [Order Details].ProductID=Products.ProductID
where products.ProductName<>'Chai'and
products.UnitPrice= 
(select Products.UnitPrice
from Products
where products.ProductName='Chai')
group by Products.ProductName



--29.- Clientes y nombre de contacto que han realizado pedido 
--en el segundo trimestre de 1997.
select distinct companyname,ContactTitle+' '+ContactName as contacto
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
where (datepart(year,orders.OrderDate)='1997')
  and (DATEPART(month,orders.OrderDate) in (4,5,6))


--30.- Nombre de empleados que han gestionado al menos un pedido.
select FirstName+' '+LastName as nombre
from employees 
where Exists
(select OrderID from orders where employees.EmployeeID=Orders.EmployeeID)

--31.- Empleado y quien lo supervisa
select e1.FirstName+' '+e1.LastName as nombre,
e2.FirstName+' '+e2.LastName as nombresupervisor
from employees as e1
inner join Employees as e2
on e2.EmployeeID=e1.ReportsTo


--32.- Buscar todos los empleados cuya edad sea mayor a la de cualquier jefe.
select FirstName+' '+LastName as nombre, BirthDate
from employees 
where BirthDate < all 
(select distinct e2.BirthDate
from employees as e1
inner join Employees as e2
on e2.EmployeeID=e1.ReportsTo
)


--33.- Proveedores con más de 3 artículos
select  Suppliers.CompanyName
from Suppliers
where 3<
(select COUNT(productid) 
from Products
where Products.SupplierID=Suppliers.SupplierID)

--34.- Transportistas que han repartido más de 3 pedidos en 1997
select companyname
from Shippers 
where 3<
(select COUNT(orderid)
FROM Orders
WHERE datepart(year,orderdate)='1997'
and Orders.ShipVia=Shippers.ShipperID)



--35.- Artículos vendidos con stock 0

select productname 
from Products
where products.UnitsInStock=0 
	and exists 
	(select productid 
	 from [Order Details]
	 where [Order Details].ProductID=Products.ProductID)

--36.- Mostrar todos los clientes que han pedido 
--los productos “Vegie-spread” y “Chocolade”.
select distinct companyname
from Customers 
where 
(Customers.CustomerID in 
(select CustomerID
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
where productname='Vegie-spread'))
and
(Customers.CustomerID in 
(select CustomerID
from Orders
inner join [Order Details]
on Orders.OrderID=[Order Details].OrderID
inner join Products
on [Order Details].ProductID=Products.ProductID
where productname='Chocolade'))




--37.- Clientes de la región con más pedidos.


-- pedidos por región a tabla temporal
if object_id('tempdb..#regiones') is not null
  drop table #regiones;

select regiondescription as RG, count(OrderID) as pedidos 
into #regiones
from Orders
inner join employees on
Employees.employeeid =orders.EmployeeID
inner join employeeTerritories on 
EmployeeTerritories.EmployeeID=Employees.EmployeeID
inner join Territories on
Territories.TerritoryID=EmployeeTerritories.TerritoryID
inner join Region on
region.RegionID=Territories.RegionID
group by regiondescription


select RG, pedidos from #regiones
-- región con más pedidos
select rg,pedidos from #regiones
where pedidos =
(select max(pedidos)as mp from #regiones)
--también
select  top 1 rg,pedidos from #regiones
order by pedidos desc


-- clientes de región con más pedidos
select distinct companyname
from Orders
inner join Customers on
Customers.CustomerID=Orders.CustomerID
inner join employees on
Employees.employeeid =orders.EmployeeID
inner join employeeTerritories on 
EmployeeTerritories.EmployeeID=Employees.EmployeeID
inner join Territories on
Territories.TerritoryID=EmployeeTerritories.TerritoryID
inner join Region on
region.RegionID=Territories.RegionID
where region.RegionDescription in
(select rg from #regiones
where pedidos =
(select max(pedidos)as mp from #regiones))
