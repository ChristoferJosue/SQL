create database blockbuster
use blockbuster




create table Director
(ID_DIRECTOR varchar(10)NOT NULL,
NOMBRE VARCHAR(30)not null,
NACIONALIDAD VARCHAR(20)not null,
TELEFONO VARCHAR(20)not null,
CONSTRAINT PK_ID_DIRECTOR PRIMARY KEY(ID_DIRECTOR),
)

create table Pelicula
(ID_PELICULA VARCHAR(10)NOT NULL,
TITULO VARCHAR(30)not null,
PRODUCTORA VARCHAR(20) NOT NULL,
FECHA DATE,
DIRECTOR varchar(10)not null,
CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA),
constraint fk_director foreign key(DIRECTOR) References director(ID_DIRECTOR))

ALTER TABLE PELICULA 
ADD CATEGORIA VARCHAR(20)NOT NULL

CREATE TABLE EJEMPLAR
(ID_PELICULA VARCHAR(10)NOT NULL,
NUMERO INT NOT NULL,
ESTADO VARCHAR(20),
FORMATO VARCHAR(10))
select * from EJEMPLAR
/*Crear cada llave primaria en cada una de las tablas, excepto una, Ustedes eligen y luego
deben alterar la tabla y agregarla*/

ALTER TABLE EJEMPLAR
ADD CONSTRAINT PK_NUMERO PRIMARY KEY(NUMERO)

