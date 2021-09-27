use aerolinea;

create table Vuelo(
IdVuelo int auto_increment,
IdAvion int,
Escala boolean,
SFechaEst datetime,
SFechaReal datetime,
DestinoFinal char,
constraint PK_Vuelos primary key(IdVuelo),
constraint FK_Avion foreign key(IdAvion) references Avion(IdAvion)
)engine=innoDB;

create table Vuelo-Escala (
IdVuelo int,
IdEscala int,
Millas int,
constraint PK_VueloEsc primary key (IdVuelo,IdEscala),
constraint FK_Vue foreign key (IdVuelo) references Vuelo(IdVuelo),
constraint FK_Esc foreign key (IdEscala) references Escala(IdEscala);
)engine=innoDB;

create table vuelo-Pasajeros(
IdVuelo int auto_increment,
IdPasajeros int,
constraint PK_Vuelos primary key(IdVuelo, IdPasajeros),
constraint FK_Avion foreign key(IdAvion) references Avion(IdAvion),
constraint FK_Pasajeros foreign key(IdPasajeros) references Pasajeros(IdPasajeros)
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
) engine = innoDB

