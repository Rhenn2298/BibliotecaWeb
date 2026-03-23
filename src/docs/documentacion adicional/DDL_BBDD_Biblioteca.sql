CREATE DATABASE biblioteca;
USE biblioteca;
-- eliminacion de tablas
drop table copias;
-- Tabla LIBROS
drop table libros;
SELECT * from usuarios;
SELECT * from libros;
SELECT * from copias;
CREATE TABLE libros (
    isbn VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    editorial VARCHAR(255),
    año_publicacion INT
);
-- Tabla COPIAS
drop table copias;
CREATE TABLE copias (
    id_copia VARCHAR(255) PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    número_copia INT NOT NULL,
    disponible BOOLEAN DEFAULT true,
    FOREIGN KEY (isbn) REFERENCES libros(isbn)
);

-- Tabla USUARIOS
drop table usuarios;
CREATE TABLE usuarios (
    rut VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    correo VARCHAR(255),
    rol VARCHAR(20) NOT NULL
);
-- Tabla PRESTAMOS
drop table prestamos;
CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(12) NOT NULL,
    id_copia VARCHAR(255) NOT NULL,
    fecha_solicitud DATE NOT NULL,
    fecha_entrega DATE,
    fecha_vencimiento DATE,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (rut) REFERENCES usuarios(rut),
    FOREIGN KEY (id_copia) REFERENCES copias(id_copia)
);
