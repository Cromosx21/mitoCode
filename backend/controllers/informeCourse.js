import db from "../config/db.js";

export const getInformeCourses = async (req, res) => {
	try {
		const { id } = req.params; // Captura el ID del curso

		// Consulta SQL corregida
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
				m.c_nombremodulo AS categoria,  -- Relación con tabla de categorías
				c.c_precio AS precio,
				c.c_estado AS estado,
				c.c_descripcion AS descripcion,

				-- Información del docente
				d.c_nombredocente AS docente_nombre,
				d.c_fotodocente AS docente_imagen,

				-- Horarios (se concatenan si hay más de uno)
				GROUP_CONCAT(DISTINCT CONCAT(h.c_dia, ' ', h.c_hora_inicio, ' - ', h.c_hora_fin) SEPARATOR ' | ') AS horario,

				-- Sectores dirigidos y habilidades como arrays
				GROUP_CONCAT(DISTINCT dir.c_sector SEPARATOR ', ') AS dirigido,
				GROUP_CONCAT(DISTINCT hab.c_habilidad SEPARATOR ', ') AS habilidades,

				-- Información de módulos y sus temas
				con.c_idcontenido AS id_contenido,
				con.c_descripcion AS nombreModulo,
				GROUP_CONCAT(DISTINCT det.c_descripcion SEPARATOR ' ||| ') AS temarios

			FROM T_Cursos c
			LEFT JOIN T_Modulo m ON c.c_idmodulo = m.c_idmodulo
			LEFT JOIN T_InformeCurso ic ON c.c_idcurso = ic.c_idcurso
			LEFT JOIN T_Docente d ON ic.c_iddocente = d.c_iddocente
			LEFT JOIN T_Horario h ON ic.c_idhorario = h.c_idhorario
			LEFT JOIN T_Cursos_Dirigido cd ON c.c_idcurso = cd.c_idcurso
			LEFT JOIN T_Dirigido dir ON cd.c_iddirigido = dir.c_iddirigido
			LEFT JOIN T_Cursos_Habilidades ch ON c.c_idcurso = ch.c_idcurso
			LEFT JOIN T_Habilidades hab ON ch.c_idhabilidad = hab.c_idhabilidad
			LEFT JOIN T_Contenido con ON c.c_idcurso = con.c_idcurso
			LEFT JOIN T_DetalleContenido det ON con.c_idcontenido = det.c_idcontenido

			WHERE c.c_idcurso = ?
			GROUP BY c.c_idcurso, con.c_idcontenido
			ORDER BY con.c_idcontenido
			`,
			[id]
		);

		if (rows.length === 0) {
			return res.status(404).json({ message: "Curso no encontrado" });
		}

		// Construcción del objeto curso corregida
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
				horario: rows[0].horario || "No disponible",
				temario: {}, // Se estructuran los contenidos aquí
			},
		};

		// Agrupar módulos y detalles del temario
		rows.forEach((row) => {
			if (!row.id_contenido) return;

			const moduloKey = `modulo_${row.id_contenido}`;

			// Si el módulo no existe, lo creamos
			if (!curso.informeCurso.temario[moduloKey]) {
				curso.informeCurso.temario[moduloKey] = {
					nombreModulo: row.nombreModulo, // Nombre del módulo
					temarios: row.temarios ? row.temarios.split(" ||| ") : [], // Lista de detalles
				};
			}
		});

		// Enviar respuesta
		res.json(curso);
	} catch (error) {
		console.error("Error al obtener detalles del curso:", error);
		res.status(500).json({
			message: "Error interno en el servidor",
			error: error.message,
		});
	}
};
