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







