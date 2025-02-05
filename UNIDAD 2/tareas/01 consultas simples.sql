--Tarea Consulta simple 
use Northwind

--1.    Productos con categoría 1, 3 o 5

 Select ProductName,CategoryID,UnitPrice
from Products
where CategoryID in (1,3,5);

--2.    Clientes de México, Brasil o Argentina

select * from Customers;

select CustomerID,Country  from Customers  where Country in ('Mexico', 'Brazil','Argentina');

--3.    Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50

select * from Shippers;
select * from Orders;

select EmployeeID, Freight from Orders where  EmployeeID in (1,2,3) and Freight>='50'

--4.    Empleados que trabajan en Londres, Seattle o Buenos Aires
select *from Employees;
select  EmployeeID, LastName,FirstName, city from Employees where city in ('London','Seattle','Buenos Aires')  


--5.    Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100

select * from Customers;

select * from Orders;
 select CustomerID,ShipCountry,Freight from Orders where ShipCountry in ('France','Germany')  and Freight<='100'


--6.    Productos con categoría 2, 4 o 6 y que NO estén descontinuados

select* from Products

 Select ProductName,CategoryID,Discontinued
from Products
where CategoryID in (2,4,6) and Discontinued='1'

--7.    Clientes que NO son de Alemania, Reino Unido ni Canadá

select * from Customers;

select CustomerID,Country  from Customers  where Country NOT in  ('Germany', 'Canada','UK');


--8.    Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canadá

select * from Shippers;
select * from Orders;
select EmployeeID, ShipCountry from Orders where  EmployeeID in (2,3) and ShipCountry NOT in  ('USA', 'Canada');

--9.    Empleados que trabajan en 'London' o 'Seattle' y fueron contratados después de 1995

select *from Employees;
select  EmployeeID, LastName,FirstName, city, HireDate from Employees where city in ('London','Seattle')   AND HireDate>='1995'


--10.    Productos de categorías 1, 3 o 5 con stock mayor a 50 y que NO están descontinuados

select* from Products

 Select ProductName,CategoryID,UnitsInStock,Discontinued
from Products
where CategoryID in (1,3,5) and Discontinued='0' AND UnitsInStock>='50'