use BDEJEMPLO2
--1pedidos realizados entre 1990-01-01 y 1990-12-31 con numero de pedido , el nombre del cliente y el importe 
select c.Empresa, p.Num_Pedido, p.Importe, p.Fecha_Pedido   from  Clientes  as c
inner join Pedidos as p
on c.Num_Cli = p.Cliente
where p.Fecha_Pedido between  '01-01-1990'and '1990-12-31'

--2Representantes contratados entre 1988-01-01 y 1990-12-31 con detalles del nombre del representante 

select Num_Empl,Nombre , Fecha_Contrato 
from  Representantes as R 
where Fecha_Contrato between '01-01-1988'and '1990-12-31'

--3productos con id en 2A44L,41004,2A44G con  detalles del pedidos (describe numero de pedidos )

select p.Id_producto,p.Descripcion from Productos as p 
inner join Pedidos as pe 
on p.Id_fab = pe.Fab where  p.Id_producto between '2A44l'  and '41004 , 2A44G '



--4Representantes con ventas totales mayores a 10000, con detalle de oficina  (Nombre ciudad  y total de ventas)

select r.Nombre,o.Ciudad , p.Importe from  Representantes as R
INNER JOIN  Oficinas as o 
on  r.Num_Empl = o.Jef
inner join Pedidos as p
on  r.Num_Empl = p.Rep
where p.Importe>10000

--5Pedidos con detalles de clientes ,representante y productos 
--(numero de pedido,cliente,nombre,nombre de representante,y la descripcion del producto )

select pe.Num_Pedido,c.Num_Cli,c.Empresa,r.Nombre,pr.Descripcion from Representantes as r 
inner join Clientes as c
on r.Num_Empl = c.Rep_Cli
inner join  Pedidos as pe
on c.Num_Cli = pe.Cliente
inner join Productos as pr
on pr.Id_fab = pe.Fab


--6oficinas con sus jefes  y total de  de ventas (ciudad,nombre del jefe y total de ventas )


 select o.Ciudad,r.Jefe ,pe.Importe from Oficinas as o
 inner join Representantes as r
 on o.Oficina=r.Oficina_Rep
inner join Pedidos as pe
on r.Num_Empl =pe.Rep
group by o.Ciudad,r.Jefe ,pe.Importe


--7pedidos  con detalles a clientes  y productos,ordenados por mas alto 
--(numero de pedido, empresa ,descripciom ,importe )

select pe.Num_Pedido,c.Empresa,pe.Importe,pr.Descripcion  from  Clientes as  c
inner join Pedidos as pe
on c.Num_Cli = pe.Cliente
inner join Productos as pr
on pr.Id_fab = pe.Fab



--8clientes con mas de 3 pedidos 
select r.Nombre, o.Oficina, c.Empresa  from Oficinas as o
inner join Representantes as r
on o.Oficina = r.Jefe
inner join Clientes as c
on r.Num_Empl= c.Rep_Cli







--9



--10