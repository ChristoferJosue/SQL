use empresa

/*. Seleccionar nombre del departamento, número del departamento y el código ADMRDEPT*/
Select deptname,deptno,ADMRDEPT from TABLAS_DEPARTAMENTOS

/*Para eliminar las tuplas repetidas se utiliza la cláusula DISTINCT.
2. Con esta cláusula, proyectar el código ADMRDEPT, de modo que no tenga filasrepetidas.*/

select distinct ADMRDEPT from tablas_departamentos

/*3. ¿Qué trabajo realiza cada empleado?, usar la cláusula DISTINCT, pero solo usando la columna de job*/
select   distinct  job from TABLAS_EMPLEADOS

/*4. Seleccionar nombre del departamento, número del departamento y el código ADMRDEPT, este último
ordenarlo de manera ascendente.*/

select DEPTNAME,DEPTNO,ADMRDEPT from TABLAS_DEPARTAMENTOS order by ADMRDEPT

/*5. Seleccionar nombre de departamento, número de departamento y el código ADMRDEPT, este último
ordenarlo de manera ascendente y el número de departamento de manera descendente.*/

select DEPTNAME,DEPTNO,ADMRDEPT from TABLAS_DEPARTAMENTOS order by ADMRDEPT asc, DEPTNAME desc  

/*6. Se desea proyectar el apellido y el nivel de formación de los empleados cuyo nivel de formación es mayor
o igual a 15.*/select LASTNAME, EDLEVEL  from TABLAS_EMPLEADOS where EDLEVEL>=15/*7. Se desea proyectar el número de empleado, apellido y fecha de nacimiento de aquellos que hayan nacido
después del 1 de enero de 1998 (inclusive), indique la salida ordenada por fecha de cumpleaños.*/ select EMPNO,LASTNAME, BIRTHDATe  from TABLAS_EMPLEADOS where BIRTHDATE>='1998-01-01' order by BIRTHDATE/*8. Se desea proyectar el número de empleado, el trabajo y el nivel de formación de los diseñadores con un
nivel de educación de 16*/select EMPNO,job,EDLEVEL from TABLAS_EMPLEADOS where job='designer' and  EDLEVEL=16/*9. Obtener el número de empleado, el trabajo y el nivel de formación de todos los diseñadorescon un
nivel 16 y de todos los empleados de nivel 11 La salida se ordena por trabajo y nive*/

select EMPNO,job,EDLEVEL from TABLAS_EMPLEADOS where job='designer' and EDLEVEL=16 or EDLEVEL=11 and job<>'designer' order by job,EDLEVEL
/*	10. Obtener el número de empleado y el nivel de todos los empleados con un nivel entre 10 y 15 y la salida
se ordena por nivel*/select EMPNO, EDLEVEL from TABLAS_EMPLEADOS where EDLEVEL between 10 and 15 order by EDLEVEL/*11. Listar los apellidos y nivel de formación de todos los empleados de nivel 11, 14 o 15. El resultado
clasificado por nivel y apellido*/select LASTNAME,EDLEVEL from TABLAS_EMPLEADOS where EDLEVEL in(11,14,15) group by EDLEVEL,LASTNAME/*12. Obtener el apellido de todos los empleados cuyo apellido empiece por V*/select  LASTNAME from TABLAS_EMPLEADOS where LASTNAME like 'V%'/*13. Qué empleados tienen una A como segunda letra de su apellido*/select  LASTNAME from TABLAS_EMPLEADOS where LASTNAME like '_A%'/*14. Se desea proyectar todos los departamentos excepto aquellos cuyo número No. empiece por'D'*/select DEPTNO from TABLAS_DEPARTAMENTOS where DEPTNO like 'D%'/*15. Seleccionar número de empleado, salario, bono y renombrar una columna llamada INCOME, que me
guarde la suma del salario con el bono, donde el salario sea menor de 5k y ordenar la salida por número
de empleado.*/select EMPNO,SALARY,BONUS,(SALARY+BONUS) as INCOME from TABLAS_EMPLEADOS  where SALARY<5000 order by EMPNO\/*16. Inserte una línea completa de datos de la tabla Empleados, suponga los datos, en cualquier caso, los
valores que se insertan deben pertenecer al dominio de cada uno de los atributos de la relación.*/insert into TABLAS_EMPLEADOS values(000070,'Christofer','J','Gonzalez', 'A00', '6824','2022-08-30','designer',17,'M','2002-03-02',60000.00,3000.0)/*17. Agregue un aumento del 15% al salario de todos los empleados cuyo salario es menor a$1000.00*/update TABLAS_EMPLEADOS set SALARY=SALARY*0.15+SALARY where SALARY<1000select * from TABLAS_EMPLEADOS/*18. Actualizar el nombre del departamento llamando Soporte por SoporteTécnico*/update TABLAS_DEPARTAMENTOS set DEPTNAME='Soporte Técnico' where DEPTNAME='Soporte'/*19. Eliminar los empleados con nivel de escolaridad entre 10 y 11*/delete TABLAS_EMPLEADOS where EDLEVEL in(10,11)