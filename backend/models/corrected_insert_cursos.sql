CREATE DATABASE IF NOT EXISTS DBMeta;
USE DBMeta;

-- Tabla de Modulo (Hace referencia a la categoría del curso)
CREATE TABLE IF NOT EXISTS T_Modulo(
    c_idmodulo INT PRIMARY KEY AUTO_INCREMENT,
    c_nombremodulo VARCHAR(255) -- Nombre de la categoría (Diseño gráfico, Ofimática, Base de datos, etc.)
);

-- Tabla de Cursos
CREATE TABLE IF NOT EXISTS T_Cursos (
    c_idcurso VARCHAR(10) PRIMARY KEY,  -- Formato: C00001
    c_nombre VARCHAR(255) NOT NULL,
    c_subtitulo VARCHAR(255),
    c_imagen VARCHAR(255),  -- Ruta o URL de la imagen
    c_modalidad ENUM('Presencial', 'Grabado', 'En vivo') NOT NULL,
    c_duracion INT NOT NULL,  -- En semanas o meses
    c_horas INT NOT NULL,  -- Total de horas del curso
    c_idmodulo int not null,
    c_fechainicio DATE NOT NULL,
    c_precio FLOAT NOT NULL,
    c_estado ENUM('Cupos Libres', 'Curso Iniciado') NOT NULL,
    c_descripcion TEXT,
    FOREIGN KEY (c_idmodulo) references T_Modulo(c_idmodulo) on delete cascade
);

-- Tabla de Contenido (Cada curso tiene varios Contenidos)
CREATE TABLE IF NOT EXISTS T_Contenido (
    c_idcontenido INT AUTO_INCREMENT PRIMARY KEY,
    c_idcurso VARCHAR(10) NOT NULL,
    c_descripcion VARCHAR(255),
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE
);

-- Tabla de Detalle Contenido (Cada Contenido tiene varios detalles de contenido)
CREATE TABLE IF NOT EXISTS T_DetalleContenido (
    c_iddetalle_contenido INT AUTO_INCREMENT PRIMARY KEY,
    c_idcontenido INT NOT NULL,
    c_descripcion VARCHAR(255),
    FOREIGN KEY (c_idcontenido) REFERENCES T_Contenido(c_idcontenido) ON DELETE CASCADE
);

-- Tabla de Docentes
CREATE TABLE IF NOT EXISTS T_Docente (
    c_iddocente INT AUTO_INCREMENT PRIMARY KEY,
    c_nombredocente VARCHAR(255) NOT NULL,
    c_fotodocente VARCHAR(255)  -- Ruta o URL de la imagen del docente
);

-- Tabla de Horarios
CREATE TABLE IF NOT EXISTS T_Horario (
    c_idhorario INT AUTO_INCREMENT PRIMARY KEY,
    c_dia ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    c_hora_inicio TIME NOT NULL,
    c_hora_fin TIME NOT NULL
);

-- Tabla de Informe del Curso (Centro de Información)
CREATE TABLE IF NOT EXISTS T_InformeCurso (
    c_idinforme INT AUTO_INCREMENT PRIMARY KEY,
    c_idcurso VARCHAR(10) NOT NULL,
    c_iddocente INT NOT NULL,
    c_idhorario INT NOT NULL,
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_iddocente) REFERENCES T_Docente(c_iddocente) ON DELETE CASCADE,
    FOREIGN KEY (c_idhorario) REFERENCES T_Horario(c_idhorario) ON DELETE CASCADE
);

-- Tabla de Preguntas Frecuentes
CREATE TABLE IF NOT EXISTS T_Preguntas (
    c_idpregunta INT AUTO_INCREMENT PRIMARY KEY,
    c_pregunta TEXT NOT NULL,
    c_respuesta TEXT NOT NULL
);

-- Tabla de Contacto
CREATE TABLE IF NOT EXISTS T_Contacto (
    c_idcontacto INT AUTO_INCREMENT PRIMARY KEY,
    c_telefono VARCHAR(20),
    c_correo VARCHAR(255),
    c_direccion VARCHAR(255)
);

