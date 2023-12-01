use BANCO5
/*1. Select getdate(); ejecutar y ver el resultado*/
select GETDATE();
/*2.Select datepart(month,getdate()); retorna el número de mes actual; ejecutar y ver el resultado*/Select datepart(month,getdate());/*3.Usando la función datepart realice una consulta que devuelva día actual*/select DATEPART(day,getdate());/*4. Select datename(month,getdate()); retorna el nombre del mes actual; ejecutar y ver el resultado*/Select datename(month,getdate());/*5.Usando la función dada realice una consulta que devuelva el día actual*/select DATENAME(weekday,getdate());/*6.Select day(getdate()); ejecutar y ver el resultado*/Select day(getdate());/*7.Select month(getdate()); ejecutar y ver el resultado*/Select month(getdate()); /*8.Usando la función dada realiza una consulta donde se visualice el nombre y la fecha de nacimiento de los que
cumplen en el mes 02, 7 y 11*/
select NOMBRE,FECHA_NAC from CLIENTE where MONTH(FECHA_NAC) in(02,07,11)
/*9.Select year(getdate()); ejecutar y ver el resultado*/
Select year(getdate());
/*10.Usando la función dada realice una consulta que devuelva todos los datos de los préstamos realizados en el
2012.*/
select * from PRESTAMO where YEAR(FECHA)=2012
/*11. SELECT 9.5 AS Original, CONVERT(int, 9.5) AS int ejecutar y ver el resultado*/
SELECT 9.5 AS Original, CONVERT(int, 9.5) AS int
/*12.Select Convert(Int, Convert(Varchar(25), getdate(), 112)) */
Select Convert(Int, Convert(Varchar(25), getdate(), 112))
/*13. Convertir el número del cliente a tipo de dato cadena de 4 caracteres. Osea de un tipo de dato Numérico a
String.*/
select convert(varchar(4),IDCLIENTE) from CLIENTE
/*14. Seleccionar el promedio de todos los préstamos y que la salida salga con tres cifras significativas*/select round(AVG(MONTO),3)from PRESTAMO/*15. Selecciona cuantos registros de sucursales hay en dicho banco y renombra la columna como total*/select count(IDSUCURSAL)as "total"   from SUCURSAL/*16. Selecciona la cuenta con el menor saldo, la columna del resultado debe llamarse ElMin*/select min(SALDO)as "ElMin" from cuenta/*17.Selecciona el mayor monto de préstamo donde el nombre de cliente sea igual a Jorge y la columna del
resultado debe decir ElMax.*/
select	MAX(monto)as "ElMax" from PRESTAMO where NOMBRE='Jorge'