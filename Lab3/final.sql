use BANCO5
/*1. Select getdate(); ejecutar y ver el resultado*/
select GETDATE();
/*2.Select datepart(month,getdate()); retorna el n�mero de mes actual; ejecutar y ver el resultado
cumplen en el mes 02, 7 y 11*/
select NOMBRE,FECHA_NAC from CLIENTE where MONTH(FECHA_NAC) in(02,07,11)
/*9.Select year(getdate()); ejecutar y ver el resultado*/
Select year(getdate());
/*10.Usando la funci�n dada realice una consulta que devuelva todos los datos de los pr�stamos realizados en el
2012.*/
select * from PRESTAMO where YEAR(FECHA)=2012
/*11. SELECT 9.5 AS Original, CONVERT(int, 9.5) AS int ejecutar y ver el resultado
SELECT 9.5 AS Original, CONVERT(int, 9.5) AS int
/*12.Select Convert(Int, Convert(Varchar(25), getdate(), 112)) */
Select Convert(Int, Convert(Varchar(25), getdate(), 112))
/*13. Convertir el n�mero del cliente a tipo de dato cadena de 4 caracteres. Osea de un tipo de dato Num�rico a
String.*/
select convert(varchar(4),IDCLIENTE) from CLIENTE
/*14. Seleccionar el promedio de todos los pr�stamos y que la salida salga con tres cifras significativas
resultado debe decir ElMax.*/
select	MAX(monto)as "ElMax" from PRESTAMO where NOMBRE='Jorge'