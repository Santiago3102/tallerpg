drop table estudiantes;

create table Estudiantes (
estudiante_id int ,
nombre varchar(20) ,
apellido varchar(20) ,
fecha_nacimiento date ,
direccion varchar(50) ,
email varchar(50)
);

create table Profesores(
profesor_id int ,
nombre varchar(20) ,
apellido varchar(20) ,
especialidad varchar(20) ,
fecha_contratacion date ,
email varchar(50)
);

create table Cursos(
curso_id int ,
nombre varchar(20) ,
descripcion varchar(60) ,
creditos int ,
semestre int ,
duracion int
);

create table Inscripciones(
inscripcion_id int ,
estudiante_id int ,
curso_id int,
fecha_inscripcion date ,
calificacion decimal(6,2)
);

create table Clases(
clase_id int ,
profesor_id int ,
curso_id int ,
aula varchar(10) ,
horario varchar(40)
);

-- Valores Tabla estudiantes 

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('1', 'Ana', 'Lopez', '15-3-1998', 'Calle Principal 123', 'ana.lopez@example.com');

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('2', 'Carlos', 'García', '22-7-1997', 'Avenida Central 456', 'carlos.garcia@example.com');

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('3', 'María', 'Fernández', '30-11-1999', 'Calle Secundaria 789', 'maria.fernandez@example.com');

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('4', 'José', 'Martínez', '5-5-1998', 'Plaza Mayor 101', 'jose.martinez@example.com');

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('5', 'Lucía', 'Gómez', '12-12-1997', 'Avenidad Libertad 202', 'lucia.gomez@example.com');

insert into Estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento, direccion, email)
            values('6','Pedro', 'Sánchez', '28-2-1999', 'Calle del Sol 303', 'pedro.sanchez@example.com');

-- Valores Tabla Profesores

insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('1', 'Laura', 'Perez', 'Matematicas', '1-8-2015', 'laura.perez@example.com');


insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('2', 'Miguel', 'Torres', 'Fisica', '15-5-2012', 'miguel.torres@example.com');


insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('3', 'Sofia', 'Morales', 'Programacion', '10-9-2018', 'sofia.morales@example.com');


insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('4', 'Antonio', 'Ruiz', 'Quimica', '20-3-2010', 'antonio.ruiz@example.com');


insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('5', 'Elena', 'Navarro', 'Historia', '25-11-2016', 'elena.navarro@example.com');


insert into Profesores(profesor_id, nombre, apellido, especialidad, fecha_contratacion, email)
            values('6', 'David', 'Romero', 'Idiomas', '4-2-2014', 'david.romero@example.com');

-- Valores Tabla Cursos

insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('1', 'Matematicas I', 'Introduccion al cálculo', '5', '1', '16');


insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('2', 'Fisica I', 'Fundamentos de mecanica clasica', '4', '1', '16');


insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('3', 'Programación básica', 'Introduccion a la programación', '6', '1', '16');


insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('4', 'Quimica General', 'Conceptos básicos de química', '4', '1', '16');


insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('5', 'Historia Universal', 'Recorrido por la historia mundial', '3', '1', '16');


insert into Cursos(curso_id, nombre, descripcion, creditos, semestre, duracion)
            values('6', 'Ingles I', 'Curso básico de inglés', '3', '1', '16');

-- Valores Tabla Inscripciones

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('1', '1', '1', '1-8-2021', '8.5');

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('2', '1', '3', '1-8-2021', '9');

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('3', '2', '4', '2-8-2021', '7.5');

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('4', '3', '4', '3-8-2021', '8');

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('5', '4', '1', '4-8-2021', '9.2');

insert into Inscripciones(inscripcion_id, estudiante_id, curso_id, fecha_inscripcion, calificacion)
            values('6', '3', '6', '5-8-2021', '7.8');


-- Valores Tabla Clases 

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('1', '1', '6', 'A101', 'Lunes 8:00 - 10:00');

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('2', '2', '1', 'B202', 'Martes 10:00 - 12:00');

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('3', '3', '2', 'C303', 'Miercoles 12:00 - 14:00');

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('4', '4', '5', 'D404', 'Jueves 14:00 - 16:00');

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('5', '3', '5', 'E505', 'Viernes 16:00 - 18:00');

insert into Clases(clase_id, profesor_id, curso_id, aula, horario)
            values('6', '6', '1', 'F606', 'Sabado 9:00 - 11:00');

-- Creacion de las llaves primarias de las tablas

alter table Estudiantes add constraint pk_estudiantes primary key(estudiante_id);

alter table Profesores add constraint pk_profesores primary key(profesor_id);

alter table Cursos add constraint pk_cursos primary key(curso_id);

alter table Inscripciones add constraint pk_inscripciones primary key(inscripcion_id);

alter table Clases add constraint pk_clases primary key(clase_id);


-- Creacion de las llaves foraneas de las tablas 

alter table Inscripciones add constraint fk_inscripciones_estudiantes
foreign key (inscripcion_id) references Inscripciones(inscripcion_id);

alter table Inscripciones add constraint fk_inscripciones_cursos
foreign key (curso_id) references Cursos(curso_id);

alter table Clases add constraint fk_clases_profesores
foreign key (profesor_id) references Profesores(profesor_id);

alter table Clases add constraint fk_clases_cursos
foreign key (curso_id) references Cursos(curso_id);



