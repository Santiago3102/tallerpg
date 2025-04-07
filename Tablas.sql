-- Creación de las tablas para la Base de datos


create table Proveedores(
 v_id varchar(4),
 proveedor varchar(12),
 status int,
 ciudad varchar(10)
);


create table Partes(
 p_id varchar(4),
 parte varchar(10),
 color varchar(10),
 peso decimal(6,2),
 ciudad varchar(10)
);

create table Proyectos(
 y_id varchar(4),
 proyecto varchar(14),
 ciudad varchar(10)
);


create table Envios(
 v_id varchar(4),
 p_id varchar(4),
 y_id varchar(4),
 cant int
)


-- Ingreso de datos para la Base 

-- Datos para la tabla de proveedores 

insert into Proveedores (v_id, proveedor, status, ciudad)
       values ('V1', 'Smith', '20', 'Londres');

insert into Proveedores (v_id, proveedor, status, ciudad)
       values ('V2', 'jones', '10', 'Paris');

insert into Proveedores (v_id, proveedor, status, ciudad)
       values ('V3', 'Blake', '30', 'Paris');

insert into Proveedores (v_id, proveedor, status, ciudad)
       values ('V4', 'Clark', '20', 'Londres');

insert into Proveedores (v_id, proveedor, status, ciudad)
       values ('V5', 'Adams', '30', 'Atenas');


-- Datos para la tabla partes 

insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P1', 'Tuerca', 'Rojo', '12.0', 'Londres');


insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P2', 'Perno', 'Verde', '17.0', 'Paris');


insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P3', 'Tornillo', 'Azul', '17.0', 'Roma');


insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P4', 'Tornillo', 'Rojo', '14.0', 'Londres');


insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P5', 'Leva', 'Azul', '12.0', 'Paris');


insert into Partes (p_id, parte, color, peso, ciudad)
       values ('P6', 'Engrane', 'Rojo', '19.0', 'Londres');



-- Datos para Proyectos 

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y1', 'Clasificador', 'Paris');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y2', 'Monitor', 'Roma');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y3', 'OCR', 'Atenas');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y4', 'Consola', 'Atenas');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y5', 'RAID', 'Londres');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y6', 'EDS', 'Oslo');

insert into Proyectos (y_id, proyecto, ciudad)
       values ('Y7', 'Cinta', 'Londres');


-- Insertar datos para VPY

insert into Envios (v_id, p_id, y_id, cant)
       values ('V1', 'P1', 'Y1', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V1', 'P1', 'Y4', '700');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y1', '400');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y2', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y3', '500');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y4', '600');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y5', '400');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P3', 'Y7', '800');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V2', 'P5', 'Y2', '100');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V3', 'P3', 'Y1', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V3', 'P4', 'Y2', '500');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V4', 'P6', 'Y3', '300');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V4', 'P6', 'Y7', '300');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P2', 'Y2', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P2', 'Y4', '100');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P5', 'Y5', '500');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P5', 'Y7', '100');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P6', 'Y2', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P1', 'Y4', '100');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P3', 'Y4', '200');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P4', 'Y4', '800');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P5', 'Y4', '400');

insert into Envios (v_id, p_id, y_id, cant)
       values ('V5', 'P6', 'Y4', '500');


-- Creacion de llaves pk y fk

-- pk's

alter table Proveedores add constraint pk_proveedor primary key(v_id);

alter table Partes add constraint pk_parte primary key(p_id);

alter table Proyectos add constraint pk_proyecto primary key(y_id);

alter table Envios add constraint pk_envio primary key(v_id, p_id, y_id);

--fk's

alter table Envios add constraint fk_proveedor_envio
foreign key (v_id) references Proveedores(v_id);

alter table Envios add constraint fk_parte_envio
foreign key (p_id) references Partes(p_id);

alter table Envios add constraint fk_proyecto_envio
foreign key (Y_id) references Proyectos(y_id);


