--funciones de cadena 
--las funciones de cadena permite manipular tipos de datos 
--como varchar ,nvarchar,char,nchar

--funcion len ->devuelve la longitud de una cadena 

--declaracionn de variable  PASCAL

DECLARE @texto varchar (50)='hola,mundo!'

declare @numero int;
set @numero=10;
print @numero

--obtener el tamaño de la cadena almacenada en el texto 
DECLARE @texto varchar (50)='hola, mundo!';
select len(@texto) as [Longitud]

select CompanyName ,len(CompanyName) from Customers



DECLARE @texto varchar (50)='hola, mundo!';
--funcion left extrae un numero espesifico de caracteres desde el inicio de la cadena 
select left (@texto,4) as inicio 



DECLARE @texto varchar (50)='hola, mundo!';
--rigth->estrae un determonado numero de caracteres de la cadena 
select right(@texto, 6) as final



DECLARE @texto varchar (50)='hola, mundo!';
--substring ->estrae una parde de la cadena,donde el primer paramatro es la pocicion inicial
-- y tercer parametro es el reccorrido 

select  SUBSTRING (@texto,7,5)  



DECLARE @texto2 varchar (50)='hola, mundo!';
--replace ->remplaza una subcadena por otra 
--replace(string_expression,string_pattern,string_replacement)

select REPLACE(@texto2,'mundo','amigo')


DECLARE @texto2 varchar (50)='hola, mundo!';
--charIndex te da en que pocision esta el texto 
select CHARINDEX('mundo',@texto2)



--upper->convierte una cadena en mayuscula  select upper (@texto2) as mayusculas 


DECLARE @texto2varchar (50)='hola, mundo!';
SELECT CONCAT
(LEFT(@Texto2,6),
UPPER( SUBSTRING (@texto2,7,5)), 
right(@texto2,1)
) as textonuevo





select CompanyName, len(CompanyName) as 'numero de cadena ',
 left (CompanyName,4) as inicio ,
right(CompanyName, 6) as final,
SUBSTRING(CompanyName,7,4) as'subcadena'
from Customers

update Customers 
set  CompanyName =upper(CompanyName)
where Country in ('mexico,germany')

select * from Customers


--trim ->quita espacio en blanco de una cadena 
select trim (' test ') as result;

declare @texto2 varchar (50) ='     hola mundo!        ';
select ltrim(@texto2) as result;


--crear un store procedure para aselecionar todos lod clientes 

 create or  alter procedure spu_mostrar_cliente 
 as 
 begin 
 select * from Customers;
 end;
 go

--- ejecutar store en tansact
exec spu_mostrar_cliente

