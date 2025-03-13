-- Insertar contenidos para los módulos existentes en 42 cursos

        -- Insertar contenido para el módulo 1 del curso-1
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-1' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-1
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-1' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-1
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-1' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-1
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-1' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-2
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-2' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-2
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-2' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-2
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-2' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-2
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-2' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-3
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-3' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-3
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-3' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-3
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-3' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-3
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-3' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-4
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-4' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-4
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-4' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-4
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-4' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-4
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-4' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-5
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-5' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-5
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-5' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-5
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-5' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-5
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-5' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-6
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-6' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-6
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-6' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-6
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-6' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-6
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-6' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-7
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-7' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-7
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-7' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-7
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-7' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-7
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-7' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-8
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-8' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-8
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-8' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-8
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-8' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-8
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-8' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-9
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-9' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-9
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-9' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-9
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-9' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-9
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-9' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-10
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-10' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-10
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-10' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-10
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-10' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-10
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-10' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-11
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-11' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-11
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-11' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-11
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-11' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-11
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-11' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-12
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-12' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-12
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-12' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-12
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-12' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-12
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-12' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-13
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-13' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-13
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-13' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-13
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-13' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-13
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-13' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-14
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-14' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-14
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-14' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-14
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-14' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-14
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-14' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-15
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-15' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-15
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-15' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-15
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-15' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-15
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-15' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-16
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-16' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-16
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-16' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-16
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-16' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-16
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-16' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-17
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-17' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-17
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-17' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-17
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-17' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-17
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-17' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-18
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-18' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-18
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-18' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-18
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-18' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-18
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-18' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-19
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-19' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-19
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-19' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-19
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-19' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-19
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-19' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-20
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-20' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-20
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-20' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-20
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-20' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-20
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-20' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-21
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-21' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-21
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-21' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-21
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-21' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-21
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-21' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-22
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-22' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-22
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-22' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-22
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-22' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-22
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-22' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-23
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-23' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-23
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-23' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-23
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-23' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-23
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-23' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-24
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-24' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-24
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-24' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-24
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-24' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-24
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-24' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-25
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-25' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-25
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-25' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-25
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-25' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-25
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-25' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-26
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-26' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-26
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-26' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-26
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-26' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-26
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-26' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-27
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-27' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-27
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-27' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-27
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-27' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-27
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-27' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-28
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-28' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-28
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-28' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-28
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-28' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-28
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-28' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-29
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-29' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-29
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-29' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-29
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-29' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-29
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-29' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-30
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-30' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-30
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-30' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-30
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-30' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-30
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-30' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-31
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-31' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-31
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-31' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-31
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-31' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-31
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-31' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-32
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-32' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-32
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-32' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-32
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-32' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-32
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-32' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-33
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-33' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-33
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-33' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-33
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-33' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-33
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-33' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-34
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-34' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-34
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-34' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-34
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-34' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-34
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-34' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-35
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-35' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-35
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-35' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-35
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-35' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-35
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-35' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-36
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-36' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-36
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-36' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-36
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-36' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-36
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-36' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-37
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-37' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-37
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-37' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-37
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-37' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-37
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-37' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-38
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-38' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-38
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-38' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-38
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-38' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-38
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-38' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-39
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-39' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-39
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-39' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-39
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-39' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-39
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-39' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-40
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-40' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-40
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-40' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-40
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-40' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-40
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-40' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-41
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-41' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-41
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-41' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-41
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-41' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-41
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-41' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        
        -- Insertar contenido para el módulo 1 del curso-42
        SET @modulo1 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-42' ORDER BY c_idmodulo LIMIT 0,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo1, 'Concepto fundamental 1'),
        (@modulo1, 'Ejemplo práctico 1'),
        (@modulo1, 'Aplicaciones reales 1');
        
        -- Insertar contenido para el módulo 2 del curso-42
        SET @modulo2 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-42' ORDER BY c_idmodulo LIMIT 1,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo2, 'Concepto fundamental 2'),
        (@modulo2, 'Ejemplo práctico 2'),
        (@modulo2, 'Aplicaciones reales 2');
        
        -- Insertar contenido para el módulo 3 del curso-42
        SET @modulo3 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-42' ORDER BY c_idmodulo LIMIT 2,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo3, 'Concepto fundamental 3'),
        (@modulo3, 'Ejemplo práctico 3'),
        (@modulo3, 'Aplicaciones reales 3');
        
        -- Insertar contenido para el módulo 4 del curso-42
        SET @modulo4 = (SELECT c_idmodulo FROM T_Modulo WHERE c_idcurso = 'curso-42' ORDER BY c_idmodulo LIMIT 3,1);

        INSERT INTO T_Contenido (c_idmodulo, c_descripcion) VALUES 
        (@modulo4, 'Concepto fundamental 4'),
        (@modulo4, 'Ejemplo práctico 4'),
        (@modulo4, 'Aplicaciones reales 4');
        