/*• Crear las llaves foráneas al momento de crear las tablas, excepto una, ustedes eligen y
luego deben agregar la misma una vez ya creadas las tablas*/ALTER TABLE EJEMPLARADD CONSTRAINT fk_PELICULA_EJEMPLAR foreign key(ID_PELICULA) References PELICULA(ID_PELICULA)CREATE TABLE SOCIO(DNI Varchar(15) Not null,NOMBRE_SOCIO Varchar(20) Not null, DIRECCION_SOCIO Varchar(45) Not null, TELEFONO Nvarchar(20) Not null, AVALADOR Varchar(5) Not null)select * from SOCIOALter table socio add constraint pk_socio primary key(DNI)select * from Alquilacreate table Alquila(DNI_SOCIO varchar(15)not null,ID_PELICULA_EJEMPLAR varchar(10)not null,NUMERO_EJEMPLAR INT NOT NULL,ID_TRANSACCION VARCHAR(20)NOT NULL,FECHA_ALQUILER DATE,FECHA_DEVOLUCION DATE,CONSTRAINT FK_DNISOCIO FOREIGN KEY(DNI_SOCIO) REFERENCES SOCIO(DNI),CONSTRAINT FK_ID_PELICULA_EJEMPLAR FOREIGN KEY(ID_PELICULA_EJEMPLAR) REFERENCES PELICULA(ID_PELICULA),CONSTRAINT PK_ID_TRANSACCION PRIMARY KEY(ID_TRANSACCION),CONSTRAINT FK_NUMERO FOREIGN KEY(NUMERO_EJEMPLAR) REFERENCES EJEMPLAR(NUMERO))CREATE TABLE ACTORES(DNI_ACTORES VARCHAR(20)not null,Nombre_actor varchar(40)not null,Nacionalidad varchar(30), Telefono nvarchar(15)not null,sexo varchar(2)not null,FECHA_NAC DATE,NumeroLicencia varchar(15),constraint CH_FECHA_NAC CHECK(FECHA_NAC<(GETDATE()))/*• Realizar dos restricciones check sobre campos de las tablas al momento de crearlas*/,constraint PK_DNI_TELEFONO PRIMARY KEY(DNI_ACTORES,TELEFONO))/*Colocar la restricción Unique en al menos dos definiciones de campos
o Realizar al menos una prueba para corroborar la función de dicha restricción*/alter table socio add constraint UQ_Telefono unique(telefono)alter table actores add constraint UQ_NumeroLicencia_actor unique(NumeroLicencia)create table Actua(DNI_ACTORES varchar(20),ID_PELICULA VARCHAR(10),PROTA VARCHAR(2) CHECK(PROTA='Si' or PROTA='No')/*• Realizar dos restricciones check sobre campos de las tablas al momento de crearlas	*/,TELEFONO NVARCHAR(15),CONSTRAINT FK_DNI_ACTOR_ACTUA FOREIGN KEY(DNI_ACTORES,telefono) references ACTORES (DNI_ACTORES,telefono)/*• Crear una llave compuesta como llave primaria en alguna de las tablas */,	CONSTRAINT FK_ID_PELICULA_ACTUA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA (ID_PELICULA))select * from Actuaselect * from Pelicula/* Borrar una de las restricciones Unique creadas y volver a crear otra */ ALTER TABLE ACTORES drop constraint UQ_NumeroLicencia_actor alter table actores add  correo nvarchar(40)alter table actores add constraint UQ_ACTORES_CORREO Unique(correo)/*• Adicionar una restricción check luego de haber creado las tablas*/alter table director add edad intALTER TABLE DIRECTOR ADD CONSTRAINT CH_EDAD CHECK(EDAD>=18)insert into director values('07','Abigail Rodriguez','Turca','12345688',17) insert into director values('01','Abigail Rodriguez','Turca','123456',18)insert into director values('02','Airol Laffitte','Nigeriano','2223456',22)insert into director values('03','Antonio nuñez','Ingles','2223457',32)insert into director values('04','Moises Ortiz','Peruano','66789898',25)insert into director values('05','Joelys Castillo','Argentina','8789012',30)insert into director values('06','Sebastian Lopez','Ingles','34345345',40)select * from ACTORESinsert into ACTORES values('01','Nanu Rodriguez','Panameño','898989','M','03/02/2000','001','nanu123@gmail.com')insert into ACTORES values('02','hugh jackman','Americano','89878989','M','03/01/1980','002','huge jackman@gmail.com')insert into ACTORES values('03','Bradd pitt','Colombiano','507889989','M','05/12/1989','003','bradd123@gmail.com')insert into ACTORES values('04','Vivian Andrade','Colombiana','78901234','F','07/20/2002','004','viviana@gmail.com')insert into ACTORES values('05','Amelia Clarke','Ingles','4524898989','F','07/21/1995','005','AmeliaCl@gmail.com')insert into ACTORES values('06','Mia Jimenez','Australiana','1234567','F','12/12/1983','06','Mia02@gmail.com')insert into ACTORES values('8-980-2354','Christofer González','','68246474','M','03/02/2022','007','Christofer.cg1@gmail.com')insert into Pelicula values('01','Duro de matar','MJM','03/05/2000','01','Accion')insert into Pelicula values('02','Avatar','pixar','06/10/2010','02','Aventura')insert into Pelicula values('03','Rapidos y furiosos 8','Sony','12/12/2020','01','Accion')insert into Pelicula values('04','Avengers ','Disney','03/05/2021','05','Accion')insert into Pelicula values('05','Harry potter','Sony','07/08/2007','06','Aventura')insert into Pelicula values('06','Iron man','Disney','12/01/2010','05','Accion')insert into Actua values('03','06','No','507889989')insert into Actua values('02','01','Si','89878989')insert into Actua values('04','03','No','78901234')insert into Actua values('04','06','Si','78901234')insert into Actua values('06','05','No','1234567')insert into Actua values('06','02','Si','1234567')Select * from Actuainsert into SOCIO values('8-980-123','Josue Bultron','Las Villas','6667676','Si')insert into SOCIO values('8-980-456','Chris González','Las Villas','6667656','No')insert into SOCIO values('8-456-989','Airol Gonzalez','El palmar','6123456','Si')insert into SOCIO values('3-980-2240','Moises Jimenez','Nuevo emperador, nuevo arraijan','675239432','No')insert into SOCIO values('4-440-5623','Jean Cardenas','Brisas del golf','698912321','Si')insert into SOCIO values('20-123-7783','Alan Mall','Hato montaña','5589676','Si')insert into EJEMPLAR values('01','01','alquilado','Blue ray')insert into EJEMPLAR values('02','02','Disponible','Blue ray')insert into EJEMPLAR values('03','03','alquilado','Digital')insert into EJEMPLAR values('01','04','Disponible','Blue ray')insert into EJEMPLAR values('03','05','Disponible','CD/DVD')insert into EJEMPLAR values('05','06','alquilado','CD/DVD')insert into Alquila values('8-980-456','01','01','01','8/11/2022','10/11/2022')insert into Alquila values('8-980-456','03','03','02','8/11/2022','10/11/2022')insert into Alquila values('20-123-7783','02','02','03','7/11/2022','9/11/2022')insert into Alquila values('20-123-7783','03','03','04','7/11/2022','9/11/2022')insert into Alquila values('4-440-5623','03','05','05','6/15/2022','8/15/2022')insert into Alquila values('4-440-5623','05','06','06','6/15/2022','8/15/2022')select * from Directorselect * from ACTORESselect * from SOCIOselect * from Alquilaselect * from EJEMPLARselect * from Actuaselect * from Pelicula