# ejercicio de pedidos  con store procedure 


--este ejecrcicio permite realizar un predido verifica si el pedido no esiste si hay suficiente   store

-Realizar un pedido 
-validar que el pedido  no exista 
-validar que el cliente exista ,que el empleado exista  y producto exista 
-validar que la cantidad a vender tenga suficiente stock
-insertar el pedido  y calcular el importe (multiplicando el stock precio del producto
-por la cantidad vendida )
-actualizar el sock del productrestando el stock  menos  la cantidad vendid

```sql
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

## pruebas 
