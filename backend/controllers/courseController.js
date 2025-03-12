import db from "../config/db.js";

export const getCourses = async (req, res) => {
	try {
		const [rows] = await db.query(`
            SELECT 
                c_idcurso AS id, 
                c_nombre AS nombre, 
                c_subtitulo AS subtitulo, 
                c_imagen AS imagen, 
                c_modalidad AS modalidad, 
                c_duracion AS duracion, 
                c_horas AS horas,
                c_fechainicio AS fecha_inicio, 
                c_categoria AS categoria, 
                c_precio AS precio, 
                c_estado AS estado, 
                c_descripcion AS descripcion
				FROM T_Cursos
        `);

		// Estructurar los datos para eliminar duplicados
		const cursosMap = {};

		rows.forEach((row) => {
			if (!cursosMap[row.id]) {
				cursosMap[row.id] = {
					id: row.id,
					nombre: row.nombre,
					subtitulo: row.subtitulo,
					imagen: row.imagen,
					modalidad: row.modalidad,
					duracion: row.duracion,
					horas: row.horas,
					fecha_inicio: row.fecha_inicio,
					categoria: row.categoria,
					precio: row.precio,
					estado: row.estado,
					descripcion: row.descripcion,
				};
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
