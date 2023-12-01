use Empresa

select *from TABLAS_EMPLEADOS(nolock)

begin transaction 
update TABLAS_EMPLEADOS set bonus=bonus+1 where EMPNO=70 