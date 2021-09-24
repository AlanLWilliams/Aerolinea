drop database if exists aerolinea;
create database aerolinea;
use aereolinea;

create table Boleto(
NroBoleto int  auto_increment primary key,
HoraSalida date,
FechaViaje date,
HoraViaje time,
Monto float,
IdTipoBoleto int,
viajaMascota boolean,
/*IdVuelo int,*/
constraint  fk_tipoBoleto foreign key(idTipoBoleto) references tipoBoleto(idTipoBoleto)
/*,constraint  fk_Vuelo foreign key(IdVuelo) references vuelo(IdVuelo)      cuando se haga el marge, se descomenta con el atributo especifico*/
)engine=innodb;

create table tipoBoleto{
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
}
create table Mascota{
IdMascota int auto_increment primary key,
NroBoleto int,
Peso float,
MontoKilo float,
constraint fk_boletoMascota foreign key(NroBoleto) references Boleto(NroBoleto)
}

create table EquipajeBodega{
IdEquipajeBodega int auto_increment primary key
PiezaKilo int,
MontoExcesoEquipaje int
}

create table EquipajeMano{
IdEquipajeMano int auto_increment primary key
PiezaKilo int,
MontoExcesoEquipaje int
}

create table filaAsiento{
IdAsiento int primary key,
LetraAsiento varchar(2)/*A B C D E F G H I J*/
}




/*
create table TicketFactura{
nroTF int auto_increment primary key,
Tipo varchar(2),/* A o B*/
/*IVA  varchar(30),/*Responsable Inscripto o Consumidor Final*/
/*importeF float,
idEmpleado int,/*Este es la foreing key de el empleado*/
/*fecha date,
constraint  fk_empleado foreign key(idEmpleado) references Empleado(idEmpleado)
}Engine=innoDB;

create table datosTFA{
nroTFA int auto_increment
}
*/
