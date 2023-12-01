/*1. Crear un procedimiento que indique e imprima si un número es par o impar */

create procedure numpar_impar
@num1 int
as
begin
if(@num1%2=0)

	print 'el numero es par'
	
else
	print 'el numero es impar'
end 

exec numpar_impar 3

/*2. Realizar un procedimiento que proyecte los datos de la tabla país, donde al dar un código de país si se
encuentra que lo actualice con el que se ingresa, sino que lo inserte como un registro nuevo.*/
/*Crear una BD y dentro de ella una tabla llamada PAIS, abajo ejemplo, pero ustedes deben
colocar otros datos.*/
create database continente
use continente
create table pais(
Nombre varchar(30),
Codigo varchar(30),
Capital varchar(30))

insert into pais values('Panamá','111','Panamá')
create procedure pais_codigo
@pais varchar(30),
@codigo varchar(30),
@Capital varchar(30)
as 
begin 
if exists (select*from pais where Codigo=@codigo)
begin
	update pais set Nombre=@pais
	update pais set Codigo=@codigo
	update pais set Capital=@capital
end
else 
	insert into pais values(@pais,@codigo,@Capital)
end
exec pais_codigo 'Panama','222','Panamá'
select* from pais
/*1. Usando una instrucción select con una estructura CASE, implementar un script sencillo que muestre un
día de la semana x (en letras), dado un parámetro en número, Ej.: si pongo 1 entonces es ‘Lunes’ y así
hasta el domingo, colocar un valor inicial a la variable del día con el valor de 4. */

declare @dia int=5
select case @dia
when 1 then 'lunes'
when 2 then 'Martes'
when 3 then 'Miercóles'
when 4 then 'Jueves'
when 5 then 'Viernes'
when 6 then 'Sabado'
when 7 then 'Domingo'
end as Dia_semana

/*. Usando la tabla de Almacén, crear una instrucción select con una estructura CASE, implementar un script
sencillo que muestre el código del producto, la descripción, el modelo. Y que muestre la respuesta del
CASE con una variable llamada SIGLAS, donde coloque la primera letra de la descripción, por ejemplo, si
es Laptop, que ponga L y así con los demás y en de otro modo no está en venta*/
use almacen

select idproducto,DESCRIPCCIÓN,modelo,
case 
	when DESCRIPCCIÓN Like'Laptop'Then 'L'
	when DESCRIPCCIÓN Like 'Panel' Then 'P'
	When DESCRIPCCIÓN like 'Servidor' Then 'S'
	else 'NO ESTA A LA VENTA'
end as Siglas
from PRODUCTO

