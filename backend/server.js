import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import db from "./config/db.js";

import path from "path";
import { fileURLToPath } from "url";

import courseRoutes from "./routes/courseRoutes.js";
import faqsRoutes from "./routes/faqsRoutes.js";
import downloadRoutes from "./routes/downloadRoutes.js";

dotenv.config();

const app = express();
app.use(cors({
    origin: "*",
    methods: "GET,POST,PUT,DELETE",
    allowedHeaders: "Content-Type,Authorization"
}));

app.use(express.json());

// 📌 1️⃣ Obtener el directorio actual en ES6
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 📌 2️⃣ Servir el frontend estático desde la carpeta `dist`
app.use(express.static(path.join(__dirname, "../frontend/dist")));


// 📌 3️⃣ Rutas de API
app.use("/api/courses", courseRoutes);
app.use("/api/faqs", faqsRoutes);
app.use("/api/download", downloadRoutes);

// 📌 4️⃣ Cualquier otra ruta servirá `index.html` (para manejar rutas en React)
app.get("*", (req, res) => {
    res.sendFile(path.join(__dirname, "../frontend/dist/index.html"));
});


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
	console.log(`🚀 Servidor corriendo en el puerto ${PORT}`);
});
