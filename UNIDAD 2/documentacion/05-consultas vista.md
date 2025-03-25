 ## Views


 ## sintaxis 

 ```sql
/*create view nombreVista
AS
select columnas 
from table 
where condicion 
*/

use Northwind


go  -- go nos ayuda a separa 


create view  Vistacategorias_todas
AS
select CategoryID,CategoryName,[Description],Picture from  Categories
go


select * from Vistacategorias_todas
where CategoryName = 'Beverages'

drop view  Vistacategorias_todas



--cambiar 


alter  view  Vistacategorias_todas
AS
select CategoryID,CategoryName,[Description],Picture 
from  Categories
where CategoryName = 'Beverages'
go


---

 create or alter  view  Vistacategorias_todas
AS
select CategoryID,CategoryName,[Description],Picture 
from  Categories
where CategoryName = 'Beverages'





---crear una vista que permita  solo ver los clientes de mexico y brasil 

select * from Customers

go
create or alter view  VistaClienteslatinos 
AS
select CompanyName ,City, CustomerID,Country  from Customers
where  Country in ('MEXICO','Brazil')

go

GO
select CompanyName ,City,Country

from  VistaClienteslatinos
where City ='Sao Paulo'
order by 2 desc

GO

select * from 
Orders as o
inner join VistaClienteslatinos as vcl
on vcl.CustomerID= o.CustomerID

---crear una vista que  contenga los datos de todas las ordenes de -
--todos los producto, categorias de produxtos , en la order calcular el importe 


create or alter view [dbo].[ vistasordenescompra]
as
select o.OrderID as [numero de orden], o.OrderDate,
o.OrderDate as [fecha de orden] , o.RequiredDate as [fecha de requisiscion],
concat (e.FirstName, '', e.LastName) as [nombre de empleado], cu.CompanyName as [nombre de cliente],
p.ProductName as [nombre de producto], c.CategoryName as [nombre de categoria],
od.UnitPrice as [precio de venta], od.Quantity [cantidad vendida],
(od.Quantity *od.UnitPrice ) as [importe]
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID
inner join Employees as e
on e.EmployeeID = o.EmployeeID

use Northwind

select count(distinct [numero de orden ]) from vistasordenescompra
go
select sum ([cantidad vendida]*[precio de venta]) as [importe total ]
from [ vistasordenescompra]
go

select sum (importe) as [importe total ]
from [ vistasordenescompra]
where year ([fecha de orden] ) between '1995' and '1996'
go

create or alter view vista_ordenes_1995_1996
as
select [nombre de cliente] as 'nombrecliente', 
sum (importe) as [importe total ]
from [ vistasordenescompra]
where year ([fecha de orden] ) between '1995' and '1996'
group by  [nombre de cliente] 
having count(*)>2

create schema rh 

create table rh.tablarh(
id int  primary key, 
nombre nvarchar(50)
)

--vista horizontal 
go
create or alter view rh.viewcategoriasproductos
as
select c.CategoryID, CategoryName,p.ProductID,p.ProductName from 
Categories as c
inner join 
Products as p
on c.CategoryID=p.CategoryID;
go

select * from rh.viewcategoriasproductos

--vista vertical 