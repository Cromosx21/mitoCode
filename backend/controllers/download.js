import db from "../config/db.js";

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