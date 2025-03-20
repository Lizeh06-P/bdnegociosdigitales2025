---Realizar un pedido 
--validar que el pedido  no exu=ista 
--validar que el cliente exista ,que el empleado exista  y producto exista 
--validar que la cantidad a vender tenga suficiente stock
--insertar el pedido  y calcular el importe (multiplicando el stock precio del producto
--por la cantidad vendida )
--actualizar el sock del product(restando el stock  menos  la cantidad vendida




create or alter proc spu_RealizarPedido
@numPedido int, @cliente int,
@repre int, @fab char(3), 
@ Producto char(5), @cantidad int
as 
begin
	if exists (select 1 from Pedidos where Num_Pedido = @numPedido) -- verificamos si el pedido existe
	begin
	print 'el pedido ya existe'
	return
	end 
	if	not exists (select 1 from Clientes where Num_Cli = @cliente) or -- verificamos si el cliente existe
		not exists (select 1 from Representantes where Num_Empl = @repre) or
		not exists (select 1 from Productos where Id_fab= @fab and Id_producto = @proceducto) 
	begin
	print 'el pedido ya existe'
	return
	end 

	if @cantidad <= 0
	begin 
		print 'la cantidad no puede ser 0 o negativo'
		return ;
	end
	declare @stockvalido int
	select @stockvalido= Stock from Productos
	where Id_fab = @fab and Id_producto = @proceducto

		if @cantidad > @stockvalido
	begin 
		print 'no hay suficiente stock'
		return;
	end
	declare @precio money
	declare @importe money 
	select @precio = Precio  from   Productos where Id_fab = @fab  and Id_producto = @proceducto
	
	set @importe= @cantidad * @precio

	begin try
	-- se inserto un pedido

	insert into Pedidos
	values(@numPedido, GETDATE(), @cliente, @repre, @fab, @ Producto, @cantidad,@importe)

	update Productos
	set Stock = Stock - @cantidad
	where Id_fab = @fab and Id_producto = @proceducto;

	end try
	begin catch
	print 'Error al actualizar datos'
	return;
	end catch
end;




 
 exec spu_realizar_pedido @numPedido = 113071, @cliente = 
 2117, @repre = 111, @fab = 'ACI', @Producto = '4100X', @cantidad = 20;

 exec spu_realizar_pedido  @numPedido = 113070,@cliente =2117,
 @repre =106, @fab ='ret',
 @producto = '2A44L', @cantidad =20


  exec spu_realizar_pedido  @numPedido = 112920 ,@cliente =2000,
 @repre =106, @fab ='ret',
 @producto = '2A44L', @cantidad =20

 SELECT * FROM Pedidos