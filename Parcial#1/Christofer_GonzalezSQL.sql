use ALMACEN
/*Christofer Gonz�lez 8-980-2354*/

/*1.Actualizar los nombres de ciudad de la tabla sucursal de PANAMA A PANAM� y de PANAMA OESTE A
PANAM� OESTE*/

update SUCURSAL set ciudad='PANAM�' where CIUDAD='PANAMA' 
Update SUCURSAL set ciudad='PANAM� OESTE' where CIUDAD='PANAMA OESTE'


/*2.Se desea proyectar el apellido, nombre, c�digo del cliente y ciudad de los que viven en SANTAGO, la
salida ordenarla de manera descendente por c�digo de cliente*/
	
	select APELLIDO,NOMBRE,IDCLIENTE,CIUDAD from CLIENTE where CIUDAD='SANTIAGO' order by IDCLIENTE desc 
/*3.Seleccionar el c�digo del cliente, apellido, nombre y monto de venta, cuya venta haya sido mayor de
1605.00 */

select cliente.IDCLIENTE,cliente.APELLIDO,cliente.NOMBRE,venta.TOTAL from CLIENTE,VENTA where cliente.IDCLIENTE=venta.IDCLIENTE and  total>1605.00

/*4.Obtener el id de los clientes, apellido y facturas, cuyas facturas no fueron en el periodo de mayo y
junio del 2022
*/
select cliente.IDCLIENTE,cliente.APELLIDO,venta.NOFACTURA from CLIENTE,VENTA where MONTH(VENTA.FECHA_FACT) not in (5,6)and  cliente.IDCLIENTE=venta.IDCLIENTE

/*5.Mediante una operaci�n de conjunto, selecciona el nombre tanto de clientes como vendedores y que
muestre una columna llamada tipo que indique si es cliente o vendedor*/

select cliente.nombre, cliente.idcliente,('Cliente')as'Tipo'  from CLIENTE
union
select VENDEDOR.NOMBRE,VENDEDOR.IDVENDEDOR,('Vendedor')as'Tipo' from VENDEDOR

/*6. Mediante una operaci�n de conjunto, la empresa desea saber de qu� ciudades son los clientes y
cuales ciudades no tienen sucursal, para ver si luego realiza en esas ciudades otros puntos.*/

select cliente.CIUDAD from cliente 
except
select sucursal.CIUDAD from SUCURSAL

/*7.Se desea proyectar el c�digo del vendedor, nombre y apellido de aquellos que se encuentran en la
categor�a A-3 y A-5, tambi�n los que pertenecen a la sucursal del Dorado(P01), la salida ordenarla de
manera descendente por id de vendedor*/

Select IDVENDEDOR,NOMBRE,APELLIDO from VENDEDOR where CATEGORIA='A-3' or CATEGORIA='A-5' or IDSUCURSAL='P01' order by IDVENDEDOR desc

/*8 Qu� vendedores tienen una R como tercera letra de su nombre
*/
select NOMBRE from VENDEDOR where NOMBRE like '__R%'
/*9.Seleccionar n�mero de producto, modelo, precio, nodefactura y renombrar una columna llamada
AUMENTO, que me guarde la suma del PRECIO m�s 65.00 y ordenar la salida por n�mero de producto*/


select producto.IDPRODUCTO,producto.MODELO,producto.PRECIO,venta.NOFACTURA,(precio+65.00)as'Aumento' from PRODUCTO,VENTA where venta.IDPRODUCTO=PRODUCTO.IDPRODUCTO

/*10.Usando una funci�n realice una consulta que devuelva todos los datos de las ventas realizadas del mes
de abril y diciembre, de cualquier a�o.*/

select * from VENTA where MONTH(FECHA_FACT) in(04,12)
/*11. Selecciona la venta mayor, la columna del resultado debe llamarse El HIPERPOWER*/

select  max(total)as'EL HIPERPOWER' from venta 
/*12. Usando una funci�n realice una consulta donde se visualice el nombre, apellido y la fecha de
nacimiento de los clientes que cumplen en los 3 primeros d�as de los meses (x meses).
*/
Select NOMBRE,apellido,FECHA_NAC from CLIENTE where DAY(FECHA_NAC) in(1,2,3)
/*13.Obtener el promedio de todos los precios de los productos, que la salida solo salga con 4 cifras
significativas y colocarle el alias de Promed.*/

select round(AVG(precio),4)as 'Promed' from PRODUCTO
/*14. Con la ayuda de una funci�n obtenga en una misma columna llamada con alias de MarcaDescrip, la
marca seguido de la descripci�n de aquellos productos que son DELL.*/

select concat(marca,DESCRIPCCI�N) as 'MarcaDescrip'from PRODUCTO where MARCA='DELL'

/*15. Mediante una funci�n devuelva la longitud de la cadena Voy a sacar muy buena nota en este parcial
*/

SELECT LEN('Voy a sacar muy buena nota en este parcial')


/*16. A su creatividad y viendo la info. de las tablas, realice una conversi�n de datos mediante una funci�n
*/
 select convert(int,IDVENDEDOR) from vendedor

/*17. Usando una funci�n de cadena, obtenga las 6 primeras letras del director de las Sucursales, el resultado
debe salir sin filas repetidas.
*/

select distinct left(DIRECTOR,6) from SUCURSAL

/*18. Seleccionar todas las tablas con todos sus campos y hacer print de pantalla de como quedaron 
*/

select * from SUCURSAL
select *from venta
select* from CLIENTE
select* from producto
select * from VENDEDOR


