use ALMACEN

/*Se desea proyectar el nombre, apellido, código del vendedor y categoría de vendedor, deben agruparlo por
categoría donde la misma sea igual a A-3*/


select NOMBRE,APELLIDO,IDVENDEDOR, CATEGORIA  from VENDEDOR 
where CATEGORIA = 'A-3'
group by NOMBRE,APELLIDO,IDVENDEDOR, CATEGORIA

--Seleccionar la descripción y precio de los productos, agrupándolos por descripción donde el precio sea mayor o igual a 579.
select DESCRIPCCIÓN, PRECIO from PRODUCTO
where precio >= 579
group by DESCRIPCCIÓN, PRECIO


select DESCRIPCCIÓN, PRECIO from PRODUCTO
group by DESCRIPCCIÓN, PRECIO
having PRECIO>=579

--Necesitamos conocer la descripción y el total de los precios agrupados por descripción, de los productos LAPTOP y PANEL.

select DESCRIPCCIÓN,SUM(PRECIO)AS 'TOTAL' from PRODUCTO
group by DESCRIPCCIÓN
having DESCRIPCCIÓN='LAPTOP' OR DESCRIPCCIÓN='PANEL'

CREATE PROCEDURE paSaludo
AS
BEGIN
PRINT 'Hola Mundo'
END
go
paSaludo

exec paSaludo create procedure pa_libros_autor
 @autor varchar(30)
as
 select titulo, editorial,precio
 from libros where autor= @autor; /*Crear un procedimiento que recibe el nombre de una marca como parámetro para mostrar todos los
productos asociados a esa marca más su descripción y precio, usar tabla almacén.*/ create procedure mostrar_info @MARCA varchar(30) as  select DESCRIPCCIÓN,PRECIO from PRODUCTOwhere MARCA=@MARCA;exec mostrar_info 'DELL' /*Crear un procedimiento almacenado para sumar dos números, que imprima el resultado y que lo convierta
en un varchar de 30*/ CREATE PROCEDURE SUM_DOS_NUM
 @num1 int,@num2 int 
 as 
 begin 
 declare  @suma int
 set @suma=(@num1+@num2)
 print'La suma de los numeros es '+cast(@suma as varchar(30))
 end
 drop procedure SUM_DOS_NUM
 exec SUM_DOS_NUM 9,1

 CREATE PROCEDURE DIV_DOS_NUM
 @num1 int,@num2 int 
 as 
 begin 
 declare  @Division int
 set @Division=(@num1/@num2)
 if(@num2=0)
 begin 
 print'error no puede ser cero'
 end
 print'La division es  '+cast(@Division as varchar(30))
 end
 exec DIV_DOS_NUM 10,0
 drop procedure DIV_DOS_NUM

 /*Usar alguna de las tablas dadas de Almacén y crear un procedimiento almacenado que inserte una línea en
alguna de sus tablas, usar como guía lo siguiente:*/

create procedure insertarCliente
@idcliente varchar(10),@apellido varchar(20),@nombre varchar(20),@ciudad varchar(30),@email varchar(40),@direccion varchar(30),@tipo_cliente varchar(20),@idVendedor varchar(20),@Fechanac date
as
insert into CLIENTE
values(@idcliente,@apellido,@nombre,@ciudad,@email,@direccion,@tipo_cliente,@idVendedor,@Fechanac)

 exec insertarCliente 'C07','Gonzalez','Christofer','Arraijan','Christ@gmail.com','NuevoArraijan','A1','01','2002/03/02'


