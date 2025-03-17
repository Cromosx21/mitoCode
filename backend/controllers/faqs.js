import db from "../config/db.js";

export const getFaqs = async (req, res) => {
    try {
        const [rows] = await db.query(`SELECT * FROM T_Preguntas`);

        const faqsMap ={};

        rows.forEach((row) => {
            if (!faqsMap[row.c_idpregunta]) {
                faqsMap[row.c_idpregunta] = {
                    id: row.c_idpregunta,
                    pregunta: row.c_pregunta,
                    respuesta: row.c_respuesta,
                };
            }
        });

        const faqs = Object.values(faqsMap);

        res.json(faqs);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener las preguntas frecuentes" });
    }
}