-- Nueva Tabla: Sectores a los que está dirigido el curso
CREATE TABLE IF NOT EXISTS T_Dirigido (
    c_iddirigido INT AUTO_INCREMENT PRIMARY KEY,
    c_sector VARCHAR(255) NOT NULL  -- Ejemplo: "Estudiantes", "Profesionales", etc.
);

-- Nueva Tabla: Habilidades que se desarrollan en el curso
CREATE TABLE IF NOT EXISTS T_Habilidades (
    c_idhabilidad INT AUTO_INCREMENT PRIMARY KEY,
    c_habilidad VARCHAR(255) NOT NULL  -- Ejemplo: "Conocimientos avanzados", "Casos de estudio", etc.
);

-- Tabla Intermedia: Relación Cursos ↔ Sectores Dirigidos (Un curso puede estar dirigido a varios sectores)
CREATE TABLE IF NOT EXISTS T_Cursos_Dirigido (
    c_idcurso VARCHAR(10) NOT NULL,
    c_iddirigido INT NOT NULL,
    PRIMARY KEY (c_idcurso, c_iddirigido),
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_iddirigido) REFERENCES T_Dirigido(c_iddirigido) ON DELETE CASCADE
);

-- Tabla Intermedia: Relación Cursos ↔ Habilidades (Un curso puede desarrollar varias habilidades)
CREATE TABLE IF NOT EXISTS T_Cursos_Habilidades (
    c_idcurso VARCHAR(10) NOT NULL,
    c_idhabilidad INT NOT NULL,
    PRIMARY KEY (c_idcurso, c_idhabilidad),
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_idhabilidad) REFERENCES T_Habilidades(c_idhabilidad) ON DELETE CASCADE
);


-- Insertar Modulo
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Ofimática');
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Diseño Web');
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Diseño Gráfico');
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Base de Datos');
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Programación');
INSERT INTO T_Modulo (c_nombremodulo) VALUES ('Tecnologías');

-- Insertar docentes
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Juan Pérez', 'juan_perez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('María López', 'maria_lopez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Carlos Rodríguez', 'carlos_rodriguez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Ana González', 'ana_gonzalez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Luis Fernández', 'luis_fernandez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Sofía Martínez', 'sofia_martinez.jpg');

-- Insertar horarios
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Lunes', '08:00','10:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Martes', '06:00', '08:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Miércoles', '04:00','06:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Jueves', '10:00','12:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Viernes', '02:00','04:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Sábado', '09:00','11:00');
INSERT INTO T_Horario (c_dia, c_hora_inicio, c_hora_fin) VALUES ('Domingo', '09:00','11:00');

-- Insertar Sectores Dirigidos
INSERT INTO T_Dirigido (c_sector) VALUES 
('Estudiantes'),
('Profesionales'),
('Interesados en el tema');

-- Insertar Habilidades
INSERT INTO T_Habilidades (c_habilidad) VALUES 
('Conocimientos básicos y avanzados del tema'),
('Aplicaciones prácticas'),
('Casos de estudio');


-- Insertar Preguntas y Respuestas
INSERT INTO T_Preguntas (c_pregunta, c_respuesta) VALUES
(
    "¿Cómo son las clases y el acceso al curso?",
    "Si el curso es ONLINE EN VIVO será desarrollado vía ZOOM y quedan grabadas para posterior repaso desde nuestro campus virtual, los videos no son descargables pero están disponibles las 24 horas del día, el código y guías si son descargables, además tendrás soporte a tus dudas en vivo en las clases o luego vía mail o discord. Si el curso es de tipo grabado podrás revisar su contenido en el campus virtual y enviar tus consultas también bajo mail o discord. El acceso al campus virtual es de por vida, es decir terminas el curso y podrás seguir accediendo a su contenido."
),
(
    "Si no puedo asistir a clases en vivo ¿Cómo puedo revisarlo?",
    "Podrás revisar después desde nuestro campus virtual."
),
(
    "¿Se emite certificado al finalizar el curso?",
    "Sí, tras aprobar el curso podrás emitir un certificado de conclusión del curso. El certificado es digital [PDF] a nombre de la empresa MetaWill, en el cuál indica la modalidad online, cantidad de horas, fecha y hora de inicio, fin del curso y un QR con la información del curso."
),
(
    "Tengo empresa o una empresa pagará el curso, ¿Emiten factura?",
    "Sí, emitimos la factura con validez tributaria en Perú. Si eres de otro país deberás agregar los impuestos correspondientes."
);


