--consulta de agregado 
--nota solo devuelven un solo registro cuando no tiene 
--sum, avg ,count,count(*),max y min 


--cuantos clientes tengo 

select * from Customers

select count(*) as 'numero de cliente' from Customers

--cuantas regiones hay 


select count(Region) from Customers 
 

select count(Region) from Customers 
where Region is null 

select count(*) from Customers 
where Region is null 



select count (distinct region) 
from Customers  
where Region is not  null 


select distinct region
from Customers  
where Region is not  null 
order by Region asc 