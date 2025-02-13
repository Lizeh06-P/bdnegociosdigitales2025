--joins (contar ) se divide en INNER, LEFT, RIGHT, CROSS, FULL  JOINS van en el FROM  ejemplo
--select * from  
--tabla 1  Inner tabla2 
--      pk      fk    
--on  campo = campos

USE northwind
--selecionar todas las categorias y productos 

 select * from 
 Categories
 inner join
 Products 
 on Categories.CategoryID =Products.CategoryID;


 select Categories.CategoryID, CategoryName,ProductName,UnitsInStock,UnitPrice 
 from 
 Categories
 inner join
 Products 
 on Categories.CategoryID =Products.CategoryID;



 
 select C.CategoryID, CategoryName,ProductName,UnitsInStock,UnitPrice 
 from 
 Categories as	C	
 inner join
 Products  as  P
 on C.CategoryID =P.CategoryID;


  
 select C.CategoryID AS [NUMERO DE CATEGORIA ], CategoryName AS 'NMBRE DE CATEGORIA ',
 ProductName AS 'NOMBRE DEL PRODUCTO',UnitsInStock AS 'EXISTENCIA ',UnitPrice AS 'PRECIO'
 from 
 Categories as	C	
 inner join
 Products  as  P
 on C.CategoryID =P.CategoryID;

 --selecionar los productos de la categorias beveraga
 --y condiments donde  la existencua este entre 18 y 30 

 select*
 from 
 Products  as  P
 join
  Categories as	CA
 on P.CategoryID = CA.CategoryID 
 WHERE CA.CategoryName IN('beverages', 'condiments');

  select*
 from 
 Products  as  P
 join
  Categories as	CA
 on P.CategoryID= CA.CategoryID
 WHERE (CA.CategoryName  ='beverages' or ca.CategoryName= 'condiments') 
 and (p.UnitsInStock>18 and p.UnitsInStock<=30)

 select*
 from 
 Products  as  P
 join
  Categories as	CA
 on P.CategoryID= CA.CategoryID
 WHERE (CA.CategoryName  ='beverages' or ca.CategoryName= 'condiments') 
 and (p.UnitsInStock>18 and p.UnitsInStock<=30)
  select*
 from 
 Products  as  P
 join
 Categories as	CA
 on P.CategoryID= CA.CategoryID
 WHERE CA.CategoryName  in('beverages','condiments') 
 and p.UnitsInStock between 18 and 30;

 --slecionando los productos y sus importes realizados de marzo a junio de 
 --1996, mostrando la fecha de la orden, el id del producto y el importe 
 select * from Orders
select* from [Order Details]

select O.OrderID, O.OrderDate,OD.ProductID,
(OD.UnitPrice* OD.Quantity) as  importe
 from 
 Orders as  O
 inner join
[Order Details] as OD
 on OD.OrderID = O.OrderID
 WHERE O.OrderDate between '1996-07-01'and '1996-10-31'

 select getdate()
 
 --mostrar el importe total de ventas de la consulta anterior 

 select  CONCAT ('$''',SUM (OD.UnitPrice* OD.Quantity)) AS importe
 from 
 Orders as  O
 join
[Order Details] as OD
 on OD.OrderID = O.OrderID
 WHERE O.OrderDate between '1996-07-01'and '1996-10-31'


 use Northwind
 --consula basicas con inner join
 --1.-obten el nombre de los clients y de los paises a los que se enviaron sus pedidos 
 

 select * from Customers

  select o.CustomerID ,o.ShipCountry
  
 from Orders as o

 select  c.CompanyName ,o.ShipCountry
 from
 Orders as	o
 inner join
  Customers  as  c
 on c.CustomerID= o.CustomerID
  order by 2 desc
 
select  c.CompanyName as 'Nombre del cliente '
,o.ShipCountry as 'pais de envio'
 from
 Orders as	o
 inner join
  Customers  as  c
 on c.CustomerID= o.CustomerID
  order by o.ShipCountry desc



 --2.-obten los productos y sus respectivos proveedores 

 select p.ProductName as 'nombre producto',s.CompanyName  as [Nombre de la proveedr ]  from 
 Products as p
