INSERT INTO T_Habilidades (c_habilidad) VALUES ('Conocimientos básicos y avanzados del tema'), ('Aplicaciones prácticas'), ('Casos de estudio');
INSERT INTO T_Dirigido (c_sector) VALUES ('Estudiantes'), ('Profesionales'), ('Interesados en el tema');

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-1', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-1', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-1', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-2', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-2', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-2', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-3', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-3', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-3', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-4', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-4', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-4', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-5', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-5', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-5', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-6', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-6', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-6', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-7', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-7', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-7', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-8', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-8', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-8', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-9', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-9', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-9', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-10', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-10', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-10', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-11', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-11', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-11', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        
        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-12', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-12', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-12', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-13', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-13', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-13', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-14', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-14', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-14', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-15', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-15', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-15', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-16', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-16', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-16', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-17', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-17', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-17', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-18', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-18', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-18', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-19', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-19', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-19', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-20', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-20', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-20', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-21', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-21', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-21', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-22', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-22', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-22', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-23', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-23', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-23', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-24', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-24', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-24', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-25', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-25', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-25', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-26', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-26', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-26', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-27', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-27', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-27', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-28', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-28', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-28', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-29', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-29', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-29', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-30', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-30', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-30', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-31', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-31', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-31', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-32', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-32', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-32', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-33', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-33', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-33', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-34', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-34', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-34', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-35', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-35', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-35', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-36', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-36', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-36', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-37', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-37', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-37', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-38', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-38', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-38', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-39', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-39', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-39', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-40', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-40', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-40', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-41', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-41', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-41', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-42', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Conocimientos básicos y avanzados del tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-42', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Aplicaciones prácticas' LIMIT 1));
        

        INSERT INTO T_Cursos_Habilidades (c_idcurso, c_idhabilidad) 
        VALUES ('curso-42', (SELECT c_idhabilidad FROM T_Habilidades WHERE c_habilidad = 'Casos de estudio' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-1', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-1', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-1', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-2', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-2', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-2', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-3', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-3', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-3', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-4', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-4', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-4', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-5', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-5', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-5', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-6', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-6', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-6', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-7', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-7', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-7', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-8', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-8', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-8', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-9', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-9', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-9', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-10', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-10', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-10', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-11', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-11', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-11', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-12', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-12', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-12', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-13', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-13', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-13', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-14', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-14', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-14', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-15', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-15', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-15', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-16', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-16', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-16', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-17', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-17', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-17', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-18', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-18', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-18', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-19', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-19', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-19', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-20', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-20', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-20', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-21', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-21', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-21', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-22', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-22', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-22', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-23', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-23', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-23', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-24', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-24', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-24', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-25', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-25', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-25', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-26', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-26', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-26', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-27', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-27', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-27', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-28', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-28', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-28', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-29', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-29', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-29', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-30', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-30', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-30', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-31', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-31', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-31', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-32', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-32', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-32', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-33', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-33', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-33', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-34', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-34', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-34', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-35', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-35', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-35', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-36', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-36', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-36', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-37', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-37', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-37', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-38', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-38', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-38', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-39', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-39', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-39', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-40', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-40', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-40', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-41', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-41', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-41', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-42', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Estudiantes' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-42', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Profesionales' LIMIT 1));
        

        INSERT INTO T_Cursos_Dirigido (c_idcurso, c_iddirigido) 
        VALUES ('curso-42', (SELECT c_iddirigido FROM T_Dirigido WHERE c_sector = 'Interesados en el tema' LIMIT 1));
        