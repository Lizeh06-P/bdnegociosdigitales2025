use BDEJEMPLO2;

--Realizar un trigger que se dispare 
--cuando se inserte un pedido y modifique 
--el stock del producto vendido,
--verificar si hay suficientes stock si no
--se cancela el pedido 

GO

-- Creación del trigger para control de stock
CREATE OR ALTER TRIGGER tg_pedidos_insertar
ON pedidos
AFTER INSERT 
AS
BEGIN
    DECLARE @existencia INT;
    DECLARE @fab CHAR(3);
    DECLARE @prod CHAR(5);
    DECLARE @cantidad INT;

    SELECT @fab = fab, @prod = producto, @cantidad = cantidad 
    FROM inserted;

    SELECT @existencia = stock 
    FROM Productos
    WHERE Id_fab = @fab AND Id_producto = @prod;

    IF @existencia >= @cantidad
    BEGIN 
        UPDATE Productos
        SET stock = stock - @cantidad
        WHERE Id_fab = @fab AND Id_producto = @prod;
    END
    ELSE
    BEGIN 
        RAISERROR('No hay suficiente stock para el pedido', 16, 1);
        ROLLBACK;
    END
END;
GO

-- Verificación de datos actuales
SELECT * FROM pedidos;
SELECT MAX(Num_Pedido) FROM Pedidos;
SELECT * FROM Productos WHERE Id_fab = 'ACI' AND Id_producto = '41001';
GO

-- Código para insertar nuevo pedido (CORREGIDO)
DECLARE @nuevo_num_pedido INT;
SELECT @nuevo_num_pedido = ISNULL(MAX(Num_Pedido), 0) + 1 FROM Pedidos;

DECLARE @importe MONEY;
SELECT @importe = (77 * Precio)  -- 77 es la cantidad que quieres pedir
FROM Productos
WHERE Id_fab = 'ACI' AND Id_producto = '41001';

-- Verificación de stock antes de insertar
DECLARE @stock_actual INT;
SELECT @stock_actual = stock 
FROM Productos 
WHERE Id_fab = 'ACI' AND Id_producto = '41001';

IF @stock_actual >= 77
BEGIN
    INSERT INTO pedidos (Num_Pedido, Fecha_Pedido, cliente, Rep, Fab, Producto, Cantidad, importe)
    VALUES(@nuevo_num_pedido, GETDATE(), 2103, 106, 'ACI', '41001', 77, @importe);
    
    PRINT 'Pedido creado exitosamente con número: ' + CAST(@nuevo_num_pedido AS VARCHAR);
END
ELSE
BEGIN
    PRINT 'Error: No hay suficiente stock. Stock actual: ' + CAST(@stock_actual AS VARCHAR);
END
GO

-- Verificación final
SELECT * FROM Productos WHERE Id_fab = 'ACI' AND Id_producto = '41001';
SELECT * FROM Pedidos WHERE Num_Pedido = (SELECT MAX(Num_Pedido) FROM Pedidos);


--crear un trigger  que cada vez que se elimine un pedido se debe actualizar el stock de los productos  con la cantidad eliminada  



GO
-- Crear el trigger para actualizar stock al eliminar pedidos
CREATE OR ALTER TRIGGER tg_pedidos_eliminar
ON pedidos
AFTER DELETE
AS
BEGIN
 SET NOCOUNT ON;
      BEGIN TRY
        -- Actualizar el stock sumando las cantidades de los pedidos eliminados
        UPDATE p
        SET p.stock = p.stock + d.cantidad
        FROM Productos p
        INNER JOIN deleted d ON p.Id_fab = d.Fab AND p.Id_producto = d.Producto;
        
        PRINT 'Stock actualizado correctamente por eliminación de pedidos.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error al actualizar stock: %s', 16, 1, @ErrorMessage);
        ROLLBACK;
    END CATCH
END;
GO
DELETE  FROM Productos WHERE Id_fab = 'ACI' AND Id_producto = '41001';