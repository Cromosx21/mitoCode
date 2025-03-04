import db from "../config/db.js";

// Obtener todos los cursos
export const getCourses = (req, res) => {
	db.query("SELECT * FROM TCursos", (err, results) => {
		if (err) {
			return res.status(500).json({ error: "Error al obtener cursos" });
		}
		res.json(results);
	});
};
