
create table Persona(
IdPersona int auto_increment,
Nombre varchar(50),
Apellido varchar(50),
DNI int,
Telefono int,
Mail varchar(50),
constraint PK_Persona primary key (IdPersona)
)engine=innoDB;

Create table Sector(
codS int,
Nombre varchar(50),
descripcion varchar(100),
constraint pk_Sector primary key (CodS)
)engine=innodb;
/*
Supuesto: Un empleado solo trabajara en un sector
*/

Create table empleado(
codE int,
codP int,
idioma int,
codS int,
constraint pk_empleado primary key (CodE)
)engine=innodb;

Create table Idioma(
codI int,
Nombre varchar(50),
constraint pk_Idioma primary key (CodI)
)engine=innodb;

Create table EmpleadoIdioma(
codI int,
codE int,
constraint pk_EmpleadoIdioma primary key (CodE, codI)
)engine=innodb;   





