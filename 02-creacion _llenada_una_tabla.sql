
--creacion de la base de datos  tienda1

--crear base de datos tienda1

create database tienda1;

--utilizar una base de datos 

use tienda1;
--sql- LDD
--crear tabla  categoria 

create table categoria(
categoriaid int not null,
nombre  varchar (20) not null,
constraint pk_categoria
primary key (categoriaid),
constraint unico_nombre
unique (nombre)


);


--SQL - LMD
--AGREGAR REGOSTRO DE LA TABLA CATEGORIA 
insert into categoria
values(1,'carnes frias');

insert into categoria (categoriaid,nombre)
values(2,'Linea Blanca');

insert into categoria (nombre,categoriaid)
values('vinos y licores', 3);

insert into categoria 
values (4,'Ropa'),
       (5,'Dulces'),
	   (6,'Lacteos');
insert into categoria(nombre, categoriaid)
values ('panaderia', 7),
        ('Zapateria',8),
		('Jugueteria', 9);
insert into categoria
values(10,'panaderia');

select * from categoria;
 --tablas productos 
 create table producto1(
 productoid int not null, 
 nombreproducto varchar(20) not null,
 descripcion varchar(80)null,
 precio money not null, 
 existencia int not null,

 categoriaid int  null,
 constraint pk_producto1
 primary key(productoid),
 constraint unico_descripcion 
 unique(nombreproducto),
 constraint chk_precio
 check(precio>0.0 and precio<=1000),
 constraint chk_existencia
 check(existencia>0 and existencia<=200),
 constraint fk_categoria_producto1
 foreign key (categoriaid)
 references categoria(categoriaid)

 
 )
 select *from categoria
 insert into producto1
values(1,'miguelito','dulces sano para la lombris',34.5,45,5);

 insert into producto1
values(3,'plancha','plancha facil elsuit',256.3,134,2)


select *from producto1
where categoriaid=5

  select *from categoria 
