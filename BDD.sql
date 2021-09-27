/* En nuestro proceso solo tenemos que generar un documento que notifique al cliente que su equipaje no va a ser enviado en el vuelo asignado,
quedara en lista de espera hasta que el sector de vuelos le asigne un nuevo avion y llegue a destino */

DROP database IF EXISTS embarque;
CREATE database embarque;
USE embarque;

/*
TABLAS DE AYUDA
*/

CREATE TABLE vuelo(
	idVuelo INT(11) AUTO_INCREMENT,
	idAvion INT(11),
	fecha VARCHAR(45),
	CONSTRAINT pk_vueloc PRIMARY KEY (idVuelo)
)engine=innoDB;

ALTER TABLE vuelo AUTO_INCREMENT = 4001;
INSERT INTO vuelo (fecha, idAvion) VALUES ('24-10-2021', 11), ('25-10-2021', 4), ('17-11-2021', 1), ('11-12-2021', 38);


CREATE TABLE cliente(
	idCliente INT(11) AUTO_INCREMENT,
	nombre VARCHAR(15),
	apellido VARCHAR(15),
	CONSTRAINT pk_vuelo PRIMARY KEY (idCliente)
)engine=innoDB;

ALTER TABLE cliente AUTO_INCREMENT = 5001;
INSERT INTO cliente (nombre, apellido) VALUES ('Facundo', 'Iglesias'), ('Miguel', 'Marconi'), ('Gustavo', 'Panzitta'), ('Franco', 'Mendoza'), ('Melian', 'Romero');


/* -------------------------------------------------------------------------------------------------------------- */


CREATE TABLE estadoCheckin(
	idEstado INT(3) AUTO_INCREMENT,
	descripcion VARCHAR(100),
	CONSTRAINT pk_estado PRIMARY KEY(idEstado)
)engine=innoDB;
ALTER TABLE  AUTO_INCREMENT = 1;
INSERT INTO estadoCheckin (descripcion) VALUES('No revisado'), ('Aprobado') ,('Vuelo diferente'), ('PCR positivo'), ('Equipaje extra no abonado'), ('Vuelo reasignado');

create table vueloCliente(
	idVueloCliente INT(11) AUTO_INCREMENT,
	idVuelo INT(11),
	idCliente INT(11),
	idBoleto INT(11),
	pcr BOOLEAN,
	estado INT(11), /* Tipo de estado dependiendo de la situacion del cliente, ej: 10-falta abonar el equipaje extra */
	CONSTRAINT pk_vuelocliente PRIMARY KEY (idVueloCliente),
	CONSTRAINT fk_vuelo_vuelocliente FOREIGN KEY (idVuelo) REFERENCES vuelo(idVuelo),
	CONSTRAINT fk_cliente_vuelocliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
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
