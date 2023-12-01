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

/*� Crear las llaves for�neas al momento de crear las tablas, excepto una, ustedes eligen y
luego deben agregar la misma una vez ya creadas las tablas
o Realizar al menos una prueba para corroborar la funci�n de dicha restricci�n