inner join
Suppliers as S
on p.SupplierID = s.SupplierID

 --3.-obtener lod pedidios y los empleados que los gestiona 
  select o.OrderID , CONCAT (e.Title,' - ' , e.FirstName,' ',e.LastName) as 'nombre'  from 
 Orders as o
inner join
Employees as e
on o.EmployeeID = e.EmployeeID

--4.- estan los productos juntos con sus precios y la categoria a la que pertenece 

 select p.ProductName as 'nombre del producto' , p.UnitPrice as 'precio',c.CategoryName as'nombre de la categoria ' from 
 Products as p
inner join
Categories as c
on p.CategoryID = c.CategoryID

select p.ProductName, p.UnitPrice, c.CategoryID from Products as p
inner join 
Categories as c
on p.ProductID = c.CategoryID




--5.- optener el nombre del ciente el numero de orden y la fecha de orden

select * from Customers
select *from Orders

select c.CompanyName as'nombre ', o.OrderID as 'numero de orde', o.OrderDate as 'fecha de order' from 
 Customers as c
inner join
orders   as o
on c.CustomerID = o.CustomerID



--6.-listar las ordenes mostrando el numero de orden el nombre del producto la  cpacidad quese vendio

select  od.OrderID as 'numero de orden',p.ProductName as 'nombre de producto', od.Quantity as 'cantidad'  from 
 Products as P
inner join
[Order Details]  as od
on  P.ProductID= od.ProductID
order by od.Quantity desc

select top 5  od.OrderID as 'numero de orden',p.ProductName as 'nombre de producto', od.Quantity as 'cantidad'  from 
 Products as P
inner join
[Order Details]  as od
on  P.ProductID= od.ProductID
order by od.Quantity desc

select  od.OrderID as 'numero de orden',p.ProductName as 'nombre de producto', od.Quantity as 'cantidad'  from 
 Products as P
inner join
[Order Details]  as od
on  P.ProductID= od.ProductID
where od.OrderID ='11031'
order by od.Quantity desc



select  od.OrderID as 'numero de orden', count (*) as 'cantidad de productos vendidos '  from 
 Products as P
inner join
[Order Details]  as od
on  P.ProductID= od.ProductID
group by od.OrderID
order by od.OrderID desc

select * from 
[Order Details] as od
where od.OrderID =11077


--7- obtener los empleados y sus respectivos jefes

select  CONCAT(e1.FirstName,'',e1.LastName) as [empleado],
concat (j1.FirstName,'',j1.LastName) as [jefe] from  Employees as e1
inner join Employees as j1
on e1.ReportsTo = j1.EmployeeID

select  FirstName, ReportsTo from Employees


--8- listar los pedidos y el nombre de la empresa transporte utilizado 
use northwind

select o.orderid, s.ShipperID  from 
orders as o 
inner join 
Shippers as s 
on o.shipVia = s.ShipperID


--consulta de inner join intermedias 


--9. optener la cantidad  total de productos vendidisos por categoria 

select sum (Quantity) from [Order Details]

select c.CategoryName as 'nombre categoria ', sum (Quantity) as 'productos vendidos ' from  Categories as c
inner join Products as p 
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by c.CategoryName



--10.obtener el total de ventas por empleado 



select concat (e.FirstName,'', e.LastName),sum ((od.Quantity * od.UnitPrice)-(od.Quantity * od.UnitPrice)*od.Discount) as total 
from Orders as o 
inner join Employees as e 
on o.EmployeeID = e.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by e.FirstName, e.LastName





select *
from Orders as o 
inner join Employees as e 
on o.EmployeeID = e.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID


select *
from Orders as o 
inner join  [Order Details] as od
on o.OrderID = o.OrderID
inner join  Employees as e
on e.EmployeeID = o.EmployeeID
