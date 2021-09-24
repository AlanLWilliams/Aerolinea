drop database if exists aerolinea;
create database aerolinea;
use aerolinea;




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
/*IdVuelo int,*/
constraint  fk_tipoBoleto foreign key(idTipoBoleto) references tipoBoleto(idTipoBoleto),
constraint  fk_asientoFila foreign key(IdAsientoFila) references filaAsiento(IdAsientoFila)
/*,constraint  fk_Vuelo foreign key(IdVuelo) references vuelo(IdVuelo)      cuando se haga el marge, se descomenta con el atributo especifico*/
)engine=innodb;


create table Mascota(
IdMascota int auto_increment primary key,
NroBoleto int,
Peso float,
MontoKilo float,
constraint fk_boletoMascota foreign key(NroBoleto) references Boleto(NroBoleto)
)engine=innodb;





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

create table Persona(
IdPersona int auto_increment,
Nombre varchar(50),
Apellido varchar(50),
DNI int,
Telefono int,
Mail varchar(50),
constraint PK_Persona primary key (IdPersona),
)engine=innoDB;

create table Tripulante(
IdTripulante int auto_increment,
IdPersona int,
IdPuesto int,
constraint PK_Tripulante primary key (IdTripulante),
constraint FK_Tripulante foreign key (IdPersona) references Persona(IdPersona),
constraint FK_Tripulante2 foreign key (IdPuesto) references Puesto(IdPuesto)
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

