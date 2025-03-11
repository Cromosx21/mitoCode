-- Verificar si la base de datos ya existe antes de crearla
CREATE DATABASE IF NOT EXISTS DBMetaWill;
USE DBMetaWill;

-- Verificar si cada tabla ya existe antes de crearla
CREATE TABLE IF NOT EXISTS Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    subtitulo VARCHAR(255),
    fecha_inicio DATE,
    modalidad VARCHAR(50),
    semanas VARCHAR(50),
    horas VARCHAR(50),
    precio DECIMAL(10,2),
    estado VARCHAR(50),
    categoria VARCHAR(100),
    imagen VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Docentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    imagen VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS DetallesCurso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    id_docente INT,
    acerca TEXT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_docente) REFERENCES Docentes(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Temarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    tema VARCHAR(255),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Habilidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    habilidad VARCHAR(255),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PublicoObjetivo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    publico VARCHAR(255),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id) ON DELETE CASCADE
);
