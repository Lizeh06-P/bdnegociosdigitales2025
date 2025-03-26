## Consultas basicas 

--consulta de agregado nota solo devuelven un solo registro cuando no tiene sum, avg ,count,count(*),max y min

![GREGADO](../documentacion/img/simple.png)


```sql
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

```
 ## Having y Where

having  y el where son parecidad pero having filtran grupos y where filtra filas 


## Concepto fácil:

WHERE: Filtra filas antes de agrupar. Se usa para especificar condiciones sobre las filas individuales de la tabla antes de que cualquier agregación o agrupamiento ocurra.

HAVING: Filtra grupos después de agrupar. Se usa para especificar condiciones sobre los resultados de la agregación (por ejemplo, sumas, promedios) que se hacen después de que los datos han sido agrupados.

## En resumen:

WHERE se aplica antes de la agrupación (filtra filas).

HAVING se aplica después de la agrupación (filtra grupos).

## Ejemplo simple:
WHERE: "Mostrar todos los empleados que ganan más de $5000".

HAVING: "Mostrar los departamentos donde la suma de los salarios es mayor a $10000".



```sql
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

```




## Consulta Simples   LMD
 
```sql
   --Lenguaje SQL-LMD (insert,update, delete, select, -CRUD)
--Consultas Simples
use Northwind;
--MOSTRAR  TODOS LOS CLIENTES, probedores categorias productos ordenes detalles de la orden  empleados CON TODAS LAS COLUMAS DE LA EMPRESA 

select * from Customers;

select * from Employees;

select * from Orders;

select * from Suppliers;

select * from Products;

select * from Shippers;

select * from Categories;

select * from [Order Details];


--proyeccion

select ProductID,ProductName, UnitPrice, UnitsInStock from products;

--selecionar el numero de empeado su primer nombre , su cargo, ciudad y pais 


select * from Employees;


select EmployeeID, FirstName,Title, City, Country  from Employees;

--Alias de columna 

--EN base de la consulta anterior visualisar el employeeid como numero de empleado 
--firstname como primer nombre , title  como cargo ,city como ciudad ,country como pais 

select * from Employees;
select EmployeeID as 'numero empleado',FirstName,Title, City, Country  from Employees;

select EmployeeID as 'numero empleado',FirstName as primernombre,Title 'cargo', City as ciudad, Country  from Employees;
--PARA RENOMBRAR SE PUEDE PONER [] CUANDO TIENE ESPACIO O CON '' SIMPLES DE IGUAL MANERA SE USA EL AS 

select EmployeeID as [Numero empleado],FirstName as Primernombre,Title 'Cargo', City as Ciudad, Country as Pais  from Employees;

--CAMPOS CALCULADO 
--SELECIONAR  EL IPORTE DE CADA UNO DE LOS PRODUCTOS VENDIDOS EN UNA ORDEN 

select * from [Order Details];
--se multiplico
select *,(UnitPrice * Quantity) as importe from [Order Details]

--selecionar las fechas  de orden, y a�o,mes y dia , el cliente 
--que las ordeno y el empleado que la realizo 

select OrderDate, year(OrderDate), month(OrderDate), day(OrderDate), CustomerID, EmployeeID from Orders;

select  OrderDate as 'fecha orde', year(OrderDate) as fecha , month(OrderDate) as mes, day(OrderDate) dia, CustomerID, EmployeeID from Orders;

--clausula where puede llevar campo o columna puede llevar un opreradores relacionaleres  = <>  o  <= o >= != o <>

select * from Customers;

--selecionar el cliente BOLID

select  CustomerID,CompanyName, City, Country from Customers where CustomerID = 'BOLID';
select  CustomerID as Clienteid,CompanyName as NombreCompa�ia, City as Ciudad, Country as Pais from Customers;

--selecionar los clientes mostar su identificador, 
--nombre de la empresa ,contacto de ciudad y pais alemania  

select  CustomerID as Clienteid,CompanyName as NombreCompa�ia, City as Ciudad, Country as Pais from Customers where  Country ='germany'

--selecionar todos los clientes que no sea de alemacia 
select  CustomerID as Clienteid,CompanyName as NombreCompa�ia, City as Ciudad, Country as Pais from Customers where  Country !='germany'
select  CustomerID as Clienteid,CompanyName as NombreCompa�ia, City as Ciudad, Country as Pais from Customers where  Country <>'germany'
--selecionar todos los productos mostrando sus nombre de producto 
--categoria a la que pertenece ,existencia ,precio ,pero solamente donde su precio sea mayor a 100


select * from Products;
 
select ProductName AS [nombre producto], UnitsInStock as Existencia, UnitPrice  as precio from Products  where  UnitPrice >='100'

select ProductName AS [nombre producto], UnitsInStock as Existencia, UnitPrice  as precio, (UnitPrice*UnitsInStock)
as [Costo inventario ]from Products  where  UnitPrice >='100'


--seleciona las ordenes de compra 
--mostrando la fecha de orden, la fecha de entrega, la fecha de envio
--el cliente a quien se envio 
--de 1996


select * from Orders;

select  OrderDate as OrdenFecha, RequiredDate as OrdeEntrega, ShippedDate as [fecha de envio], 
CustomerID as cliente  from Orders where year(OrderDate)='1996'

 
--filas duplicadas (DISTINCT)
select * from Customers;

--mostrar los paises donde se tiene clientes, mostrando pais solamente 
--distinct quita datos repetidos 

select Distinct Country as Pais from Customers
order by Country

--mostrara todas las ordenes de compra donde las cantidad ordenada donde la cantidad de productos comprados sea mayor a  5

select * from [Order Details];


select * from  [Order Details] 

where  Quantity >= 40
--MOSTRAR EL NOMBRE DEL EMPLEADO SU NUMEMRO DE EMPLEADO FECHA DE NACIMIENTO Y
--DE CONTRATACION Y ESTA DEBE SER DE AQUELLOS QUE  FUERON CONTRATADOS DESPUES  DE 1993
-- LOS CALCULOS DE SU EMCABEZADO DEBE SER EN ESPA;OL 
select * from Employees;
select FirstName as primernombre, 
EmployeeID as 'numero empleado',
LastName as 'apellido',
city as ciudad,
BirthDate as 'fecha de nacimiento',
HireDate as'fecha de contrato'  
from Employees where year(HireDate)='1993'
 --concatenar nombre y apellido 
 select (FirstName + '  '+ LastName) as 'nombre completo',
city as ciudad,
BirthDate as 'fecha de nacimiento',
HireDate as'fecha de contrato'  
from Employees where year(HireDate)='1993'

 select concat  (FirstName,' ',LastName, '-',Title) as 'nombre completo',
city as ciudad,
BirthDate as 'fecha de nacimiento',
HireDate as'fecha de contrato'  
from Employees where year(HireDate)='1993'


--mostrar los empleados que no son dirijidos por el jefe 2 

select * from Employees;

select  EmployeeID, ReportsTo from Employees where ReportsTo >=2;
select FirstName as primernombre, 
EmployeeID as 'numero empleado',
LastName as 'apellido',
city as ciudad,
BirthDate as 'fecha de nacimiento',
HireDate as'fecha de contrato' , 
 ReportsTo as jefe  from Employees;

 select FirstName as primernombre, 
EmployeeID as 'numero empleado',
LastName as 'apellido',
city as ciudad,
BirthDate as 'fecha de nacimiento',
HireDate as'fecha de contrato' , 
 ReportsTo as jefe  from Employees  where ReportsTo !=2;


 --quien no tiene jefe 
 select * from Employees;


  select * from Employees where  ReportsTo is null;

