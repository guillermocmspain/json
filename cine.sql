drop database if exists cine;
create database cine;

use cine;

create table directores(
	codigoD int primary key,
	nombreD char(20),
	nacionalidadD char(20)
);
create table peliculas(
	codigoPel int primary key,
	nacionalidad char(20),
	productora char (20),
	codigoD int,
	constraint direcPel foreign key (codigoD)references directores (codigoD)
	on delete cascade on update cascade
);
create table actores (
	codigoAct int primary key,
	nombreAct char(20),
	sexo enum('M','F'),
	fechaNac date,
	tipo enum('n','p'),
	prima int
);


create table pelActores (
	codigoPel int,
	codigoAct int,
	foreign key (codigoPel) references peliculas (codigoPel)
	on delete cascade on update cascade,
	foreign key (codigoAct) references actores (codigoAct)
	on delete cascade on update cascade
);


insert into directores values(1,'Pepe','Español');
insert into directores values(2,'Jhon','Francés');
insert into directores values(3,'María','Portugués');
insert into directores values(4,'Stephen','Inglés');
insert into directores values(5,'Lula','Brasileño');

insert into peliculas values (1,'Española','Warner',1);
insert into peliculas values (2,'Estados Unidos','Fox',2);
insert into peliculas values (3,'Italiana','Century',3);
insert into peliculas values (4,'Portuguesa','Warner',4);
insert into peliculas values (5,'Española','Fox',5);

insert into actores values (1,'Juan','M','1970-12-3','n',4000);
insert into actores values (2,'Anthony','M','1980-3-12','n',234);
insert into actores values (3,'Andy','M','1980-4-10','p',7890);
insert into actores values (4,'Brad','M','1950-10-20','p',1234);
insert into actores values (5,'Angelina','F','1985-7-20','n',6543);

insert into pelActores values (1,1), (1,2),(1,5),(2,2), (2,4),(2,3),(3,3),(3,4),(3,1), (4,4),(4,2), (5,5),(5,1),(5,2);