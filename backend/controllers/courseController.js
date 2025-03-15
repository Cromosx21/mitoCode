import db from "../config/db.js";

export const getCourses = async (req, res) => {
	try {
		const [rows] = await db.query(`
            SELECT 
                c.c_idcurso AS id, 
                c.c_nombre AS nombre, 
                c.c_subtitulo AS subtitulo, 
                c.c_imagen AS imagen, 
                c.c_modalidad AS modalidad, 
                c.c_duracion AS duracion, 
                c.c_horas AS horas,
                c.c_fechainicio AS fecha_inicio, 
                c.c_precio AS precio, 
                c.c_estado AS estado, 
                c.c_descripcion AS descripcion,
                m.c_nombremodulo AS categoria
            FROM T_Cursos c LEFT JOIN T_Modulo m ON c.c_idmodulo = m.c_idmodulo
        `);

		// Estructurar los datos eliminando duplicados
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
