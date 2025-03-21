--1. Vista de los pedidos de un cliente con sus detalles
--Esta vista puede mostrar todos los pedidos realizados por cada cliente,
-- junto con la información del representante y producto



--meztli

 create or alter  view  pedidosclientes 
 as 
 select c.Num_Cli,c.Rep_Cli,c.Empresa,p.Num_Pedido, p.Producto,r.Nombre,r.Oficina_Rep
 from clientes  as c
 inner join Pedidos as p
 on  c.Num_Cli = p.Cliente
 inner join  Representantes as r
 on p.Rep = r.Num_Empl





 --chat

 CREATE OR ALTER VIEW pedidosclientes1 AS
SELECT 
    c.Num_Cli, 
    c.Rep_Cli, 
    c.Empresa, 
    p.Num_Pedido, 
    p.Producto, 
    pr.Descripcion AS Producto_Descripcion, -- Descripción del producto
    r.Nombre AS Representante,
    r.Oficina_Rep
FROM 
    Clientes AS c
INNER JOIN 
    Pedidos AS p ON c.Num_Cli = p.Cliente
INNER JOIN 
    Representantes AS r ON c.Rep_Cli = r.Num_Empl -- Relación correcta con Rep_Cli
INNER JOIN 
    Productos AS pr ON p.Producto = pr.Id_producto; -- Relacionar con Productos para obtener la descripción


	 select * from  pedidosclientes

	 select * from  pedidosclientes1

	-- Vista para ver los productos disponibles con su información

-- Crear o modificar la vista para mostrar los productos con información relevante
CREATE OR ALTER VIEW vw_Productos
AS
SELECT 
    p.Id_fab,
    p.Id_producto,
    p.Descripcion,
    p.Precio,
    p.Stock
FROM Productos p;

SELECT * FROM vw_Productos;


-- Crear o modificar el procedimiento almacenado para actualizar el stock de un producto
CREATE OR ALTER PROCEDURE spu_ActualizarStock
    @Id_fab CHAR(3),            -- Parámetro para el fabricante
    @Id_producto CHAR(5),       -- Parámetro para el id del producto
    @Cantidad INT               -- Parámetro para la cantidad a agregar o restar
AS
BEGIN
    -- Verificamos si el producto existe
    IF NOT EXISTS (SELECT 1 FROM Productos WHERE Id_fab = @Id_fab AND Id_producto = @Id_producto)
    BEGIN
        PRINT 'El producto no existe.'
        RETURN
    END

    -- Actualizamos el stock del producto
    UPDATE Productos
    SET Stock = Stock + @Cantidad
    WHERE Id_fab = @Id_fab AND Id_producto = @Id_producto;

    PRINT 'Stock actualizado correctamente.'
END;


EXEC spu_ActualizarStock 
    @Id_fab = 'ABC',           -- Código del fabricante
    @Id_producto = '12345',    -- Código del producto
    @Cantidad = 10;            -- Cantidad a agregar al stock (puede ser negativa para restar)

	 --store 
	--- Ejemplo de Stored Procedure para realizar un pedido:
---Este procedimiento recibe los parámetros necesarios para realizar un pedido, valida la existencia del 
--cliente, el producto y la cantidad, y luego inserta la información en la tabla Pedidos.

CREATE OR ALTER PROCEDURE spu_RealizarPedido
    @numPedido INT, 
    @cliente INT,
    @repre INT, 
    @fab CHAR(3), 
    @producto CHAR(5), 
    @cantidad INT
AS
BEGIN
    -- Verificar si el pedido ya existe
    IF EXISTS (SELECT 1 FROM Pedidos WHERE Num_Pedido = @numPedido)
    BEGIN
        PRINT 'El pedido ya existe';
        RETURN;
    END

    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM Clientes WHERE Num_Cli = @cliente)
    BEGIN
        PRINT 'El cliente no existe';
        RETURN;
    END

    -- Verificar si el representante existe
    IF NOT EXISTS (SELECT 1 FROM Representantes WHERE Num_Empl = @repre)
    BEGIN
        PRINT 'El representante no existe';
        RETURN;
    END

    -- Verificar si el producto existe
    IF NOT EXISTS (SELECT 1 FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto)
    BEGIN
        PRINT 'El producto no existe';
        RETURN;
    END

    -- Verificar si la cantidad es mayor que cero
    IF @cantidad <= 0
    BEGIN
        PRINT 'La cantidad no puede ser cero o negativa';
        RETURN;
    END

    -- Verificar si hay suficiente stock
    DECLARE @stockValido INT;
    SELECT @stockValido = Stock FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto;

    IF @cantidad > @stockValido
    BEGIN
        PRINT 'No hay suficiente stock';
        RETURN;
    END

    -- Obtener el precio del producto
    DECLARE @precio MONEY;
    SELECT @precio = Precio FROM Productos WHERE Id_fab = @fab AND Id_producto = @producto;

    -- Calcular el importe total
    DECLARE @importe MONEY;
    SET @importe = @cantidad * @precio;

    -- Insertar el pedido
    BEGIN TRY
        INSERT INTO Pedidos (Num_Pedido, Fecha_Pedido, Cliente, Rep, Fab, Producto, Cantidad, Importe)
        VALUES (@numPedido, GETDATE(), @cliente, @repre, @fab, @producto, @cantidad, @importe);

        -- Actualizar el stock del producto
        UPDATE Productos
        SET Stock = Stock - @cantidad
        WHERE Id_fab = @fab AND Id_producto = @producto;
        
        PRINT 'Pedido realizado con éxito';
    END TRY
    BEGIN CATCH
        PRINT 'Error al realizar el pedido';
        RETURN;
    END CATCH
END;
  
exec spu_RealizarPedido @numPedido = 113071, @cliente = 2117, @repre = 106, @fab = 'ACI', @producto = '4100X', @cantidad = 20;
