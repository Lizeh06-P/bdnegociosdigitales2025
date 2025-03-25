
##
CREAR UN STORE PROCEDURE QUE PERMITA SABER SI UN ALUMNO APROBO O REPROBO 

```sql
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
exec spu_agregar_cliente'ALFKD' ,'Mu�eca vieja '

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