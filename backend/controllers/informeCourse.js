import db from "../config/db.js";

export const getInformeCourses = async (req, res) => {
	try {
		const { id } = req.params; // Captura el ID de la URL

		const [rows] = await db.query(
			`
            SELECT 
                c.c_idcurso AS id,
                c.c_nombre AS nombre,
                c.c_subtitulo AS subtitulo,
                c.c_imagen AS imagen,
                c.c_modalidad AS modalidad,
                c.c_duracion AS duracion,
                c.c_horas AS horas,
                c.c_fechainicio AS fecha_inicio,
                c.c_categoria AS categoria,
                c.c_precio AS precio,
                c.c_estado AS estado,
                c.c_descripcion AS descripcion,
                
                -- Información del docente
                d.c_nombredocente AS docente_nombre,
                d.c_fotodocente AS docente_imagen,

                -- Información del horario
                h.c_dia AS horario_dia,
                h.c_horas AS horario_hora,

                -- Información de sectores dirigidos
                GROUP_CONCAT(DISTINCT dir.c_sector SEPARATOR ', ') AS dirigido,

                -- Información de habilidades
                GROUP_CONCAT(DISTINCT hab.c_habilidad SEPARATOR ', ') AS habilidades,

                -- Información de módulos y contenidos
                m.c_nombremodulo AS nombre_modulo,
                GROUP_CONCAT(DISTINCT con.c_descripcion SEPARATOR ', ') AS temas

            FROM T_Cursos c
            LEFT JOIN T_InformeCurso ic ON c.c_idcurso = ic.c_idcurso
            LEFT JOIN T_Docente d ON ic.c_iddocente = d.c_iddocente
            LEFT JOIN T_Horario h ON ic.c_idhorario = h.c_idhorario
            LEFT JOIN T_Cursos_Dirigido cd ON c.c_idcurso = cd.c_idcurso
            LEFT JOIN T_Dirigido dir ON cd.c_iddirigido = dir.c_iddirigido
            LEFT JOIN T_Cursos_Habilidades ch ON c.c_idcurso = ch.c_idcurso
            LEFT JOIN T_Habilidades hab ON ch.c_idhabilidad = hab.c_idhabilidad
            LEFT JOIN T_Modulo m ON c.c_idcurso = m.c_idcurso
            LEFT JOIN T_Contenido con ON m.c_idmodulo = con.c_idmodulo

            WHERE c.c_idcurso = ?
            GROUP BY c.c_idcurso, m.c_idmodulo, h.c_idhorario
        `,
			[id]
		);

		if (rows.length === 0) {
			return res.status(404).json({ message: "Curso no encontrado" });
		}

		// Transformar los datos en JSON estructurado
		const curso = {
			id: rows[0].id,
			nombre: rows[0].nombre,
			subtitulo: rows[0].subtitulo,
			imagen: rows[0].imagen,
			modalidad: rows[0].modalidad,
			duracion: rows[0].duracion,
			horas: rows[0].horas,
			fecha_inicio: rows[0].fecha_inicio,
			categoria: rows[0].categoria,
			precio: rows[0].precio,
			estado: rows[0].estado,
			descripcion: rows[0].descripcion,
			informecursos: {
				descripcion: rows[0].descripcion,
				docente: {
					nombre: rows[0].docente_nombre,
					imagen: rows[0].docente_imagen,
				},
				dirigido: rows[0].dirigido ? rows[0].dirigido.split(", ") : [],
				habilidades: rows[0].habilidades
					? rows[0].habilidades.split(", ")
					: [],
				temario: {},
				horarios: {},
			},
		};

		// Agrupar módulos y contenidos
		rows.forEach((row) => {
			if (!curso.informecursos.temario[row.nombre_modulo]) {
				curso.informecursos.temario[row.nombre_modulo] = {
					nombre_modulo: row.nombre_modulo,
					temas: row.temas ? row.temas.split(", ") : [],
				};
			}
		});

		// Agrupar horarios
		rows.forEach((row, index) => {
			curso.informecursos.horarios[
				`horario_${index + 1}`
			] = `${row.horario_dia} - ${row.horario_hora}`;
		});

		res.json(curso);
	} catch (error) {
		console.error("Error al obtener detalles del curso:", error);
		res.status(500).json({
			message: "Error interno en el servidor",
			error: error.message,
		});
	}
};
