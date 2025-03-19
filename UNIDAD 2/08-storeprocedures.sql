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
@nombre nvarchar(40) = 'Berglunds snabbköp', --parametro de engtrada con valor deffaul
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

 exec spu_informe_Ventas_clientes 'Berglunds snabbköp',
                                       '1996-07-04','1997-01-01'


--ejecucuion de un store con paramtros en diferentes posicion 

 exec spu_informe_Ventas_clientes  @fechainicial=  '1996-07-04',
                                    @fechafinal='1997-01-01'
                                     

exec spu_informe_Ventas_clientes @fechafinal = '1997-01-01',
                                  @nombre = 'Berglunds snabbköp',
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




---CREAR UN STORE PROCEDURE QUE PERMITA SABER SI UN ALUMNO APROBO O REPROBO 

CREATE OR ALTER PROC spu_comparar_calificacion
@calif decimal (10,2)--parametro de entrada 
as 
begin 

if @calif >=0 and @calif<= 10

begin 
       if @calif>=8
           print 'calificacion es aprobatoria'
           else 
              print 'la calificacion es reprobatoria '

       end
	   else 
	       print 'calificacion no valida '
 end;
 go

 exec spu_comparar_calificacion @calif =

 --crear un sp que permite verificar siun  cliente existe antes de 
 --devolver su informacion 

 create or alter  proc spu_obtener_cliente_siexiste 
 @numeroCliente nchar(5)
 as
 begin

 if  exists(select 1 frOM Customers where CustomerID = @numeroCliente)

 select *from  Customers where CustomerID = @numeroCliente;
 else 
 print 'el cliente no existe '
 end;
 go

 exec spu_obtener_cliente_siexiste  @numeroCliente ='Arout'

 select * from Customers
 select 1 from Customers where CustomerID ='Arout'

 ---crear un store procedure que permita insertar un cliente ,
 --pero se debe verificar primero que no exista 

 use Northwind

 select *from Customers
create or alter procedure spu_agregar_cliente
@id nchar(5),
@nombre nvarchar (40),
@city nvarchar(15) = 'San Miguel'
as
begin
if exists (select 1 from  Customers where CustomerID = @id)
begin
print ('el cliente ya existe')
return 1
end
insert into Customers (CustomerID, CompanyName)
values(@id, @nombre);
print('cliente insertado exitosamente');
return 0;

end;
go


exec spu_agregar_cliente'ALFKI' ,'Patito de hule '
exec spu_agregar_cliente'ALFKC' ,'Patito de hule '

select * from Customers

go
create or alter procedure spu_agregar_cliente_try_catch
@id nchar(5),
@nombre nvarchar (40),
@city nvarchar(15) = 'San Miguel'
as
begin

begin try 
insert into Customers (CustomerID, CompanyName)
values(@id, @nombre);
print('cliente insertado exitosamente');
 end try

 begin catch
 print ('el cliente ya existe')

 end catch
end;

go
exec spu_agregar_cliente'ALFKD' ,'Muñeca vieja '

--MANEJO DE CICLOS EN STORE 
--IMPRIMIR EL NUMERO DE VECES QUE INDEIQUE EL USUARIO 

CREATE or alter procedure spu_imprimir
@numero int
as 
begin 

if @numero <=0
begin
print ('el numero no puede ser 0 negativo ')
return
end 

declare @i int 
set @i =1
while(@i<=@numero)
begin 
print concat ('numero' , @i)
set  @i =@i +1
end

end;

go

exec spu_imprimir  5