--consulta de agregado 
--nota solo devuelven un solo registro cuando no tiene 
--sum, avg ,count,count(*),max y min 

use Northwind
--cuantos clientes tengo 

select * from Customers

select count(*) as 'numero de cliente' from Customers

--cuantas regiones hay 


select count(Region) from Customers 
 

select count(Region) from Customers 
where Region is null 

select count(*) from Customers 
where Region is null 



select count (distinct region) 
from Customers  
where Region is not  null 


select distinct region
from Customers  
where Region is not  null 
order by Region asc 

select * from Orders;

select COUNT (*) from Orders;

select COUNT (ShipRegion) as 'regiones envio' from Orders;

select * from Products;

--seleccciona el precio mas bajo de los productos

select min(UnitPrice) as 'precio minimo' from Products;

select avg(UnitsInStock) as 'unidades en stock' from Products;

select min(UnitsInStock) as 'unidades en stock' from Products;

select UnitsInStock as 'unidades en stock' from Products;

-- seleccionar cuantos pedidos ecisten 

select * from Orders;

select count(*) as 'numeros pedidos' from Orders;

-- calcula el total de dinero vendido

select *  from [Order Details]

select sum(UnitPrice * Quantity) as 'total dinero' from [Order Details]

select sum(UnitPrice * Quantity - (unitprice * Quantity * Discount)) 
 as 'total dinero' from [Order Details]

-- calcula el total de unidades en stock de todos los productos

select sum(UnitsInStock) as 'en stock' from Products;

--calcular total de unidades en stock de tosos los productos 
select sum(UnitsInStock) as 'total stock' from Products

--Nuevo tema  GROUP  
---SELECIONA EL  NUMERO DE PRODUCTOS POR CATEGORIA 

SELECT * FROM Products
SELECT  CategoryID, COUNT(*) FROM Products GROUP BY CategoryID

SELECT  CategoryID, COUNT(*) FROM Products GROUP BY CategoryID

SELECT  CategoryID, COUNT(*) AS 'NUMEROS DE PRODUCCCTOS' FROM Products GROUP BY CategoryID

 SELECT p.CategoryID , count(*) FROM Categories
 INNER JOIN Products as p  ON  categories.CategoryID = p.CategoryID
 group by  p.CategoryID


  SELECT categories.categoryName , count(*) as [numero de productos ] FROM Categories
 INNER JOIN Products as p  ON  categories.CategoryID = p.CategoryID
 group by   categories.categoryName

 --calcular el preco promedio por cada categoria 
 use Northwind

 select  CategoryID, avg(UnitPrice) as 'precio promedio' 
 from Products
 group by CategoryID

 -- seleciona el numero de pedidos realizados por cada empleado 

 select * from  Orders



 select employeeid , Count(*) as 'numero de pedidos '
 from Orders
 group by EmployeeID


 --seleciona la suma total de undades vendidad de cada producto utilizados 1996


 select  EmployeeID ,COUNT(*)
 from Orders
 where OrderDate between '1996-10-01' and '1996-12-31'

 
 select  EmployeeID,COUNT(*)
 from Orders
 where OrderDate between '1996-10-01' and '1996-12-31'
  group by EmployeeID


  --seleciona la sums de unidades vendidas por cada producto 

  select top 5 Productid,
  sum (Quantity)as 'numero de productos vendidos '
  from [Order Details]
  group by ProductID
  order by 1 desc

   select Productid,
  sum (Quantity)as 'numero de productos vendidos '
  from [Order Details]
  group by ProductID
  order by 2 desc

  select Productid, sum(Quantity)as
  'numero de productos vendidos ' from [Order Details]
  group by OrderID, ProductID
   order by 2 desc


   --having  y el where son parecidad pero having filtran grupos y where filtra filas 


   --selelcinar el numero de productospor categorias solo los que tengan mas de 10 productos 

   --paso 1
   select *from [Product Sales for 1997]

   --paso 2 

    select distinct CategoryID from Products

	--paso 3 
	select  CategoryID from Products
	where CategoryID in (2,4,8)

	--paso 4
	
	select  CategoryID, UnitsInStock from Products
	where CategoryID in (2,4,8)
	order by CategoryID 

--paso 5 se agrupa 

select  CategoryID, sum(UnitsInStock) from Products
	where CategoryID in (2,4,8)
	group by CategoryID 
	having count(*)>10
	order by CategoryID 


   select CategoryID ,avg(UnitPrice)from Products
where CategoryID in (1,3,4)
group by CategoryID




select CategoryID ,avg(UnitPrice)from Products
where CategoryID in (1,3,4)
group by CategoryID

select CategoryID ,avg(UnitPrice)from Products
where  CategoryID in (1,3,4)
group by CategoryID
having COUNT(*)>10

select CategoryID ,COUNT(*)
from Products
where  CategoryID in (1,3,4)
group by CategoryID
having sum (UnitPrice)>10

	--listar los empleados que agrupadas por los empleasos pero que solo aquellos hayan gestionado masde 10n pedidos 

	select * from Orders