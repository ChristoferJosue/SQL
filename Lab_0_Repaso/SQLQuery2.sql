use ChristoferG

create table clientes(
DNI nvarchar(15) primary key not null,
nombre varchar(30) not null,
Dir nvarchar(30) not null
)

create table sucursales(
Nsuc numeric primary key not null,
ciudad varchar(30) not  null
)

create table cuentas(
cod nvarchar primary key not null,
DNI nvarchar(15) not null,
Nsuc numeric not null,
Saldo money not null
)



alter table cuentas
add constraint Fk_Dni foreign key (Dni) references clientes(Dni)

alter table cuentas
add constraint Fk_Nsuc foreign key (Nsuc) references sucursales(Nsuc)

alter table clientes add  pais varchar(10) not null  

alter table clientes add salario money not null 

alter table clientes alter column pais varchar(25)not null

insert into clientes values('8-98889-9','Christofer',' Ciudad del futuro','Panama',3000) 	
insert into clientes values('8-980-123','Josue',' Ciudad del futuro','Panama',3000) 
insert into clientes values('8-98-2222','Cj','Bogota','Colombia',600) 	

insert into cuentas values('1','8-98889-9','1',30000)
insert into cuentas values('2','8-980-123','2',200)
insert into cuentas values('3','8-980-123','2',30)

select * from clientes 
select* from sucursales
select * from cuentas


alter table clientes drop column pais 
drop table cuentas





drop table sucursales