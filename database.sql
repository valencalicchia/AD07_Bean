-- Crear base de datos primero
DROP DATABASE IF EXISTS alumnos;
CREATE DATABASE alumnos;

-- Crear usuario después de la BD
DROP USER IF EXISTS 'dam7'@'%';
CREATE USER 'dam7'@'%' IDENTIFIED WITH mysql_native_password BY 'ad07';
GRANT ALL PRIVILEGES ON *.* TO 'dam7'@'%';
FLUSH PRIVILEGES;

USE alumnos;


-- Crear tabla 'alumnos' (si no existe)
CREATE TABLE IF NOT EXISTS alumnos (
    DNI VARCHAR(9) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(70) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    FechaNac DATE NOT NULL,
    PRIMARY KEY (DNI)
);

-- Insertar datos
INSERT INTO alumnos VALUES
('12345678A', 'José Alberto', 'González Pérez', 'C/Albahaca, nº14, 1ºD', '1986-07-15'),
('23456789B', 'Almudena', 'Cantero Verdemar', 'Avd/ Profesor Alvarado, n27, 8ºA', '1988-11-04'),
('14785236D', 'Martín', 'Díaz Jiménez', 'C/Luis de Gongora, nº2.', '1987-03-09'),
('96385274F', 'Lucas', 'Buendía Portes', 'C/Pintor Sorolla, nº 16, 4ºB', '1988-07-10');

-- Crear tabla 'matriculas'
CREATE TABLE IF NOT EXISTS matriculas (
    DNI VARCHAR(9) NOT NULL,
    NombreModulo VARCHAR(60) NOT NULL,
    Curso VARCHAR(5) NOT NULL,
    Nota DOUBLE,
    FOREIGN KEY (DNI) REFERENCES alumnos(DNI)
);

-- Insertar datos en 'matriculas'
INSERT INTO matriculas VALUES
('12345678A', 'Programación', '23-24', 8.5),
('12345678A', 'Bases de Datos', '23-24', 7.3),
('23456789B', 'Entornos de Desarrollo', '23-24', 9.2),
('14785236D', 'Lenguajes de marcas', '22-23', 6.5);
