create database LAB5IDENTITYuse LAB5IDENTITYcreate table articulos(
 codigo int identity,
 nombre varchar(20),
 descripcion varchar(30),
 precio smallmoney,
 cantidad tinyint default 0,
 primary key (codigo)
);

insert into articulos (nombre, descripcion, precio,cantidad)
 values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio)
 values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio)
 values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad)
 values ('teclado','ingles Biswal',100,50);


 create table restaurantes(
 codigo int identity(1,2),
 nombre varchar(20),
 decripcion varchar(20)
 )

 