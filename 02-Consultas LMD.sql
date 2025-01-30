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
  select  CustomerID as Clienteid,CompanyName as NombreCompa�ia, City as Ciudad, Country as Pais from Customers where  Country !='germany'
  
select * from Orders;
select OrderDate as 'Fecha de orden',ShipCountry as 'ciudad' from Orders  where not ShipCountry ='Germany'

select *from Orders where ShipCountry = 'Germany';

select *from Orders where not  ShipCountry = 'Germany';

--seleciona clientes de Mexico o usa 

select *from Orders where ShipCountry >='Mexico OR USA';


--EMPLEADOS QUE NACIOERO  ENTRE 1955 Y 1958 Y QUE VIVAN EN LONDRES 

select * from Employees 

 where year(BirthDate)>=1955  and year(BirthDate)<=1958 AND City ='London'


 --selecionar los pedidos con  fletes(Freight) mayor a $100 y enviar a fancia o espa�a
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
  in ('RJ','T�chira')  or ShipRegion is null

  select *from [Order Details]
  --selecionar las ordenes que tengan cantidades de 12,9 o 40 
  --y descuento de 0.15 o 0.05

   select *from [Order Details]

   select OrderID,Quantity,Discount  from [Order Details]
   where Quantity in (12,9,40) and Discount in (0.15,0.05)
  

  --CLAUSULA BETWEEN (ENTRE)

