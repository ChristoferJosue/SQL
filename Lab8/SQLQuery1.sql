/*1. Crear una funci�n que retorne el promedio de dos n�meros.*/

create function promedio1(@num1 float,@num2 float)
returns float
as
begin
declare @suma float,@promedio float
set @suma= @num1+@num2 
set @promedio=@suma/2
return @promedio
end


select dbo.promedio1(10.2,2.3) as "Promedio"

/*Crear una funci�n que dado un nombre y apellido lo retorne todo en may�scula y lo
separe por coma, todo en un mismo campo, ejemplo: Araujo, Gionella */


create function TodoEnMayuscula(@nombre varchar(30),@apellido varchar(30))
returns varchar(30)
as
begin
	declare @nuevaCadena varchar(30)
	set @nuevaCadena=upper(@nombre+', '+@apellido)
	return @nuevaCadena
end 
select dbo.TodoEnMayuscula('christofer','gonzalez') as "Nombre y apellido"

/*2.1 Ejecute nuevamente la funci�n pero usando los datos de la tabla cliente de la
BD Almac�n y que el resultado lo coloque en una columna llamada
NOMBRECOMPLETO.*/
use ALMACEN
select dbo.TodoEnMayuscula(nombre,apellido)as "NOMBRECOMPLETO" from CLIENTE 

/*3. Crear una funci�n que, dado el n�mero del d�a, me devuelva el d�a de la semana en letras,
por ejemplo, si mi argumento es 5, debe salir viernes. */

CREATE FUNCTION DiaDeLaSemana(@numero int)
returns varchar(30)
as 
begin 
	declare @diaDeLaSemana as varchar(20)
	
	if @numero= 1  
		set @diaDeLaSemana='lunes'
	else if @numero= 2	
		set @diaDeLaSemana='Martes'
	else if @numero= 3 
		set @diaDeLaSemana='Miercoles'
		if @numero= 4 
		set @diaDeLaSemana='Jueves'
	else if @numero= 5 
		set @diaDeLaSemana='Viernes'
	else if @numero= 6 
		set @diaDeLaSemana='Sabado'
	else if @numero= 7  
		set @diaDeLaSemana='Domingo'
	else set @diaDeLaSemana='No existe'
	return @diaDeLaSemana
end 

select dbo.DiaDeLaSemana(5) as"Dia de la semana"
/*Crear una funci�n que calcule el valor del itbms a los precios de los productos, usar la BD
Almac�n para confirmar la funcionalidad de dicha funci�n.*/
create function CalculoItbms(@precio money)
returns money
as 
begin
	declare @itbms as money
	set @itbms=@precio*0.07
	return @itbms
	end 
 select dbo.CalculoItbms(PRECIO) as itbms  from PRODUCTO 


 /*5. Hacer una copia de alguna de las funciones creadas y luego borrarla. */
 drop function CalculoItbms

 create function CalculoItbms1(@precio float)
returns float 
as 
begin
	declare @itbms as float
	set @itbms=@precio*0.07
	return @itbms
	end 
 select dbo.CalculoItbms1(10.00) as itbms

