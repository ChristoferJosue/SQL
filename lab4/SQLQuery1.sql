create database blockbuster 
use blockbuster




create table director
(ID_DIRECTOR varchar(10)NOT NULL,
NOMBRE VARCHAR(30)not null,
NACIONALIDAD VARCHAR(20)not null,
TELEFONO VARCHAR(20)not null,
CONSTRAINT PK_ID_DIRECTOR PRIMARY KEY(ID_DIRECTOR))


create table pelicula
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
(ID_PELI VARCHAR(10)NOT NULL,
NUMERO INT NOT NULL,
ESTADO VARCHAR(20),
FORMATO VARCHAR(10))
/*Crear cada llave primaria en cada una de las tablas, excepto una, Ustedes eligen y luego
deben alterar la tabla y agregarla*/

ALTER TABLE EJEMPLAR
ADD CONSTRAINT PK_NUMERO PRIMARY KEY(NUMERO)

/*• Crear las llaves foráneas al momento de crear las tablas, excepto una, ustedes eligen y
luego deben agregar la misma una vez ya creadas las tablas*/ALTER TABLE EJEMPLARADD CONSTRAINT fk_PELI foreign key(ID_PELI) References PELICULA(ID_PELICULA)CREATE TABLE SOCIO(DNI Varchar(15) Not null,NOMBRE_SOCIO Varchar(20) Not null, DIRECCION_SOCIO Varchar(45) Not null, TELEFONO Nvarchar(20) Not null, AVALADOR Varchar(5) Not null)/*Colocar la restricción Unique en al menos dos definiciones de campos
o Realizar al menos una prueba para corroborar la función de dicha restricción*/alter table socio add constraint UQ_Telefono unique(telefono)create table alquila(DNI_SOCIO varchar(15)not null,ID_PELI_EJEMPLAR varchar(10)not null,NUMERO_EJEMPLAR INT NOT NULL,ID_TRANSACCION VARCHAR(20)NOT NULL,FECHA_ALQUILER DATE,FECHA_DEVOLUCION DATE,CONSTRAINT FK_DNISOCIO FOREIGN KEY(DNI_SOCIO) REFERENCES SOCIO(DNI),CONSTRAINT FK_ID_PELI_EJEMPLAR FOREIGN KEY(ID_PELI_EJEMPLAR) REFERENCES PELICULA(ID_PELICULA),CONSTRAINT PK_ID_TRANSACCION PRIMARY KEY(ID_TRANSACCION),CONSTRAINT FK_NUMERO FOREIGN KEY(NUMERO_EJEMPLAR) REFERENCES EJEMPLAR(NUMERO))