drop database if exists aerolinea;
create database aerolinea;
use aerolinea;

create table Persona(
IdPersona int auto_increment,
Nombre varchar(50),
Apellido varchar(50),
DNI int,
Telefono int,
Mail varchar(50),
FechaNacimiento date,
constraint PK_Persona primary key (IdPersona)
)engine=innoDB;

create table Combustible(
IdCombustible int auto_increment,
Nombre varchar(20),
Precio int,
constraint PK_Combustible primary key (IdCombustible)
)engine=innoDB;

create table Modelo(
IdModelo int auto_increment,
Nombre varchar(60),
IdCombustible int,
MaxCombustible int,
Consumo int,
Filas int,
Columnas int,
constraint PK_Modelo primary key (IdModelo),
constraint FK_Modelo foreign key (IdCombustible) references Combustible(IdCombustible)
)engine=innoDB;

create table Puesto(
IdPuesto int auto_increment,
Nombre varchar(80),
constraint PK_Puesto primary key (IdPuesto)
)engine = innoDB;

create table Fabricante(
IdFabricante int auto_increment,
Nombre varchar(80),
constraint PK_Fabricante primary key (IdFabricante)
)engine = innoDB;


create table Tripulante(
IdTripulante int auto_increment,
IdPersona int,
IdPuesto int,
constraint PK_Tripulante primary key (IdTripulante),
constraint FK_PersonaTripulante foreign key (IdPersona) references Persona(IdPersona),
constraint FK_PuestoTrip foreign key (IdPuesto) references Puesto(IdPuesto)
)engine = innoDB;

create table Aeropuerto(
IdAero int auto_increment,
OACI varchar(4),
Nombre varchar(60),
Abierto boolean,
constraint PK_Aeropuerto primary key (IdAero)
)engine = innoDB;

create table Avion(
IdAvion int auto_increment,
Matricula varchar(10),
IdFabricante int,
IdModelo int,
Estado varchar(40), /*Disponible, en vuelo, no habilitado*/
IdAero int,
constraint PK_Avion primary key (IdAvion),
constraint FK_AvionFabricante foreign key (IdFabricante) references Fabricante(IdFabricante),
constraint FK_AvionModelo foreign key (IdModelo) references Modelo(IdModelo),
constraint FK_AvionAero foreign key (IdAero) references Aeropuerto(IdAero)
)engine = innoDB;


create table Vuelo(
IdVuelo int auto_increment,
IdAvion int,
Escala boolean,
SFechaEst datetime,
SFechaReal datetime,
DestinoFinal char,
constraint PK_Vuelos primary key(IdVuelo),
constraint FK_AvionVuelo foreign key(IdAvion) references Avion(IdAvion)
)engine=innoDB;

create table Vuelo-Escala (
IdVuelo int,
IdEscala int,
Millas int,
constraint PK_VueloEsc primary key (IdVuelo,IdEscala),
constraint FK_Vue foreign key (IdVuelo) references Vuelo(IdVuelo),
constraint FK_Esc foreign key (IdEscala) references Escala(IdEscala);
)engine=innoDB;



create table Informes(

IdInforme int auto_increment,
Femicion smalldatetime,
idTipo int,
Detalle varchar(100),

constraint PK_Informes primary key(IdInforme), 
constraint FK_tipo foreign key(IdTipo)references TipoInforme(IdTipoInf)

) engine=innoDB;

create table TipoInforme(
IdTipoInf int auto_increment,
Denominacion varchar(20),
constraint PK_TipoInforme primary key (IdTipoInf)
) engine = innoDB;



create table EquipajeBodega(
IdEquipajeBodega int auto_increment primary key,
PiezaKilo int,
MontoExcesoEquipaje int
)engine=innodb;

create table EquipajeMano(
IdEquipajeMano int auto_increment primary key,
PiezaKilo int,
MontoExcesoEquipaje int
)engine=innodb;


create table tipoBoleto(
IdTipoBoleto int auto_increment primary key,
NombreTipo varchar(40),
SeleccionAsientos boolean default false,
IdEquipajeBodega int,
CantEquipajeBodega int,
IdEquipajeMano int,
CantEquipajeMano int,
CambioPasajes float,
DevolucionPasaje boolean,
MillaAerolineaPlus boolean,/*Se pueden acumular las millas */
constraint fk_EquipajeBodega foreign key(IdEquipajeBodega) references EquipajeBodega(IdEquipajeBodega),
constraint fk_EquipajeMano foreign key(IdEquipajeMano) references EquipajeMano(IdEquipajeMano)
)engine=innodb;


