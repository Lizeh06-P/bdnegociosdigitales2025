--informacion del cliente y pedidos 
--vista 

use Northwind
select * from Customers

select * from Orders

 create  or alter  view  clientepedido
 as 
 select  c.CustomerID as 'id' ,c.Address as 'direccion'
 ,c.ContactName'contacto nombre',c.City 'ciudad ',o.OrderDate[dia de la orden] ,o.RequiredDate[salida de orde],
 o.ShippedDate[orde entregada],o.Freight'peso'
 from  Customers as c
 inner join Orders as o 
on c.CustomerID=o.CustomerID

select * from  clientepedido

--vista 2 detalle de pedido con informe del producto y categoria 
--objectivo crear una vista qe muestre los detalles de los pedidos incluyendo el nombre del 
--produxcto la cantidad ordenad ,el precio unitario, la categoria del producto
-- el importe el producto,cantudad vendida , peso el importe 

select * from Productoycategoria
 create  or alter  view  Productoycategoria
 as 
 select o.OrderDate[orden del dia ],o.Freight'peso',o.RequiredDate[dia entrega ], p.ProductName'nombre pedido',
 p.UnitsInStock'unida stock',p.UnitPrice'cantida ', p.CategoryID 'categoria id',od.UnitPrice'unida de precio'
 ,c.CategoryName'categoria nombre ',c.Description'descripcion '
 from Orders as o
 inner join [Order Details] as od
 on o.OrderID= od.OrderID
 inner join Products as p
 on od.ProductID=p.ProductID
 inner join Categories as c
 on p.CategoryID  =c.CategoryID
 
 select * from Orders
 select * from [Order Details]
 select * from  Products
 select * from Categories


--3realiza un store procedure que permita registrar nuevo pedidos
--nombre del procedimiento sp_RegistrarNuevoPedido


select *from Customers


create or alter proc  sp_RegistrarNuevoPedido
@CustomerID nvarchar(5), @EmployeesID int,
@OrderDate datetime,@RequiredDate datetime,
@ShipVia int, @Freight money
as 
begin
	if exists (select 1 from Customers where CustomerID =@CustomerID ) -- verificamos si el pedido existe
	begin
	print 'el pedido ya existe'
	return
	end
	if not exists (select 1 from Employees where EmployeeID = @EmployeesID)  -- verificamos si el cliente existe
	begin
	print 'el empleado ya existe'
	return
	end  

	if not exists (select 1 from Orders where OrderID = @RequiredDate)  -- verificamos si el cliente existe
	begin
	print 'es posterior a la fecha de pedido '
	return
	end  
	begin try
	-- se inserto un pedido

	insert into fecha
	values(@CustomerID,  @EmployeesID ,@OrderDate ,@RequiredDate,@ShipVia , @Freight )
	update requerimientofecha 
	set OrderDate = OrderDate - @RequiredDate
	where @OrderDate = @RequiredDate and @CustomerID =@RequiredDate;
	end try
	begin catch
	print 'Error al actualizar datos'
	return;
	end catch
end;

	exec  sp_RegistrarNuevoPedido @CustomerID = VINET;