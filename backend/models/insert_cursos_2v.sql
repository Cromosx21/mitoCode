CREATE DATABASE DBMeta;
USE DBMeta;

-- Tabla de Cursos
CREATE TABLE T_Cursos (
    c_idcurso VARCHAR(10) PRIMARY KEY,  -- Formato: C00001
    c_nombre VARCHAR(255) NOT NULL,
    c_subtitulo VARCHAR(255),  -- Nuevo campo
    c_imagen VARCHAR(255),  -- Ruta o URL de la imagen
    c_modalidad ENUM('Presencial', 'Grabado', 'En vivo') NOT NULL,
    c_duracion INT NOT NULL,  -- En semanas o meses
    c_horas INT NOT NULL,  -- Nuevo campo (total de horas del curso)
    c_fechainicio DATE NOT NULL,
    c_categoria VARCHAR(100) NOT NULL,
    c_precio FLOAT NOT NULL,
    c_estado ENUM('Cupos Libres', 'Curso Iniciado') NOT NULL,
    c_descripcion TEXT
);

-- Tabla de Módulos (Cada curso tiene varios módulos)
CREATE TABLE T_Modulo (
    c_idmodulo INT AUTO_INCREMENT PRIMARY KEY,
    c_idcurso VARCHAR(10) NOT NULL,
    c_nombremodulo VARCHAR(255) NOT NULL,
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE
);

-- Tabla de Contenidos (Cada módulo tiene varios contenidos)
CREATE TABLE T_Contenido (
    c_idcontenido INT AUTO_INCREMENT PRIMARY KEY,
    c_idmodulo INT NOT NULL,
    c_descripcion TEXT NOT NULL,
    FOREIGN KEY (c_idmodulo) REFERENCES T_Modulo(c_idmodulo) ON DELETE CASCADE
);

-- Tabla de Docentes
CREATE TABLE T_Docente (
    c_iddocente INT AUTO_INCREMENT PRIMARY KEY,
    c_nombredocente VARCHAR(255) NOT NULL,
    c_fotodocente VARCHAR(255)  -- Ruta o URL de la imagen del docente
);

-- Tabla de Horarios
CREATE TABLE T_Horario (
    c_idhorario INT AUTO_INCREMENT PRIMARY KEY,
    c_dia ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    c_horas VARCHAR(50) NOT NULL  -- Ejemplo: "08:00 - 10:00 AM"
);

-- Tabla de Informe del Curso (Centro de Información)
CREATE TABLE T_InformeCurso (
    c_idinforme INT AUTO_INCREMENT PRIMARY KEY,
    c_idcurso VARCHAR(10) NOT NULL,
    c_iddocente INT NOT NULL,
    c_idhorario INT NOT NULL,
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_iddocente) REFERENCES T_Docente(c_iddocente) ON DELETE CASCADE,
    FOREIGN KEY (c_idhorario) REFERENCES T_Horario(c_idhorario) ON DELETE CASCADE
);

-- Tabla de Preguntas Frecuentes
CREATE TABLE T_Preguntas (
    c_idpregunta INT AUTO_INCREMENT PRIMARY KEY,
    c_pregunta TEXT NOT NULL,
    c_respuesta TEXT NOT NULL
);

-- Tabla de Contacto
CREATE TABLE T_Contacto (
    c_idcontacto INT AUTO_INCREMENT PRIMARY KEY,
    c_telefono VARCHAR(20),
    c_correo VARCHAR(255),
    c_direccion VARCHAR(255)
);

-- Nueva Tabla: Sectores a los que está dirigido el curso
CREATE TABLE T_Dirigido (
    c_iddirigido INT AUTO_INCREMENT PRIMARY KEY,
    c_sector VARCHAR(255) NOT NULL  -- Ejemplo: "Estudiantes", "Profesionales", etc.
);

-- Nueva Tabla: Habilidades que se desarrollan en el curso
CREATE TABLE T_Habilidades (
    c_idhabilidad INT AUTO_INCREMENT PRIMARY KEY,
    c_habilidad VARCHAR(255) NOT NULL  -- Ejemplo: "Conocimientos avanzados", "Casos de estudio", etc.
);

