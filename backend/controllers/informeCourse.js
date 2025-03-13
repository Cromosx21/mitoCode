import db from "../config/db.js";

export const getInformeCourses = async (req, res) => {
	try {
		const { id } = req.params; // Captura el ID del curso

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
				ANY_VALUE(d.c_nombredocente) AS docente_nombre,
				ANY_VALUE(d.c_fotodocente) AS docente_imagen,
		
				-- Obtener solo UN horario
				(SELECT CONCAT(h.c_dia, ' - ', h.c_horas) 
				 FROM T_Horario h 
				 INNER JOIN T_InformeCurso ic ON h.c_idhorario = ic.c_idhorario 
				 WHERE ic.c_idcurso = c.c_idcurso LIMIT 1) AS horario,
		
				-- Sectores dirigidos y habilidades como arrays
				GROUP_CONCAT(DISTINCT dir.c_sector SEPARATOR ', ') AS dirigido,
				GROUP_CONCAT(DISTINCT hab.c_habilidad SEPARATOR ', ') AS habilidades,
		
				-- Información de módulos y temas
				ANY_VALUE(m.c_idmodulo) AS id_modulo,
				ANY_VALUE(m.c_nombremodulo) AS nombre_modulo,
				ANY_VALUE(con.c_idcontenido) AS id_contenido,
				ANY_VALUE(con.c_descripcion) AS tema
		
			FROM T_Cursos c
			LEFT JOIN T_InformeCurso ic ON c.c_idcurso = ic.c_idcurso
			LEFT JOIN T_Docente d ON ic.c_iddocente = d.c_iddocente
			LEFT JOIN T_Cursos_Dirigido cd ON c.c_idcurso = cd.c_idcurso
			LEFT JOIN T_Dirigido dir ON cd.c_iddirigido = dir.c_iddirigido
			LEFT JOIN T_Cursos_Habilidades ch ON c.c_idcurso = ch.c_idcurso
			LEFT JOIN T_Habilidades hab ON ch.c_idhabilidad = hab.c_idhabilidad
			LEFT JOIN T_Modulo m ON c.c_idcurso = m.c_idcurso
			LEFT JOIN T_Contenido con ON m.c_idmodulo = con.c_idmodulo
		
			WHERE c.c_idcurso = ?
			GROUP BY c.c_idcurso
			ORDER BY id_modulo, id_contenido
			`,
			[id]
		);
		

		if (rows.length === 0) {
			return res.status(404).json({ message: "Curso no encontrado" });
		}

		// Estructurar JSON del curso
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
			informeCurso: {
				descripcion: rows[0].descripcion,
				docente: {
					nombre: rows[0].docente_nombre,
					imagen: rows[0].docente_imagen,
				},
				dirigido: rows[0].dirigido ? rows[0].dirigido.split(", ") : [],
				habilidades: rows[0].habilidades
					? rows[0].habilidades.split(", ")
					: [],
				temario: {}, // Se llenará con los módulos y contenidos
				horario: rows[0].horario || "No disponible",
			},
		};

		// Agrupar módulos y sus contenidos correctamente
		rows.forEach((row) => {
			if (!row.id_modulo) return; // Si no hay módulo, se ignora

			const moduloKey = `modulo_${row.id_modulo}`;

			// Si el módulo aún no existe en el JSON, lo creamos
			if (!curso.informeCurso.temario[moduloKey]) {
				curso.informeCurso.temario[moduloKey] = {
					nombreModulo: row.nombre_modulo,
				};
			}

			// Si el módulo tiene temas (contenidos), los agregamos correctamente
			if (row.tema) {
				const temasKeys =
					Object.keys(curso.informeCurso.temario[moduloKey]).filter(
						(key) => key.startsWith("temario_")
					).length + 1;

				curso.informeCurso.temario[moduloKey][`temario_${temasKeys}`] =
					row.tema;
			}
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
