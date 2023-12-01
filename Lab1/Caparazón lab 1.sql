create database Empresa
go

use Empresa
go

create table TABLAS_DEPARTAMENTOS
(
DEPTNO char(3) not null,
DEPTNAME varchar(36) not null,
MGRNO char(6),
ADMRDEPT char(3) not null,
LOCATION char(16)
);
go

ALTER TABLE TABLAS_DEPARTAMENTOS ADD CONSTRAINT PK_TABLAS_DEPARTAMENTOS PRIMARY KEY CLUSTERED (DEPTNO);
go



create table TABLAS_EMPLEADOS
(
EMPNO char(6) not null,
FIRSTNME varchar(12) not null,
MIDINIT char(1) not null,
LASTNAME varchar(15) not null,
WORKDEPT char(3) not null,
PHONENO char(4) not null,
HIREDATE date not null,
JOB varchar(10) not null,
EDLEVEL smallint not null,
SEX char(1) not null,
BIRTHDATE date not null,
SALARY decimal(9,2) not null,
BONUS decimal(9,2)  not null
);
go

ALTER TABLE TABLAS_EMPLEADOS ADD CONSTRAINT PK_TABLAS_EMPLEADOS PRIMARY KEY CLUSTERED (EMPNO);
go


