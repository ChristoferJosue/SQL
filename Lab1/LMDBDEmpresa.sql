use empresa

/*. Seleccionar nombre del departamento, n�mero del departamento y el c�digo ADMRDEPT*/
Select deptname,deptno,ADMRDEPT from TABLAS_DEPARTAMENTOS

/*Para eliminar las tuplas repetidas se utiliza la cl�usula DISTINCT.
2. Con esta cl�usula, proyectar el c�digo ADMRDEPT, de modo que no tenga filasrepetidas.

select distinct ADMRDEPT from tablas_departamentos

/*3. �Qu� trabajo realiza cada empleado?, usar la cl�usula DISTINCT, pero solo usando la columna de job
select   distinct  job from TABLAS_EMPLEADOS

/*4. Seleccionar nombre del departamento, n�mero del departamento y el c�digo ADMRDEPT, este �ltimo
ordenarlo de manera ascendente.*/

select DEPTNAME,DEPTNO,ADMRDEPT from TABLAS_DEPARTAMENTOS order by ADMRDEPT

/*5. Seleccionar nombre de departamento, n�mero de departamento y el c�digo ADMRDEPT, este �ltimo
ordenarlo de manera ascendente y el n�mero de departamento de manera descendente.

select DEPTNAME,DEPTNO,ADMRDEPT from TABLAS_DEPARTAMENTOS order by ADMRDEPT asc, DEPTNAME desc  

/*6. Se desea proyectar el apellido y el nivel de formaci�n de los empleados cuyo nivel de formaci�n es mayor
o igual a 15.
despu�s del 1 de enero de 1998 (inclusive), indique la salida ordenada por fecha de cumplea�os.*/ 
nivel de educaci�n de 16*/
nivel 16 y de todos los empleados de nivel 11 La salida se ordena por trabajo y nive*/

select EMPNO,job,EDLEVEL from TABLAS_EMPLEADOS where job='designer' and EDLEVEL=16 or EDLEVEL=11 and job<>'designer' order by job,EDLEVEL
/*	10. Obtener el n�mero de empleado y el nivel de todos los empleados con un nivel entre 10 y 15 y la salida
se ordena por nivel
clasificado por nivel y apellido
guarde la suma del salario con el bono, donde el salario sea menor de 5k y ordenar la salida por n�mero
de empleado.*/
valores que se insertan deben pertenecer al dominio de cada uno de los atributos de la relaci�n.