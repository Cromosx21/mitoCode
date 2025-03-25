import db from "../config/db.js";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { dirname } from "path";


export const getDownload = async (req, res) => {
    try {
        const [rows] = await db.query(`
            SELECT c_idcurso, c_nombre FROM T_Cursos order by cast(substring_index(c_idcurso,'-',-1) as unsigned)
            `);

        const nameCursoMap ={};

        rows.forEach((row) => {
            if (!nameCursoMap[row.c_idcurso]) {
                nameCursoMap[row.c_idcurso] = {
                    id: row.c_idcurso,
                    nombreCurso: row.c_nombre
                };
            }
        });

        const nameCurso = Object.values(nameCursoMap);

        res.json(nameCurso);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener las preguntas frecuentes" });
    }
}

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export const verificarArchivo = (req, res) => {
	const fileName = req.params.nombre;
	const filePath = path.join(
		__dirname,
		"../../frontend/public/syllabus",
		`${fileName}.pdf`
	); // Ajusta la ruta según tu estructura de archivos

	fs.access(filePath, fs.constants.F_OK, (err) => {
		if (err) {
			return res.json({ exists: false });
		}
		return res.json({ exists: true });
	});
};