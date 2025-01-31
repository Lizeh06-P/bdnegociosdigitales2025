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

--selecionar las fechas  de orden, y año,mes y dia , el cliente 
--que las ordeno y el empleado que la realizo 

select OrderDate, year(OrderDate), month(OrderDate), day(OrderDate), CustomerID, EmployeeID from Orders;

select  OrderDate as 'fecha orde', year(OrderDate) as fecha , month(OrderDate) as mes, day(OrderDate) dia, CustomerID, EmployeeID from Orders;

--clausula where puede llevar campo o columna puede llevar un opreradores relacionaleres  = <>  o  <= o >= != o <>

select * from Customers;

--selecionar el cliente BOLID

select  CustomerID,CompanyName, City, Country from Customers where CustomerID = 'BOLID';
select  CustomerID as Clienteid,CompanyName as NombreCompañia, City as Ciudad, Country as Pais from Customers;

--selecionar los clientes mostar su identificador, 
--nombre de la empresa ,contacto de ciudad y pais alemania  

select  CustomerID as Clienteid,CompanyName as NombreCompañia, City as Ciudad, Country as Pais from Customers where  Country ='germany'

--selecionar todos los clientes que no sea de alemacia 
select  CustomerID as Clienteid,CompanyName as NombreCompañia, City as Ciudad, Country as Pais from Customers where  Country !='germany'
select  CustomerID as Clienteid,CompanyName as NombreCompañia, City as Ciudad, Country as Pais from Customers where  Country <>'germany'
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

  --Operadores logicos 
  --(or, and y not)
  --selecionar los productos que tengan un precio de entre 10 y 50 

  select * from Products;

  select UnitPrice  from Products where UnitPrice >= 10 and UnitPrice <=50;
  select ProductName  as 'Nombre',UnitPrice as 'producto'
  from Products
  where UnitPrice >= 10 and UnitPrice <=50;


  --mostrar todos los pedidos realizados por clientes que no son de alemania 

  select * from Customers;
  select  CustomerID as Clienteid,CompanyName as NombreCompañia, City as Ciudad, Country as Pais from Customers where  Country !='germany'
  
select * from Orders;
select OrderDate as 'Fecha de orden',ShipCountry as 'ciudad' from Orders  where not ShipCountry ='Germany'

select *from Orders where ShipCountry = 'Germany';

select *from Orders where not  ShipCountry = 'Germany';

--seleciona clientes de Mexico o usa 

select *from Orders where ShipCountry >='Mexico OR USA';


--EMPLEADOS QUE NACIOERO  ENTRE 1955 Y 1958 Y QUE VIVAN EN LONDRES 

select * from Employees 

 where year(BirthDate)>=1955  and year(BirthDate)<=1958 AND City ='London'


 --selecionar los pedidos con  fletes(Freight) mayor a $100 y enviar a fancia o españa
  select Freight,ShipCountry from Orders
  where Freight >100 and
  (ShipCountry= 'France' or  ShipCountry='Spain')


  --slecionar las primeras  top  cinco ordenes de compra

  select top 5 * from Orders;


  ---slecionara productos con pr4cio de 10 y 50 
  --que no esten descontinuados y tiene mas de 20 unidades 

  select * from Products;

  
  select ProductName  as 'Nombre',UnitPrice as 'producto',UnitsInStock 'CANTIDA',Discontinued'existencia'
  from Products
  where UnitPrice>= 10 and UnitPrice<=50 and  Discontinued =0 and UnitsInStock >20


  ---pedidos eniviados a francia o alemania pero con un flete emnor de 50
  select *from Orders;

  select OrderID, Freight,ShipCountry from Orders
  where Freight <=50and
  (ShipCountry= 'France' or  ShipCountry='Germany')
  --clientes que no sean de mexico o usa y que tengan fax registrados 
  select * from Customers;


  select Companyname,Country,City,Fax from Customers 
  where not( Country='Mexico'or Country = 'USA') AND Fax IS NOT NULL


  
  select Companyname,Country,City,Fax from Customers 
  where (Country<>'Mexico'and Country<>'USA')AND Fax IS NOT NULL
  
  --slecionar pedidos con un flete mayor 
  --mayor a 100, enviados a Brasil o Argentins 
  --pero no enviados por el transportitsta 1

  select *from  Shippers

  select * from Orders


  
  
  --seleciona empleados que no viven en Londres o Seattle y que fueron contratados desde de 1995
  Select CONCAT (FirstName,'',LastName) AS [Nombre completo],hiredate,city,Country 
  from Employees WHERE NOT (City= 'London' or city ='seatTle') and year(HireDate)>=1992

  Select CONCAT (FirstName,'',LastName) AS [Nombre completo],hiredate,city,Country 
  from Employees WHERE City <>'London' or city <>'Seattle' and year(HireDate)>=1992


  --Clausula  IN (ES UNA OR PRACTICAMENTE)

  --SELECIONARA LOS PRODUCTOS CON CATEGORIA 1, 3 o 5


Select * from Products

Select ProductName,CategoryID,UnitPrice
from Products
where CategoryID = 1 or	CategoryID =3 OR CategoryID =5
  
  Select ProductName,CategoryID,UnitPrice
