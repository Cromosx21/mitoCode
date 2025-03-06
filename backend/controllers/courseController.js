import db from "../config/db.js";

export const getCourses = async (req, res) => {
	try {
		const [rows] = await db.query(`
            SELECT 
                c.id, c.imagen, c.nombre, c.subtitulo, c.fecha_inicio, 
                c.modalidad, c.semanas, c.horas, c.precio, c.estado, 
                c.categoria, d.acerca, 
                doc.nombre AS docente_nombre, doc.imagen AS docente_imagen, 
                t.tema AS temario, h.habilidad, p.publico AS dirigido
            FROM Cursos c
            LEFT JOIN DetallesCurso d ON c.id = d.id_curso
            LEFT JOIN Docentes doc ON d.id_docente = doc.id
            LEFT JOIN Temarios t ON c.id = t.id_curso
            LEFT JOIN Habilidades h ON c.id = h.id_curso
            LEFT JOIN PublicoObjetivo p ON c.id = p.id_curso;
        `);

		// Estructurar los datos para eliminar duplicados
		const cursosMap = {};

		rows.forEach((row) => {
			if (!cursosMap[row.id]) {
				cursosMap[row.id] = {
					id: row.id,
					imagen: row.imagen,
					nombre: row.nombre,
					subtitulo: row.subtitulo,
					fecha_inicio: row.fecha_inicio,
					modalidad: row.modalidad,
					semanas: row.semanas,
					horas: row.horas,
					precio: row.precio,
					estado: row.estado,
					categoria: row.categoria,
					detalles: {
						acerca: row.acerca,
						docente: {
							nombre: row.docente_nombre || "Por asignar",
							imagen:
								row.docente_imagen ||
								"../src/assets/Course/teachers/default.png",
						},
						dirigido: [],
						habilidades: [],
						temario: [],
					},
				};
			}

			// Agregar datos a los arrays evitando duplicados
			if (
				row.dirigido &&
				!cursosMap[row.id].detalles.dirigido.includes(row.dirigido)
			) {
				cursosMap[row.id].detalles.dirigido.push(row.dirigido);
			}
			if (
				row.habilidad &&
				!cursosMap[row.id].detalles.habilidades.includes(row.habilidad)
			) {
				cursosMap[row.id].detalles.habilidades.push(row.habilidad);
			}
			if (
				row.temario &&
				!cursosMap[row.id].detalles.temario.includes(row.temario)
			) {
				cursosMap[row.id].detalles.temario.push(row.temario);
			}
		});

		// Convertir el objeto en un array de cursos
		const cursos = Object.values(cursosMap);

		res.json(cursos);
	} catch (error) {
		console.error("Error al obtener cursos:", error);
		res.status(500).json({
			message: "Error interno en el servidor",
			error: error.message,
		});
	}
};
