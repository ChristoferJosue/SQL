use Empresa

select *from TABLAS_EMPLEADOS

begin transaction 
update TABLAS_EMPLEADOS set bonus=bonus+1 where EMPNO=70 
rollback 
