-- ejemplo de left join aplicado 
use Northwind
 select * from products_news

 drop table products_news                 --eliminar tabla 

 --cargar full
 insert into products_news
select  p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE()
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

--crea la tabla solo con la estructura 
select  top 0 p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into  products_news
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID


---crear una tabla apartir de una consulta 

select  p.ProductID,p.ProductName,
[cu].CompanyName ,
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into  products_news
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as cu
on [cu].CustomerID = o.CustomerID

--con alias 

select  top 0
0 as [productbk], p.ProductID,p.ProductName as [producto],
[cu].CompanyName  as [customer],
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'

into products_news

from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as [cu]
on [cu].CustomerID = o.CustomerID

select * from products_news


alter table products_news
add constrainr pk_products_news
primary key (productbk) identity(1,1)
--crear la table mediante 

drop  table products_news
select  top 0 p.ProductID,p.ProductName as [producto],
[cu].CompanyName  as [customer],
c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
into products_news
from Products as p
inner join  Categories as c
on p.CategoryID = c.CategoryID
inner join[Order Details] as od
on od.ProductID = p.ProductID
inner join Orders  as o
on o.OrderID = od.OrderID
inner join  Customers as [cu]
on [cu].CustomerID = o.CustomerID


alter table products_news --para cambiar algo en una tabla 
add productbk int not null identity (1,1)


 alter table products_news
 add constraint pk_products_news
 primary key (productbk)
 go

	 insert into products_news
	 (ProductID,producto,customer,CategoryName,UnitPrice,Discontinued,inserted_date)
	select p.ProductID,p.ProductName as [producto],
	[cu].CompanyName  as [customer],
	c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() 
	from Products as p
	inner join  Categories as c
	on p.CategoryID = c.CategoryID
	inner join[Order Details] as od
	on od.ProductID = p.ProductID
	inner join Orders  as o
	on o.OrderID = od.OrderID
	inner join  Customers as [cu]
	on [cu].CustomerID = o.CustomerID

select pn.ProductID, pn.producto, pn.customer, pn.CategoryName, 
pn.UnitPrice, pn.Discontinued, pn.inserted_date,
p.ProductID,p.ProductName
from Products as p
left join 
products_news as pn
on p.ProductID=pn.ProductID
where pn.ProductID is null   --- buscar los nuevos 


--carga delta 
 insert into products_news
	 (ProductID,producto,customer,CategoryName,UnitPrice,Discontinued,inserted_date)
	select p.ProductID,p.ProductName as [producto],
	[cu].CompanyName  as [customer],
	c.CategoryName, od.UnitPrice,p.Discontinued, GETDATE() as 'inserted_date'
	from Products as p
	left join  Categories as c
	on p.CategoryID = c.CategoryID
	left join[Order Details] as od
	on od.ProductID = p.ProductID
	left join Orders  as o
	on o.OrderID = od.OrderID
	left join  Customers as [cu]
	on [cu].CustomerID = o.CustomerID
	left join products_news as pn
	on pn.ProductID=p.ProductID
	where pn.ProductID is null

	select *from products_news as pn
	where pn.producto in ('guaracha sabrosona ','elote feliz')

	select top 10 *
	into products2
	from Products


	 select * from  Products
	 select * from products2

	  select * from  Products as p1
	  inner join products2 as p2
	  on p1.ProductID =p2.ProductID

	  
	  select * from  Products as p1
	  left join products2 as p2
	  on p1.ProductID =p2.ProductID

	  select * from Products


	  	  
	  select * from  Products as p1
	  right join products2 as p2
	  on p1.ProductID =p2.ProductID