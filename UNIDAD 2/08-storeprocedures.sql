--store procedure 

--crear un store procedure para aselecionar todos lod clientes 

 create or  alter procedure spu_mostrar_cliente 
 as 
 begin 
 select * from Customers;
 end;
 go

--- ejecutar store en tansact
exec spu_mostrar_cliente

--crear un sp que muestre los clientes por pais 

create or alter proc spu_customersporpais
--parametros 

@pais nvarchar(15)            --parametro de entrada 
,@pais2 nvarchar(15)  
as 
begin 
select *from Customers
where Country in  (@pais,@pais2);
end;

exec spu_customersporpais 'brazil' ,'Mexico'

GO
--EJECUTA STORE PROCEDURE

DECLARE @p1 nvarchar(15) = 'mexico';     
DECLARE @p2 nvarchar(15) = 'germany';
 exec spu_customersporpais @p1, @p2;
 GO
 --generar un reporte que permita visualizar los datos de compra de un
 -- determinado cliente en un rango de fecha mostrando,
 --el monton total de compra por producto mediante sp.


 select * from  Customers

create or alter proc spu_informe_Ventas_clientes
@nombre nvarchar(40) = 'Berglunds snabbk�p', --parametro de engtrada con valor deffaul
@fechainicial datetime,
@fechafinal datetime 
as
begin
select [nombre de producto],  sum (importe) as [monto total]
from vistasordenescompra
where [nombre de cliente] = @nombre
and [fecha de orden] between @fechainicial and @fechafinal
group by [nombre de producto],[nombre de cliente]
end;
go


use Northwind
 select * from  Customers

 --ejecucuion de un store con paramtros de entrada 

 exec spu_informe_Ventas_clientes 'Berglunds snabbk�p',
                                       '1996-07-04','1997-01-01'


--ejecucuion de un store con paramtros en diferentes posicion 

 exec spu_informe_Ventas_clientes  @fechainicial=  '1996-07-04',
                                    @fechafinal='1997-01-01'
                                     

exec spu_informe_Ventas_clientes @fechafinal = '1997-01-01',
                                  @nombre = 'Berglunds snabbk�p',
								   @fechainicial = '1996-07-04'





--store procidure con parametro de salida 

create or alter proc  spu_obtener_numero_clientes
@customerid nchar (5),
@totalCustomers int output-- parametros de salida
as
begin
select @totalCustomers = count (*)from Customers
    where  CustomerID =@customerid
end;
go

declare @numero int;

exec spu_obtener_numero_clientes @customerid = 'ANATR',

@totalcustomers = @numero output;
print @numero;



declare @numero int;

exec spu_obtener_numero_clientes @totalcustomers = @numero output;
print @numero;
go

declare @numero int;
exec spu_obtener_numero_cliente @totalCustomers = @numero output;            ---sintaxia alrebes 
print @numero;
go




 --vista 
 use Northwind


create or alter proc spu_customersporpais
--parametros 
@pais nvarchar(15)            --parametro de entrada 

as 
begin 
select *from Customers
where Country in  (@pais);
end;
exec spu_customersporpais 'germany'