create table filaAsiento(
IdAsientoFila int primary key,
LetraAsiento varchar(2)/*A B C D E F G H I J*/
)engine=innodb;

create table Boleto(
NroBoleto int  auto_increment primary key,
HoraSalida date,
FechaViaje date,
HoraViaje time,
Monto float,
IdTipoBoleto int,
viajaMascota boolean,
IdAsientoFila int,
NroColumna int,
IdVuelo int,
constraint  fk_tipoBoleto foreign key(idTipoBoleto) references tipoBoleto(idTipoBoleto),
constraint  fk_asientoFila foreign key(IdAsientoFila) references filaAsiento(IdAsientoFila),
constraint  fk_VueloBoleto foreign key(IdVuelo) references Vuelo(IdVuelo) 
)engine=innodb;


create table Mascota(
IdMascota int auto_increment primary key,
NroBoleto int,
Peso float,
MontoKilo float,
constraint fk_boletoMascota foreign key(NroBoleto) references Boleto(NroBoleto)
)engine=innodb;







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
Estado varchar(30), /*Pendiente, en proceso, finalizado*/
Severidad varchar(20),
Detalle varchar(1000),
Costo float,
FechaI date, /*Fecha inicio*/
FechaR date, /*Fecha reparacion*/
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
FechaI date, /*Fecha inicio*/
FechaR date, /*Fecha reparacion*/
constraint PK_Mantenimiento primary key (IdMantenimiento)
)engine = innoDB;


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





/* En nuestro proceso solo tenemos que generar un documento que notifique al cliente que su equipaje no va a ser enviado en el vuelo asignado,
quedara en lista de espera hasta que el sector de vuelos le asigne un nuevo avion y llegue a destino */



/*
TABLAS DE AYUDA
*/



CREATE TABLE cliente(
	idCliente INT(11) AUTO_INCREMENT,
	nombre VARCHAR(15),
	apellido VARCHAR(15),
	CONSTRAINT pk_vuelo PRIMARY KEY (idCliente)
)engine=innoDB;

/* -------------------------------------------------------------------------------------------------------------- */


CREATE TABLE estadoCheckin(
	idEstado INT(3) AUTO_INCREMENT,
	descripcion VARCHAR(100),
	CONSTRAINT pk_estado PRIMARY KEY(idEstado)
)engine=innoDB;
ALTER TABLE estadoCheckin AUTO_INCREMENT = 1;
INSERT INTO estadoCheckin (descripcion) VALUES('No revisado'), ('Aprobado') ,('Vuelo diferente'), ('PCR positivo'), ('Equipaje extra no abonado'), ('Vuelo reasignado');

create table vueloCliente(
	idVueloCliente INT(11) AUTO_INCREMENT,
	idBoleto INT(11),
	pcr BOOLEAN,
	estado INT(11), /* Tipo de estado dependiendo de la situacion del cliente, ej: 10-falta abonar el equipaje extra */
	CONSTRAINT pk_vuelocliente PRIMARY KEY (idVueloCliente),
	CONSTRAINT fk_estadocheckin FOREIGN KEY (estado) REFERENCES estadoCheckin (idEstado)
)engine=innoDB;
/* Setea el auto incrementable */
ALTER TABLE vueloCliente AUTO_INCREMENT = 1001;



create table equipaje(
	idEquipaje INT(11) AUTO_INCREMENT,
	idVueloCliente INT(11),
	peso INT(3),
	ubicacion VARCHAR(45),
	reasignado BOOLEAN,
	CONSTRAINT pk_equipaje PRIMARY KEY(idEquipaje),
	CONSTRAINT fk_vuelocliente foreign KEY (idVueloCliente) REFERENCES vueloCliente(idVueloCliente)
)engine=innoDB;

ALTER TABLE equipaje AUTO_INCREMENT = 2001;

create table reasignado(
	idReasignado INT(11) AUTO_INCREMENT,
	idEquipaje INT(11),
	idNvuelo INT(1),
	CONSTRAINT pk_reasignado primary KEY(idReasignado),
	CONSTRAINT fk_equipaje_reasignado FOREIGN KEY(idEquipaje) REFERENCES equipaje(idEquipaje),
	CONSTRAINT fk_idNvuelo FOREIGN KEY (idNvuelo) REFERENCES vuelo(idVuelo)
)engine=innoDB;

ALTER TABLE reasignado AUTO_INCREMENT = 3001;

