/*2. Crear un procedimiento almacenado al cual le enviamos 2 números decimales y retorna el promedio,
recuerde declarar el resultado como variable output:*/
create procedure promedio 
@num1 float, 
@num2 float,
@promedio float output
as
declare @suma as float
set
@suma=@num1+@num2
begin 
select 
@promedio=@suma/2

end 
drop procedure promedio

declare @resultado float
exec promedio 4.2,5.2,@promedio=@resultado output 
print 'el promedio es ' +convert(varchar(20),@resultado)

/*Crear un procedimiento que imprima los números impares que se encuentran del 1 al 10, usar el ciclo
While para esto o solo crear el script del ciclo, como ud. Considere mejor*/

create procedure numimpar
as
declare @num as int
set @num =1
while @num<=10
begin
	
	if @num%2!=0
	print @num
	set @num=@num+1
end 

exec numimpar
/*. Realizar un script sencillo mediante el ciclo while que imprima Hola 15 veces.*/
create procedure hola15veces
as
declare @i as int 
set @i =1 
while @i<=15
begin
	print convert(varchar(20),@i)+'. hola'
	set @i=@i +1
end 

drop procedure hola15veces
exec hola15veces

/* Usando las tablas de Almacén, realizar un script (no procedimiento), que mientras el promedio de los
precios de los productos sea menor que $2000.00 permita aumentar dichos precios en 10%, hacer esta
actualización solo hasta que algún precio de producto supere el monto de $5000.00, si pasa entonces
que interrumpa el ciclo, cuando se termine de actualizar dichos valores mostrar el mensaje “ Ya no hay
más precios que actualizar”.*/use ALMACENwhile (SELECT AVG(PRECIO) from PRODUCTO)<$2000begin	update PRODUCTO set PRECIO=(PRECIO+(PRECIO*0.10))	if(select max(precio) from PRODUCTO)>$5000	break	else 	continue end print 'Ya no hay más precios que actualizar'create table libros(
 codigo int identity,
 titulo varchar(40),
 autor varchar(30),
 editorial varchar(20),
 precio decimal(5,2),
 primary key(codigo)
); 
insert into libros values ('Uno','Richard Bach','Planeta',15);
insert into libros values ('Ilusiones','Richard Bach','Planeta',12);
insert into libros values ('El aleph','Borges','Emece',25);
insert into libros values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
insert into libros values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
insert into libros values ('Puente al infinito','Richard Bach','Sudamericana',14);
insert into libros values ('Antología','J. L. Borges','Paidos',24);
insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
insert into libros values ('Antología','Borges','Planeta',34); 
/*6.4 Eliminamos la tabla "ofertas" si existe y la creamos con los mismos campos
de la tabla "libros":*/

if object_id('ofertas')is not null 
drop table ofertas;
select * into ofertas from libros


/*6.5 Crear un procedimiento llamado sp_promo para que seleccione el título,
autor, editorial y los libros cuyo precio no superan los 30 dólares*/

create procedure sp_promo 
as begin
select titulo, autor, editorial, precio from libros where precio<30
end

exec sp_promo 



/*6.6 Ingresar en la tabla "ofertas" el resultado devuelto por el procedimiento
almacenado "sp_promo
*/
insert into ofertas exec sp_promo
/* 6.7 Visualicen el contenido de la tabla ofertas*/select * from ofertas/*Realizar un trigger que realice la misma función que el ejemplo anterior, pero una vez que se ingrese una sucursal
nueva*/


