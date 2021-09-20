drop database if exists aerolinea;
create database aerolinea;
use aerolinea;

create table Combustible(
IdCombustible int auto_increment,
Nombre varchar(15),
Precio int,
constraint PK_Combustible primary key(IdCombustible)
)engine=innoDB;

create table Modelo(
IdModelo int auto_increment,
Nombre varchar(40),
IdCombustible int,
MaxCombustible int,
Consumo int,
Filas int,
Columnas int,
constraint PK_Combustible primary key(IdModelo),
constraint FK_Modelo foreign key (IdCombustible) references Combustible(IdCombustible)
)engine=innoDB;

create table Puesto(
IdPuesto int auto_increment,
Nombre varchar(40),
constraint PK_Puesto primary key(IdPuesto)
)engine = innoDB;

create table Fabricante(
IdFabricante int auto_increment,
Nombre varchar(40),
constraint PK_Fabricante primary key(IdFabricante)
)engine = innoDB;

create table Persona(
IdPersona int auto_increment,
Nombre varchar(50),
Apellido varchar(50),
DNI int,
Telefono int,
Mail varchar(50),
IdPuesto int,
constraint PK_Persona primary key (IdPersona),
constraint FK_Persona foreign key (IdPuesto) references Puesto(IdPuesto)
)engine=innoDB;

create table Tripulante(
IdTripulante int auto_increment,
IdPersona int,
IdPuesto int,
constraint PK_Tripulante primary key(IdTripulante),
constraint FK_Tripulante foreign key (IdPersona) references Persona(IdPersona),
constraint FK_Tripulante2 foreign key (IdPuesto) references Puesto(IdPuesto)
)engine = innoDB;

create table Aeropuerto(
IdAero int auto_increment,
OACI varchar(4),
Nombre varchar(60),
Estado varchar(30),
constraint PK_Aeropuerto primary key(IdAero)
)engine = innoDB;

create table Avion(
IdAvion int auto_increment,
Matricula varchar(10),
IdFabricante int,
IdModelo int,
Estado varchar(40),
IdAero int,
constraint PK_Avion primary key (IdAvion),
constraint FK_Avion foreign key (IdFabricante) references Fabricante(IdFabricante),
constraint FK_Avion2 foreign key (IdModelo) references Modelo(IdModelo),
constraint FK_Avion3 foreign key (IdAero) references Aeropuerto(IdAero)
)engine = innoDB;

create table HorasAvion(
IdHoras int auto_increment,
IdAvion int,
IdTripulante int,
Horas float,
IdPuesto int,
constraint PK_HA primary key (IdHoras),
constraint FK_HA foreign key (IdAvion) references Avion(IdAvion),
constraint FK_HA2 foreign key (IdTripulante) references Tripulante(IdTripulante),
constraint FK_HA3 foreign key (IdPuesto) references Puesto(IdPuesto)
)engine = innoDB;

create table Categoria(
IdCategoria int auto_increment,
Nombre varchar(50),
constraint PK_Categoria primary key (IdCategoria)
)engine=innoDB;

create table Reparacion(
IdReparacion int auto_increment,
IdAvion int,
IdCategoria int,
Estado varchar(20),
Severidad varchar(20),
Detalle varchar(1000),
Costo float,
FechaI date,
FechaR date,
constraint PK_Reparacion primary key (IdReparacion),
constraint FK_Reparacion foreign key (IdCategoria) references Categoria(IdCategoria),
constraint FK_Reparacion2 foreign key (IdAvion) references Avion(IdAvion)
)engine = innoDB;

create table Mantenimiento(
IdMantenimiento int auto_increment,
IdAvion int,
CHPM float,
Estado varchar(20),
Costo float,
Detalle varchar(1000),
FechaI date,
FechaR date,
constraint PK_Mantenimiento primary key (IdMantenimiento)
)engine = innoDB;

