CREATE DATABASE
BANCO5
 GO
 
USE
BANCO5
 GO
 
CREATE TABLE CLIENTE
 (IDCLIENTE VARCHAR(5)PRIMARY KEY,
  APELLIDO VARCHAR(30),
   NOMBRE VARCHAR(30),
   CIUDAD VARCHAR (30),
   FECHA_NAC smalldatetime)
GO
 
CREATE TABLE CUENTA
(IDCLIENTE VARCHAR(5),
 IDCUENTA VARCHAR(5) PRIMARY KEY,
 IDSUCURSAL VARCHAR(2),
 SALDO FLOAT,
 NOMBRE_SUC VARCHAR(20))
GO
 
CREATE TABLE PRESTAMO
(IDPRESTAMO VARCHAR(5) PRIMARY KEY,
 IDSUCURSAL VARCHAR(2),
 IDCLIENTE VARCHAR(5),
 NOMBRE VARCHAR(30),
 MONTO FLOAT,
 FECHA DATETIME)
GO

CREATE TABLE SUCURSAL
(IDSUCURSAL VARCHAR(2) PRIMARY KEY,
NOMBRE_SUCURSAL VARCHAR (30),
CIUDAD VARCHAR(30))
GO
 
ALTER TABLE
CUENTA ADD FOREIGN KEY(IDCLIENTE)
REFERENCES
CLIENTE
GO
 
ALTER TABLE
PRESTAMO ADD FOREIGN KEY(IDSUCURSAL)
REFERENCES
SUCURSAL
GO

ALTER TABLE
PRESTAMO ADD FOREIGN KEY(IDCLIENTE)
REFERENCES
CLIENTE
GO

 
ALTER TABLE
CUENTA ADD FOREIGN KEY(IDSUCURSAL)
REFERENCES
SUCURSAL
GO
use BANCO5
insert into sucursal values('02','PANAMA PACIFICO','PANAMA') 
insert into sucursal values('05','ALBROOK','PANAMA') 
insert into sucursal values('06','COSTA VERDE','PANAMAO') 
insert into sucursal values('04','CENTENIAL','PANAMA') 
insert into sucursal values('03','WESTLAND MALL','Panamao') 

/*1.Obtener el código de clientes y ciudades donde viven, que cumplan con la condición de tener un
préstamo.*/
select cliente.IDCLIENTE,cliente.CIUDAD,prestamo.IDCLIENTE from CLIENTE,PRESTAMO where cliente.IDCLIENTE=prestamo.IDCLIENTE

/*2. Obtener el id de los clientes que tienen, una cuenta, un préstamo, o ambas cosas en la sucursal
“02”*/
select cliente.IDCLIENTE,cuenta.IDSUCURSAL from cuenta cuenta, cliente cliente where cliente.IDCLIENTE = cuenta.IDCLIENTE and cuenta.IDSUCURSAL= 02
union
select cliente.IDCLIENTE, prestamo.IDSUCURSAL from prestamo prestamo, cliente cliente
where prestamo.IDCLIENTE = cliente.IDCLIENTE and prestamo.IDSUCURSAL = 02


/*3. Obtener el id de los clientes que tienen un préstamo pero que no tienen cuenta
*/
select IDCLIENTE from PRESTAMO
except	
select IDCLIENTE from CUENTA
 
 /*4. Obtener el código de los clientes que tienen depósito y préstamo al mismo tiempo en la sucursal
de Panama Pacifico.*/

select IDCLIENTE from CUENTA where IDSUCURSAL='02'
intersect 
select IDCLIENTE from PRESTAMO where IDSUCURSAL='02'

/*5. Seleccionar las 3 primeras letras del nombre de los clientes sin filas repetidas (extrayendo una subcadena) CONCAT: Concatena dos o más valores.*/
select distinct left(NOMBRE,3)  from CLIENTE
/*dos formas de hacerlo*/
select distinct SUBSTRING(NOMBRE,1,3) from CLIENTE
/*6. Select CONCAT ('el nombre del cliente es',' ', NOMBRE) from CLIENTE
ejecutar y ver el resultado
*/
Select CONCAT ('el nombre del cliente es',' ', NOMBRE) from CLIENTE
/*7. Se solicita una consulta que visualice el nombre más el apellido del cliente (debe tener el espacio entre ambos),
donde el apellido sea igual a Sánchez, el nombre de la columna debe decir Nombre Completo.
*/
select CONCAT(nombre,' ', apellido)  'Nombre completo' from CLIENTE where APELLIDO='Sánchez'
/*8. Select lower('HOLA ESTUDIAnte'); ejecutar y ver el resultado
*/ 
Select lower('HOLA ESTUDIAnte');
/*9.Visualice una consulta donde cambie el nombre de las sucursales a minúsculas y cuyo nombre de columna se
llame RESULTADO
*/
select LOWER(NOMBRE_SUCURSAL)'Resultado' from SUCURSAL
/*10.Select upper ('HOLA ESTUDIAnte'); */
Select upper ('HOLA ESTUDIAnte');
/*11.Visualice una consulta donde cambie el apellido de los clientes a mayúscula, ordene la salida por apellido de
manera descendente*/
select lower(APELLIDO) from CLIENTE order by APELLIDO desc
/*12.Select char(65); */
Select char(65); 
/*13.Select len('Hola');*/
Select len('Hola');
/*14. Obtener la longitud de caracteres de los diferentes nombres de sucursales
*/
select len(NOMBRE_SUCURSAL) from SUCURSAL
/*15.Select left('buenos dias',8);*/
Select left('buenos dias',8);
/*16. Mediante una consulta se requiere se visualice el nombre de la sucursal y la ciudad, este último campo que sean
solo las tres primeras letras y esa columna su resultado debe llamarse CIUDADT*/
select NOMBRE_SUCURSAL,SUBSTRING(CIUDAD,1,3) as "Ciudad T" from SUCURSAL
/*17.Select Right('buenos dias',8)*/
Select Right('buenos dias',8)
/*18.Visualice el ID del cliente y la ciudad donde viven, este último campo solo debe devolver las últimas 4 letras,
donde la ciudad es igual a Panamá.
ROUND: (columna | expresión, n)
Redondea a n posiciones decimales. Si se omite n, no se redondea con decimales. Si n es negativo, los números a
la izquierda del punto decimal se redondean a decenas, centenas.
*/
select IDCLIENTE, right(CIUDAD,4) from CLIENTE where CIUDAD='Panamá'
/*19.SELECT ROUND(45.923, 2), ROUND(45.923, 0), ROUND(45.923, -1)
*/
SELECT ROUND(45.923, 2), ROUND(45.923, 0), ROUND(45.923, -1)
/*20. Seleccionar la sucursal y redondear todos los depósitos(cuentas) de los diversos clientes
*/
select * from cuenta; 
select NOMBRE_SUC,ROUND(saldo,2) from CUENTA;
	