-- Tabla Intermedia: Relación Cursos ↔ Sectores Dirigidos (Un curso puede estar dirigido a varios sectores)
CREATE TABLE T_Cursos_Dirigido (
    c_idcurso VARCHAR(10) NOT NULL,
    c_iddirigido INT NOT NULL,
    PRIMARY KEY (c_idcurso, c_iddirigido),
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_iddirigido) REFERENCES T_Dirigido(c_iddirigido) ON DELETE CASCADE
);

-- Tabla Intermedia: Relación Cursos ↔ Habilidades (Un curso puede desarrollar varias habilidades)
CREATE TABLE T_Cursos_Habilidades (
    c_idcurso VARCHAR(10) NOT NULL,
    c_idhabilidad INT NOT NULL,
    PRIMARY KEY (c_idcurso, c_idhabilidad),
    FOREIGN KEY (c_idcurso) REFERENCES T_Cursos(c_idcurso) ON DELETE CASCADE,
    FOREIGN KEY (c_idhabilidad) REFERENCES T_Habilidades(c_idhabilidad) ON DELETE CASCADE
);


-- Insertar docentes
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Juan Pérez', '../src/assets/Course/teachers/juan_perez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('María López', '../src/assets/Course/teachers/maria_lopez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Carlos Rodríguez', '../src/assets/Course/teachers/carlos_rodriguez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Ana González', '../src/assets/Course/teachers/ana_gonzalez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Luis Fernández', '../src/assets/Course/teachers/luis_fernandez.jpg');
INSERT INTO T_Docente (c_nombredocente, c_fotodocente) VALUES ('Sofía Martínez', '../src/assets/Course/teachers/sofia_martinez.jpg');
-- Insertar horarios
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Lunes', '08:00 - 10:00 AM');
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Martes', '06:00 - 08:00 PM');
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Miércoles', '04:00 - 06:00 PM');
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Jueves', '10:00 - 12:00 PM');
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Viernes', '02:00 - 04:00 PM');
INSERT INTO T_Horario (c_dia, c_horas) VALUES ('Sábado', '09:00 - 11:00 AM');
-- Insertar cursos y relaciones

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-1', 'Windows 11', 'Introducción a Windows 11', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Windows 11 está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-1', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-1', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-1', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Fundamentos de Windows 11');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-1', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-2', 'Word 2021 - Basico', 'Introducción a Word 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Word 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-2', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-2', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Formato de documentos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de estilos y plantillas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-2', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Trabajo con tablas e imágenes';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Fundamentos de Word 2021 - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-2', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-3', 'Word 2021  - Intermedio', 'Introducción a Word 2021  - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Word 2021  - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-3', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-3', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Formato de documentos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de estilos y plantillas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-3', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Trabajo con tablas e imágenes';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Fundamentos de Word 2021  - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-3', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-4', 'Excel 2021 - Basico', 'Introducción a Excel 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Excel 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-4', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-4', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-4', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Fundamentos de Excel 2021 - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-4', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-5', 'Excel 2021 - Intermedio', 'Introducción a Excel 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Excel 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-5', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-5', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-5', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Fundamentos de Excel 2021 - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-5', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-6', 'Excel 2021 - Avanzado', 'Introducción a Excel 2021 - Avanzado', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Excel 2021 - Avanzado está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-6', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-6', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Dominio de fórmulas y funciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Análisis de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-6', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Tablas dinámicas y gráficos';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Fundamentos de Excel 2021 - Avanzado');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-6', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-7', 'Power Point - Basico', 'Introducción a Power Point - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Power Point - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-7', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-7', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-7', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Fundamentos de Power Point - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-7', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-8', 'Power Point - Intermedio', 'Introducción a Power Point - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Ofimática', 150, 'Cupos Libres', 'Este curso de Power Point - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-8', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-8', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-8', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Fundamentos de Power Point - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-8', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-9', 'Diseño Web I', 'Introducción a Diseño Web I', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Web', 200, 'Cupos Libres', 'Este curso de Diseño Web I está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-9', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-9', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-9', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Fundamentos de Diseño Web I');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-9', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-10', 'Diseño Web II', 'Introducción a Diseño Web Ii', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Web', 200, 'Cupos Libres', 'Este curso de Diseño Web Ii está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-10', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-10', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-10', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Fundamentos de Diseño Web Ii');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-10', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-11', 'Corel Draw - Basico', 'Introducción a Corel Draw - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 200, 'Cupos Libres', 'Este curso de Corel Draw - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-11', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-11', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-11', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Fundamentos de Corel Draw - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-11', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-12', 'Corel Draw - Intermedio', 'Introducción a Corel Draw - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 150, 'Cupos Libres', 'Este curso de Corel Draw - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-12', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-12', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-12', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Fundamentos de Corel Draw - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-12', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-13', 'Ilustrator - Basico', 'Introducción a Ilustrator - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 150, 'Cupos Libres', 'Este curso de Ilustrator - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-13', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-13', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-13', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Fundamentos de Ilustrator - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-13', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-14', ' Ilustrator - Intermedio', 'Introducción a  Ilustrator - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 150, 'Cupos Libres', 'Este curso de  Ilustrator - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-14', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-14', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-14', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Fundamentos de  Ilustrator - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-14', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-15', 'Photoshop - Basico', 'Introducción a Photoshop - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 150, 'Cupos Libres', 'Este curso de Photoshop - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-15', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-15', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Edición y retoque de imágenes';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de capas y filtros';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-15', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Creación de diseños gráficos';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Fundamentos de Photoshop - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-15', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-16', ' Photoshop - Intermedio', 'Introducción a  Photoshop - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Diseño Gráfico', 150, 'Cupos Libres', 'Este curso de  Photoshop - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-16', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-16', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Edición y retoque de imágenes';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Uso de capas y filtros';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-16', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Creación de diseños gráficos';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Fundamentos de  Photoshop - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-16', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-17', ' Sql 2021 -  Basico', 'Introducción a  Sql 2021 -  Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Base de Datos', 250, 'Cupos Libres', 'Este curso de  Sql 2021 -  Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-17', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-17', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-17', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Fundamentos de  Sql 2021 -  Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-17', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-18', ' Sql 2021 - Intermedio', 'Introducción a  Sql 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Base de Datos', 250, 'Cupos Libres', 'Este curso de  Sql 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-18', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-18', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-18', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Fundamentos de  Sql 2021 - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-18', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-19', 'Mysql 2021 - Basico', 'Introducción a Mysql 2021 - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Base de Datos', 250, 'Cupos Libres', 'Este curso de Mysql 2021 - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-19', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-19', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de bases de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Consultas SQL avanzadas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-19', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Optimización de rendimiento';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Fundamentos de Mysql 2021 - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-19', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-20', ' Mysql 2021 - Intermedio', 'Introducción a  Mysql 2021 - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Base de Datos', 250, 'Cupos Libres', 'Este curso de  Mysql 2021 - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-20', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-20', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de bases de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Consultas SQL avanzadas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-20', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Optimización de rendimiento';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Fundamentos de  Mysql 2021 - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-20', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-21', 'Php - Basico', 'Introducción a Php - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de Php - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-21', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-21', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-21', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Fundamentos de Php - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-21', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-22', 'Php - Intermedio', 'Introducción a Php - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de Php - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-22', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-22', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-22', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Fundamentos de Php - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-22', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-23', ' Programación C# -  Basico', 'Introducción a  Programación C# -  Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de  Programación C# -  Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-23', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-23', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-23', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Fundamentos de  Programación C# -  Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-23', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-24', ' Programación C# -  Intermedio', 'Introducción a  Programación C# -  Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de  Programación C# -  Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-24', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-24', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-24', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Fundamentos de  Programación C# -  Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-24', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-25', ' Java - Basico', 'Introducción a  Java - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de  Java - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-25', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-25', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Programación orientada a objetos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-25', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de excepciones';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Fundamentos de  Java - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-25', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-26', ' Java - Intermedio', 'Introducción a  Java - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de  Java - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-26', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-26', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Programación orientada a objetos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-26', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Manejo de excepciones';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Fundamentos de  Java - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-26', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-27', 'Android  - Basico', 'Introducción a Android  - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de Android  - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-27', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-27', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-27', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Fundamentos de Android  - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-27', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-28', ' Android - Intermedio', 'Introducción a  Android - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Programación', 250, 'Cupos Libres', 'Este curso de  Android - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-28', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-28', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-28', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Fundamentos de  Android - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-28', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-29', 'Python - Basico', 'Introducción a Python - Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Python - Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-29', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-29', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Sintaxis y estructuras de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Automatización de tareas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-29', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Fundamentos de Python - Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-29', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-30', ' Python - Intermedio', 'Introducción a  Python - Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de  Python - Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-30', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-30', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Sintaxis y estructuras de datos';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Automatización de tareas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-30', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Desarrollo de aplicaciones';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Fundamentos de  Python - Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-30', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-31', 'Marketing Digital', 'Introducción a Marketing Digital', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Marketing Digital está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-31', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-31', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Estrategias de marketing digital';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'SEO y SEM';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-31', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Gestión de redes sociales';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Fundamentos de Marketing Digital');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-31', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-32', ' Gestion Redes Sociales', 'Introducción a  Gestion Redes Sociales', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de  Gestion Redes Sociales está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-32', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-32', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-32', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Fundamentos de  Gestion Redes Sociales');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-32', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-33', ' Power Bi Basico', 'Introducción a  Power Bi Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de  Power Bi Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-33', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-33', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-33', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Fundamentos de  Power Bi Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-33', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-34', ' Power Bi Intermedio', 'Introducción a  Power Bi Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de  Power Bi Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-34', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-34', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-34', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Fundamentos de  Power Bi Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-34', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-35', 'Autocad Basico', 'Introducción a   Autocad Basico', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de   Autocad Basico está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-35', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-35', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-35', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Fundamentos de   Autocad Basico');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-35', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-36', 'Autocad Intermedio', 'Introducción a   Autocad Intermedio', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de   Autocad Intermedio está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-36', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-36', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-36', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Fundamentos de   Autocad Intermedio');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-36', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-37', 'ITIL', 'Introducción a ITIL', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de ITIL está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-37', 1, 1);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-37', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-37', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Fundamentos de ITIL');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-37', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-38', 'Cyberseguridad', 'Introducción a Cyberseguridad', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Cyberseguridad está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-38', 2, 2);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-38', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-38', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Fundamentos de Cyberseguridad');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-38', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-39', 'Scrum', 'Introducción a Scrum', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Scrum está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-39', 3, 3);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-39', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-39', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Fundamentos de Scrum');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-39', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-40', 'Gestion De Proyectos I', 'Introducción a Gestion De Proyectos I', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Gestion De Proyectos I está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-40', 4, 4);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-40', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-40', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Fundamentos de Gestion De Proyectos I');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-40', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-41', 'Office 365', 'Introducción a Office 365', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Office 365 está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-41', 5, 5);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-41', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-41', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Fundamentos de Office 365');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-41', 'Evaluación final');

    INSERT INTO T_Cursos (c_idcurso, c_nombre, c_subtitulo, c_imagen, c_modalidad, c_duracion, c_horas, c_fechainicio, c_categoria, c_precio, c_estado, c_descripcion)
    VALUES ('curso-42', 'Azure', 'Introducción a Azure', '../src/assets/Course/online/imagen.jpg', 'En vivo', 5, 10, '2025-03-30', 'Tecnologías', 250, 'Cupos Libres', 'Este curso de Azure está diseñado para brindarte los conocimientos necesarios sobre el tema de manera práctica y efectiva.');
    

    INSERT INTO T_InformeCurso (c_idcurso, c_iddocente, c_idhorario)
    VALUES ('curso-42', 6, 6);
    
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales';
INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) SELECT 'curso-42', c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas';
INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) SELECT 'curso-42', c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio';
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Fundamentos de Azure');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Conceptos clave y aplicaciones');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Herramientas y mejores prácticas');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Ejercicios y casos prácticos');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Proyecto final');
INSERT INTO T_Modulo (c_idcurso, c_nombremodulo) VALUES ('curso-42', 'Evaluación final');

use dbmeta;
SELECT * from t_cursos order by c_idcurso asc