-- Insertar cursos y relaciones

-- Insertar datos de curso
INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-1', 'Windows 11', 'Introducción a Windows 11', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Windows 11 está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

-- Insertar  datos en T_informeCurso
INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-1', 1, 1);

-- Insertar datos en T_Cursos_Dirigido y T_Cursos_Habilidades
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';

-- Insertar datos de curso
INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-2', 'Word 2021 - Basico', 'Introducción a Word 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Word 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

-- Insertar  datos en T_informeCurso
INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-2', 2, 2);

-- Insertar datos en T_Cursos_Dirigido y T_Cursos_Habilidades
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Formato de documentos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de estilos y plantillas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Trabajo con tablas e imágenes';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-3', 'Word 2021  - Intermedio', 'Introducción a Word 2021  - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Word 2021  - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-3', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Formato de documentos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de estilos y plantillas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Trabajo con tablas e imágenes';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-4', 'Excel 2021 - Basico', 'Introducción a Excel 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Excel 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-4', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-5', 'Excel 2021 - Intermedio', 'Introducción a Excel 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Excel 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-5', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-6', 'Excel 2021 - Avanzado', 'Introducción a Excel 2021 - Avanzado', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Excel 2021 - Avanzado está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-6', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-7', 'Power Point - Basico', 'Introducción a Power Point - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Power Point - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-7', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-8', 'Power Point - Intermedio', 'Introducción a Power Point - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 1, 150, 'Cupos Libres', 'Este curso de Power Point - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-8', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-9', 'Diseño Web I', 'Introducción a Diseño Web I', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 2, 200, 'Cupos Libres', 'Este curso de Diseño Web I está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-9', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-10', 'Diseño Web II', 'Introducción a Diseño Web Ii', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 2, 200, 'Cupos Libres', 'Este curso de Diseño Web Ii está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-10', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-11', 'Corel Draw - Basico', 'Introducción a Corel Draw - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 200, 'Cupos Libres', 'Este curso de Corel Draw - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-11', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-12', 'Corel Draw - Intermedio', 'Introducción a Corel Draw - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 150, 'Cupos Libres', 'Este curso de Corel Draw - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-12', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-13', 'Ilustrator - Basico', 'Introducción a Ilustrator - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 150, 'Cupos Libres', 'Este curso de Ilustrator - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-13', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-14', ' Ilustrator - Intermedio', 'Introducción a  Ilustrator - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 150, 'Cupos Libres', 'Este curso de  Ilustrator - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-14', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-15', 'Photoshop - Basico', 'Introducción a Photoshop - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 150, 'Cupos Libres', 'Este curso de Photoshop - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-15', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Edición y retoque de imágenes';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de capas y filtros';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Creación de diseños gráficos';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-16', ' Photoshop - Intermedio', 'Introducción a  Photoshop - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 3, 150, 'Cupos Libres', 'Este curso de  Photoshop - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-16', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Edición y retoque de imágenes';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de capas y filtros';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Creación de diseños gráficos';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-17', ' Sql 2021 -  Basico', 'Introducción a  Sql 2021 -  Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 4, 250, 'Cupos Libres', 'Este curso de  Sql 2021 -  Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-17', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-18', ' Sql 2021 - Intermedio', 'Introducción a  Sql 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 4, 250, 'Cupos Libres', 'Este curso de  Sql 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-18', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-19', 'Mysql 2021 - Basico', 'Introducción a Mysql 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 4, 250, 'Cupos Libres', 'Este curso de Mysql 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-19', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de bases de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Consultas SQL avanzadas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Optimización de rendimiento';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-20', ' Mysql 2021 - Intermedio', 'Introducción a  Mysql 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 4, 250, 'Cupos Libres', 'Este curso de  Mysql 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-20', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de bases de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Consultas SQL avanzadas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Optimización de rendimiento';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-21', 'Php - Basico', 'Introducción a Php - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Php - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-21', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-22', 'Php - Intermedio', 'Introducción a Php - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Php - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-22', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-23', ' Programación C# -  Basico', 'Introducción a  Programación C# -  Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Programación C# -  Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-23', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-24', ' Programación C# -  Intermedio', 'Introducción a  Programación C# -  Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Programación C# -  Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-24', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-25', ' Java - Basico', 'Introducción a  Java - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Java - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-25', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Programación orientada a objetos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de excepciones';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-26', ' Java - Intermedio', 'Introducción a  Java - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Java - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-26', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Programación orientada a objetos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de excepciones';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-27', 'Android  - Basico', 'Introducción a Android  - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Android  - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-27', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-28', ' Android - Intermedio', 'Introducción a  Android - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Android - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-28', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-29', 'Python - Basico', 'Introducción a Python - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Python - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-29', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Sintaxis y estructuras de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Automatización de tareas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-30', ' Python - Intermedio', 'Introducción a  Python - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Python - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-30', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Sintaxis y estructuras de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Automatización de tareas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-31', 'Marketing Digital', 'Introducción a Marketing Digital', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Marketing Digital está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-31', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Estrategias de marketing digital';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'SEO y SEM';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Gestión de redes sociales';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-32', ' Gestion Redes Sociales', 'Introducción a  Gestion Redes Sociales', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Gestion Redes Sociales está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-32', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-33', ' Power Bi Basico', 'Introducción a  Power Bi Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Power Bi Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-33', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-34', ' Power Bi Intermedio', 'Introducción a  Power Bi Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de  Power Bi Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-34', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-35', 'Autocad Basico', 'Introducción a   Autocad Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de   Autocad Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-35', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-36', 'Autocad Intermedio', 'Introducción a   Autocad Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de   Autocad Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-36', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-37', 'ITIL', 'Introducción a ITIL', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de ITIL está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-37', 1, 1);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-38', 'Cyberseguridad', 'Introducción a Cyberseguridad', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Cyberseguridad está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');


INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-38', 2, 2);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';

INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-39', 'Scrum', 'Introducción a Scrum', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Scrum está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');


INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-39', 3, 3);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-40', 'Gestion De Proyectos I', 'Introducción a Gestion De Proyectos I', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Gestion De Proyectos I está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-40', 4, 4);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-41', 'Office 365', 'Introducción a Office 365', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Office 365 está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-41', 5, 5);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_idmodulo, c_precio, c_estado, c_descripcion)
VALUES ('curso-42', 'Azure', 'Introducción a Azure', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 5, 250, 'Cupos Libres', 'Este curso de Azure está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');

INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario) VALUES ('curso-42', 6, 6);

INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';


-- Insertar contenido para cada curso
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-1', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-1', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-1', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-1', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-2', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-2', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-2', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-2', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-3', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-3', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-3', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-3', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-4', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-4', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-4', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-4', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-5', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-5', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-5', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-5', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-6', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-6', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-6', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-6', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-7', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-7', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-7', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-7', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-8', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-8', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-8', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-8', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-9', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-9', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-9', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-9', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-10', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-10', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-10', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-10', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-11', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-11', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-11', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-11', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-12', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-12', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-12', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-12', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-13', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-13', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-13', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-13', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-14', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-14', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-14', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-14', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-15', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-15', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-15', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-15', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-16', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-16', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-16', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-16', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-17', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-17', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-17', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-17', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-18', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-18', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-18', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-18', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-19', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-19', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-19', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-19', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-20', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-20', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-20', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-20', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-21', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-21', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-21', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-21', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-22', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-22', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-22', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-22', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-23', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-23', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-23', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-23', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-24', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-24', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-24', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-24', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-25', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-25', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-25', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-25', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-26', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-26', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-26', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-26', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-27', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-27', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-27', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-27', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-28', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-28', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-28', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-28', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-29', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-29', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-29', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-29', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-30', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-30', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-30', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-30', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-31', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-31', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-31', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-31', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-32', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-32', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-32', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-32', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-33', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-33', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-33', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-33', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-34', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-34', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-34', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-34', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-35', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-35', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-35', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-35', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-36', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-36', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-36', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-36', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-37', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-37', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-37', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-37', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-38', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-38', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-38', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-38', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-39', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-39', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-39', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-39', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-40', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-40', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-40', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-40', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-41', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-41', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-41', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-41', 'Clase #4');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-42', 'Clase #1');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-42', 'Clase #2');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-42', 'Clase #3');
INSERT INTO T_Contenido (c_idcurso, c_descripcion) VALUES ('curso-42', 'Clase #4');

