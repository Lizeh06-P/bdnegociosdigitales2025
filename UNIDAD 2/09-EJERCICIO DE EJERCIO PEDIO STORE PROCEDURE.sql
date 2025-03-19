---Realizar un pedido 
--validar que el pedido  no exu=ista 
--validar que el cliente exista ,que el empleado exista  y producto exista 
--validar que la cantidad a vender tenga suficiente stock
--insertar el pedido  y calcular el importe (multiplicando el stock precio del producto
--por la cantidad vendida )
--actualizar el sock del product(restando el stock  menos  la cantidad vendida

 create or  alter procedure spu_realizar_pedido
 @numPedido int,@cliente int,
 @repre int , @fab char(3),
 @producto char (5), @cantidad int
 as 
 begin 
if exists (select 1 from  Pedidos where Num_Pedido = @numPedido)
begin
print ('el pedidO ya existe')
return 
end

if exists (select 1 froM Clientes where Num_Cli = @cliente) OR NOT 
exists(select 1 froM Representantes where Num_Empl = @repre) OR NOT  exists 
(select 1 froM Productos where Id_fab = @fab and Id_producto = @producto)

begin
print ( 'los datos no son validos ')
return 
end
IF @cantidad <=0
beGIN  
PRINT 'LA CANTIDAD O PUEDE SER NEGATIVO'
RETURN;
END 
DECLARE @stockvalido int 
select  @stockvalido from Productos where Id_fab = @fab and Id_producto =@producto
 IF  @cantidad> @stockvalido
 BEGIN
 PRINT 'NO HAY SUFICIENTE STOCK'
 RETURN;
 END 
 declare  @precio money 
 declare @importe  money 
 select @precio= @precio from Productos where Id_fab = @fab and Id_producto = @producto
 set @importe = @cantidad *@precio

 begin try
 --se inserts un perdido
	insert into pedidos
	values(@numPedido, GETDATE(), @cliente, @repre, @fab, @producto, @cantidad,@importe)

	update productos
	set Stock = Stock - @cantidad
	where Id_fab = @fab and Id_producto = @producto;

	end try
	begin catch
	print 'Error al actualizar datos'
	return;
	end catch
end;



 use Northwind








 
 exec spu_realizar_pedido  @numPedido = 113071,@cliente =2117,
 @repre =111, @fab ='ACI',
 @producto = '4100X', @cantidad =20


 exec spu_realizar_pedido  @numPedido = 113070,@cliente =2117,
 @repre =106, @fab ='ret',
 @producto = '2A44L', @cantidad =20


  exec spu_realizar_pedido  @numPedido = 112920 ,@cliente =2000,
 @repre =106, @fab ='ret',
 @producto = '2A44L', @cantidad =20

 SELECT * FROM Pedidos