from Products
where CategoryID in (1,3,5);
  --selecionar todas las ordenes de la region RJ Tachira y que no tenga region aisignada 

  select *from Orders

  select ShipRegion from Orders where ShipRegion
  in ('RJ','Táchira')  or ShipRegion is null

  select *from [Order Details]
  --selecionar las ordenes que tengan cantidades de 12,9 o 40 
  --y descuento de 0.15 o 0.05

   select *from [Order Details]

   select OrderID,Quantity,Discount  from [Order Details]
   where Quantity in (12,9,40) and Discount in (0.15,0.05)
  

  --CLAUSULA BETWEEN (ENTRE) siempre va en un where 

  --berween valorinicial and valorfinal--
 -- mostras los productos y entre 10 y 50

 select* from Products

 select UnitPrice  from Products
 where UnitPrice>=10 and UnitPrice<=50;

 select ProductID, UnitPrice from Products
 where UnitPrice between 10 and 50

 --seleciona todos los pedidos realizados 
 --entre el primero de enero y en 30 de junio 1997

 select * from Orders


 SELECT OrderDate FROM Orders WHERE OrderDate>= '1997-01-01' AND OrderDate<= '1997-06-30'

 select OrderID as ordeniID, concat (day(OrderDate),  '-',year(OrderDate), '-',month(OrderDate))  as fecha  from Orders
where OrderDate between '1997-01-01' and  '1997-06-30' ;


 select OrderDate  from Orders
 where  OrderDate  between '1997-01-01' 
 and  '1997-06-30'

 --seleciona los empleados contratados entre  1992 y 1994 que trabaja en londres

 select * from Employees 

 select EmployeeID from Employees 
 where year( HireDate)>=1992 
 and year( HireDate)<= 1994 
 AND City ='London'

 select* from Employees
 where year( HireDate) between 1992 and  1994  
 AND City ='London'

---pedidos de feltes entre 50 y 200 enviasos a alemania y francia 
select *from Orders;

  select OrderID as [ordenid],OrderDate as [fecha de orde],
  RequiredDate as[fecha de entrega], Freight as [peso],ShipCountry as [ciudad ] from Orders
  where Freight>= 50 and Freight<= 200
  and (ShipCountry = 'France' or  ShipCountry='Germany')

   select OrderID as [ordenid],OrderDate as [fecha de orde],
  RequiredDate as[fecha de entrega], Freight as [peso],ShipCountry as [ciudad ] from Orders
  where Freight between 50 and 200
  and ShipCountry in('France', 'Germany')

  -- seleccionar todos los productos que tengan un precio 
-- entre 50 y  20 dolares o que sean de la categoria 1,2 o 3

select * from Products;

Select ProductName, UnitPrice,CategoryID
from Products
where UnitPrice>= 5 and UnitPrice<= 20 and (CategoryID=1 or CategoryID=2 or CategoryID=3)


Select ProductName, UnitPrice,CategoryID
from Products
where UnitPrice between 5 and  20 or CategoryID in (1,2,3)



Select ProductName, UnitPrice,CategoryID
from Products
where UnitPrice between 5 and  20  and CategoryID in (1,2,3)

-- empleados con numero de trabajador entre 3 y 7 que no trabajan
--en londres ni seattle
select * from Employees 

select EmployeeID as[idempleado],
CONCAT (FirstName,'',LastName)as
[nombre completo],
city as [ciudad] from Employees  where EmployeeID>=3 and EmployeeID<=7
and (city<>'london'and City<>'seattle')

select EmployeeID as[idempleado],
CONCAT (FirstName,'',LastName)as
[nombre completo],
city as [ciudad] from Employees  where EmployeeID>=3 and EmployeeID<=7
and not city in ('london','seattle')


select EmployeeID as[idempleado],
CONCAT (FirstName,'',LastName)as
[nombre completo],
city as [ciudad] from Employees  where EmployeeID between 3 and 7
and (city<>'london'and City<>'seattle')

--clausuala like 
--patrones :
--1.- % ->(porsentaje )reprersenta 0 o mas caracteres en el patron de busquedad 
--2.- _ ->( guion bajo) representa un caracter en el patron  de busquedad 
--3.- [] (corchetes) se utiliza para definir un conjunto de caracteres 
-- buscando cualquiera de ellos  en la posicion especifica 
--4.- [^] ->(corchetes, sento ) se utiliza para buscar carecateres que no estan
--dentro del conjunto especifico 

--Buscar los productos que empizan con C

select* from Products;

select* from Products WHERE ProductName like'C%'
select* from Products WHERE ProductName like'Ch%'

select* from Products WHERE ProductName 
like'Cha%'  and UnitPrice=18

--BUSCAR TODOS LOS PRODUCTOS QUE TERMINEN CON E 

select* from Products WHERE ProductName like'%e'


--selecionar todos los quientes cuyo nombre de empresa contiene  la palabra "co" en cualquier parte 

select * from Customers  where CompanyName like'%co%'

--selecionar los empleadoa cuy nombre comiense con A	y tenga 5 caracteres 

select *from Employees

select  LastName,FirstName from Employees where FirstName like'A_____'
