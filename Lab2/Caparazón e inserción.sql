create database BancoTrans
Use BancoTrans

-- creando tabla para ejemplo de transacciones

create table CuentasTrans
(ID char(5) not null,
Nombre varchar(30) not null,
constraint CuentasTrans_ID_PK primary key(ID),
Teléfono nvarchar (30),
constraint Telefono_unique unique(Teléfono),
Género varchar(1) not null,
constraint CuentasTrans_check check(Género in('F','M')),
balance money) 
insert into CuentasTrans values
	('00001', '‎Laurence Hills','6524-8596','F', '5000'),
	('00002', 'Carlos Stuart', '6894-7582', 'M', '3500'),
	('00003', 'Marcos Jiménez', '6528-2586', 'M', '895'),
	('00004', 'Berlinda Sáenz', '6728-8425', 'F', '4100')

		SELECT * FROM CuentasTrans
	
	-- Relizando la transacción en donde se pide lo siguiente:  De las cuentas que hay en el banco, 
	--se quiere pasar un dinero de una cuenta a otra, Laurence y Marcos son amigos y tienen cuenta en el 
	-- mismo banco, Marcos le pide a Laurence que le preste $1000 por medio de una transacción, hacer la búsqueda 
	--con la PK de cada usuario.
	
BEGIN TRY
 BEGIN TRANSACTION

update CuentasTrans set balance=balance+1300 where ID='00003'
update CuentasTrans set balance=balance-1300 where ID='00001'

 COMMIT TRANSACTION
 PRINT 'Transacción completada'
	END TRY
BEGIN CATCH
 ROLLBACK TRANSACTION
  PRINT 'Transacción cancelada'
 END CATCH	
	-- resuelve
	
	select * from CuentasTrans



   --Qué pasaría si Marcos le pide al banco que devuelva los $1300 a Laurence y que adicional le de unos $150.00 más 
   --por el favor que le hizo del préstamo, es decir que le de en total unos $1450.00, pero el banco, sin embargo, 
--   por error de dedo en el número de cuenta (id) coloca el nombre del cliente.

   -- resuelve
BEGIN TRY
 BEGIN TRANSACTION

	update CuentasTrans set balance=balance-1450 where ID='Marcos'
	update  CuentasTrans set balance=balance+1450 where ID='‎00001'

 COMMIT TRANSACTION
 PRINT 'Transacción completada'
 END TRY
BEGIN CATCH
 ROLLBACK TRANSACTION
  PRINT 'Transacción cancelada'
END CATCH
drop table CuentasTrans
 select * from CuentasTrans