-- Insertar detalles de contenido para cada clase
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (1, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (1, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (1, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (1, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (2, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (2, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (2, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (2, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (3, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (3, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (3, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (3, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (4, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (4, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (4, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (4, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (5, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (5, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (5, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (5, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (6, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (6, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (6, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (6, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (7, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (7, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (7, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (7, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (8, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (8, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (8, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (8, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (9, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (9, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (9, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (9, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (10, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (10, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (10, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (10, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (11, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (11, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (11, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (11, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (12, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (12, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (12, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (12, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (13, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (13, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (13, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (13, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (14, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (14, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (14, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (14, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (15, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (15, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (15, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (15, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (16, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (16, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (16, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (16, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (17, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (17, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (17, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (17, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (18, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (18, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (18, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (18, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (19, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (19, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (19, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (19, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (20, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (20, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (20, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (20, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (21, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (21, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (21, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (21, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (22, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (22, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (22, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (22, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (23, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (23, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (23, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (23, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (24, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (24, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (24, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (24, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (25, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (25, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (25, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (25, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (26, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (26, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (26, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (26, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (27, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (27, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (27, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (27, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (28, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (28, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (28, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (28, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (29, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (29, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (29, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (29, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (30, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (30, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (30, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (30, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (31, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (31, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (31, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (31, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (32, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (32, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (32, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (32, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (33, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (33, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (33, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (33, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (34, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (34, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (34, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (34, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (35, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (35, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (35, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (35, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (36, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (36, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (36, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (36, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (37, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (37, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (37, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (37, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (38, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (38, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (38, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (38, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (39, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (39, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (39, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (39, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (40, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (40, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (40, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (40, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (41, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (41, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (41, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (41, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (42, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (42, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (42, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (42, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (43, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (43, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (43, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (43, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (44, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (44, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (44, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (44, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (45, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (45, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (45, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (45, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (46, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (46, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (46, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (46, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (47, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (47, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (47, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (47, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (48, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (48, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (48, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (48, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (49, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (49, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (49, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (49, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (50, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (50, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (50, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (50, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (51, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (51, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (51, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (51, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (52, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (52, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (52, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (52, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (53, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (53, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (53, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (53, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (54, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (54, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (54, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (54, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (55, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (55, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (55, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (55, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (56, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (56, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (56, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (56, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (57, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (57, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (57, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (57, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (58, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (58, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (58, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (58, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (59, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (59, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (59, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (59, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (60, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (60, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (60, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (60, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (61, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (61, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (61, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (61, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (62, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (62, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (62, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (62, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (63, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (63, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (63, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (63, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (64, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (64, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (64, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (64, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (65, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (65, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (65, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (65, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (66, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (66, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (66, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (66, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (67, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (67, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (67, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (67, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (68, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (68, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (68, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (68, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (69, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (69, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (69, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (69, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (70, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (70, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (70, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (70, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (71, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (71, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (71, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (71, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (72, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (72, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (72, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (72, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (73, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (73, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (73, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (73, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (74, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (74, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (74, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (74, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (75, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (75, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (75, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (75, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (76, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (76, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (76, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (76, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (77, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (77, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (77, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (77, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (78, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (78, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (78, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (78, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (79, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (79, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (79, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (79, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (80, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (80, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (80, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (80, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (81, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (81, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (81, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (81, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (82, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (82, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (82, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (82, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (83, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (83, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (83, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (83, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (84, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (84, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (84, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (84, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (85, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (85, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (85, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (85, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (86, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (86, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (86, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (86, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (87, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (87, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (87, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (87, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (88, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (88, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (88, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (88, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (89, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (89, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (89, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (89, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (90, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (90, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (90, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (90, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (91, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (91, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (91, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (91, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (92, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (92, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (92, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (92, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (93, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (93, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (93, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (93, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (94, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (94, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (94, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (94, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (95, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (95, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (95, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (95, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (96, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (96, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (96, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (96, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (97, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (97, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (97, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (97, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (98, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (98, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (98, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (98, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (99, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (99, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (99, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (99, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (100, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (100, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (100, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (100, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (101, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (101, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (101, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (101, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (102, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (102, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (102, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (102, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (103, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (103, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (103, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (103, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (104, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (104, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (104, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (104, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (105, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (105, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (105, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (105, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (106, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (106, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (106, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (106, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (107, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (107, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (107, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (107, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (108, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (108, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (108, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (108, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (109, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (109, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (109, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (109, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (110, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (110, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (110, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (110, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (111, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (111, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (111, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (111, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (112, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (112, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (112, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (112, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (113, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (113, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (113, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (113, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (114, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (114, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (114, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (114, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (115, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (115, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (115, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (115, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (116, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (116, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (116, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (116, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (117, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (117, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (117, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (117, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (118, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (118, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (118, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (118, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (119, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (119, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (119, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (119, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (120, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (120, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (120, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (120, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (121, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (121, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (121, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (121, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (122, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (122, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (122, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (122, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (123, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (123, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (123, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (123, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (124, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (124, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (124, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (124, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (125, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (125, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (125, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (125, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (126, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (126, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (126, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (126, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (127, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (127, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (127, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (127, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (128, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (128, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (128, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (128, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (129, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (129, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (129, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (129, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (130, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (130, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (130, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (130, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (131, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (131, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (131, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (131, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (132, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (132, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (132, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (132, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (133, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (133, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (133, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (133, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (134, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (134, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (134, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (134, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (135, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (135, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (135, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (135, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (136, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (136, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (136, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (136, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (137, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (137, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (137, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (137, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (138, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (138, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (138, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (138, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (139, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (139, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (139, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (139, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (140, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (140, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (140, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (140, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (141, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (141, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (141, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (141, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (142, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (142, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (142, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (142, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (143, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (143, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (143, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (143, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (144, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (144, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (144, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (144, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (145, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (145, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (145, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (145, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (146, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (146, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (146, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (146, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (147, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (147, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (147, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (147, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (148, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (148, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (148, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (148, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (149, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (149, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (149, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (149, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (150, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (150, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (150, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (150, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (151, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (151, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (151, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (151, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (152, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (152, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (152, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (152, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (153, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (153, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (153, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (153, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (154, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (154, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (154, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (154, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (155, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (155, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (155, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (155, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (156, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (156, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (156, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (156, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (157, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (157, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (157, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (157, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (158, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (158, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (158, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (158, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (159, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (159, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (159, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (159, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (160, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (160, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (160, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (160, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (161, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (161, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (161, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (161, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (162, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (162, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (162, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (162, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (163, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (163, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (163, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (163, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (164, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (164, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (164, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (164, 'Detalle #4 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (165, 'Detalle #1 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (165, 'Detalle #2 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (165, 'Detalle #3 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (165, 'Detalle #4 de Clase #1');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (166, 'Detalle #1 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (166, 'Detalle #2 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (166, 'Detalle #3 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (166, 'Detalle #4 de Clase #2');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (167, 'Detalle #1 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (167, 'Detalle #2 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (167, 'Detalle #3 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (167, 'Detalle #4 de Clase #3');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (168, 'Detalle #1 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (168, 'Detalle #2 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (168, 'Detalle #3 de Clase #4');
INSERT INTO T_DetalleContenido (c_idcontenido, c_descripcion) VALUES (168, 'Detalle #4 de Clase #4');


use dbmeta;
SELECT * from t_preguntas

