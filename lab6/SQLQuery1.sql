/*1. Crear un procedimiento que indique e imprima si un n�mero es par o impar */

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

/*2. Realizar un procedimiento que proyecte los datos de la tabla pa�s, donde al dar un c�digo de pa�s si se
encuentra que lo actualice con el que se ingresa, sino que lo inserte como un registro nuevo.*/
/*Crear una BD y dentro de ella una tabla llamada PAIS, abajo ejemplo, pero ustedes deben
colocar otros datos.*/
create database continente
use continente
create table pais(
Nombre varchar(30),
Codigo varchar(30),
Capital varchar(30))

insert into pais values('Panam�','111','Panam�')
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
exec pais_codigo 'Panama','222','Panam�'
select* from pais
/*1. Usando una instrucci�n select con una estructura CASE, implementar un script sencillo que muestre un
d�a de la semana x (en letras), dado un par�metro en n�mero, Ej.: si pongo 1 entonces es �Lunes� y as�
hasta el domingo, colocar un valor inicial a la variable del d�a con el valor de 4. */

declare @dia int=5
select case @dia
when 1 then 'lunes'
when 2 then 'Martes'
when 3 then 'Mierc�les'
when 4 then 'Jueves'
when 5 then 'Viernes'
when 6 then 'Sabado'
when 7 then 'Domingo'
end as Dia_semana

/*. Usando la tabla de Almac�n, crear una instrucci�n select con una estructura CASE, implementar un script
sencillo que muestre el c�digo del producto, la descripci�n, el modelo. Y que muestre la respuesta del
CASE con una variable llamada SIGLAS, donde coloque la primera letra de la descripci�n, por ejemplo, si
es Laptop, que ponga L y as� con los dem�s y en de otro modo no est� en venta*/
use almacen

select idproducto,DESCRIPCCI�N,modelo,
case 
	when DESCRIPCCI�N Like'Laptop'Then 'L'
	when DESCRIPCCI�N Like 'Panel' Then 'P'
	When DESCRIPCCI�N like 'Servidor' Then 'S'
	else 'NO ESTA A LA VENTA'
end as Siglas
from PRODUCTO

