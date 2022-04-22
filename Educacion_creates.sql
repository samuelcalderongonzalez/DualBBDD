CREATE DATABASE IF NOT EXISTS Educacion;
CREATE TABLE Empresa (
    id_empresa char(10) primary key,
    nombre varchar(30) not null,
    sede varchar(20),
    ambito_profesional varchar(40)
);

CREATE TABLE Formador (
    dni char(9) primary key,
    nombre varchar(30) not null,
    correo varchar(30) not null,
    telefono char(9)
);

CREATE TABLE Curso (
    id_curso char(10) primary key,
    nombre varchar(30) not null
);

CREATE TABLE Modulos (
    id_modulo char(10) primary key,
    nombre varchar(30) not null
);

CREATE TABLE Alumnos (
    dni char(9) primary key,
    nombre varchar(30) not null,
    correo varchar(30) not null,
    telefono char(9)
);

CREATE TABLE Instituto (
    id_instituto char(10) primary key,
    nombre varchar(30) not null,
    provincia varchar(30),
    direccion varchar(30),
    publico_privado varchar(20) check (publico_privado in ('publico', 'privado'))
);

CREATE TABLE Cursa (
	dni_alumno char(9),
    id_modulo char(10),
    nota_final int check (nota_final >= 0 AND nota_final <= 10),
    constraint pk_cursa primary key (dni_alumno, id_modulo),
	constraint fk_alumno foreign key (dni_alumno) references Alumnos(dni),
    constraint fk_modulo foreign key (id_modulo) references Modulos(id_modulo)
);

CREATE TABLE Horarios (
	id_instituto char(10),
    id_curso char(10),
    fecha_inicio date,
    fecha_fin date,
    hora_inicio varchar(10),
    hora_fin varchar(10),
    dias_semana varchar(40),
    constraint pk_horarios primary key (id_instituto, id_curso),
    constraint fk_institutos foreign key (id_instituto) references Instituto(id_instituto),
    constraint fk_cursos foreign key (id_curso) references Cursos(id_curso)
);