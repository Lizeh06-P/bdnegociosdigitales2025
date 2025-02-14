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


use Northwind

--11.Lista los clientes y la cantidad de pedidios que han realizados 

select *from Customers  
select *from  Orders


select c.CompanyName as 'NOMBRE CLIENTE', COUNT(*) as 'numero de pedidos'
from  Orders AS o 
inner join Customers as C 
on o.CustomerID = c.CustomerID
group by c.CompanyName
order by 'numero de pedidos' desc


select c.CompanyName as 'NOMBRE CLIENTE', COUNT(*) as 'numero de pedidos'
from  Orders AS o 
inner join Customers as C 
on o.CustomerID = c.CustomerID
group by c.CompanyName
order by 2 desc


--12.Obtener los empleados que han gestado pedidos enviados a alemaia 

select *from Orders
select distinct e.FirstName as 'nombre ',ShipCountry as 'pais'    from  Employees as e 
inner join  Orders as o 
on  e.EmployeeID = o.EmployeeID
where  ShipCountry='Germany'

select distinct concat(e.FirstName, '' , e.LastName) as 'nombre ',ShipCountry as 'pais'    from  Employees as e 
inner join  Orders as o 
on  e.EmployeeID = o.EmployeeID
where  o.ShipCountry='Germany'




--13.Listar los productos junto con el nombre del proveedor y el pais de origen


select *from Suppliers


select p.ProductName as [nombre producto ], s.CompanyName as [proveedor] ,
s.country as [pasi de origen ]
from  Suppliers as s
inner join Products as p
on s.SupplierID = p.SupplierID
order by 1 asc


--14.obtener los pedidos agrupados por pais de envio 
select *from Orders
select  CONCAT(o1.OrderID,'',o1.ShipCountry) as [pedidos ] from  Orders as o1

--correcta 
select o.ShipCountry as [pais de envio], count (o.OrderID) as[numero de ordenes]
from Orders as o 
group by  o.ShipCountry
order by 2 desc


--15.obtener los empleados y la cantidad de territoro en los que trabajan 

select *from Employees
select * from EmployeeTerritories

select concat(e.FirstName, '' , e.LastName) as 'nombre completo' 
, et.TerritoryID as'territorio' from Employees as e
inner join EmployeeTerritories as et
on  e.EmployeeID= et.EmployeeID
--correcta 
select concat(e.FirstName, '' , e.LastName) as 'nombre completo' 
, count (et.TerritoryID )as[territorio] from Employees as e
inner join EmployeeTerritories as et
on  e.EmployeeID= et.EmployeeID
group by e.FirstName,e.LastName

--descripcion del terrio

select concat(e.FirstName, '' , e.LastName) as [nombre completo]
, count (et.TerritoryID )as[territorio] 
from Employees as e
inner join EmployeeTerritories as et
on  e.EmployeeID= et.EmployeeID
inner join Territories  as t 
on et.TerritoryID= t.TerritoryID
group by e.FirstName,e.LastName,t.TerritoryDescription
order by [nombre completo],t.TerritoryDescription desc

--16.listar las categorias y la cantidad de productos que contienen 

select *from Categories
select * from Products

select  CategoryName as'nombre categoria', count(p.ProductID)
 as 'cantidad de productos '
from  Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID
group by c.CategoryName
order by 2 desc


--17.obtener la cantidad total de productos vendidos por proveedor 
select *from Suppliers
select *from Products

select s.CompanyName as [proveedor],
sum(od.Quantity) as[total de producto]
from Suppliers as s
inner join Products as p
on s.SupplierID= p.SupplierID
inner join [Order Details] as od
on od.ProductID=p.ProductID
group by s.CompanyName 
order by 2 desc

--18.obtener la cantidad de pedidos enviados por cada empresa de transporte 









--consulta avanzadas 


