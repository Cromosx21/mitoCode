import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import db from "./config/db.js";
import courseRoutes from "./routes/courseRoutes.js";
import faqsRoutes from "./routes/faqsRoutes.js";
import downloadRoutes from "./routes/downloadRoutes.js";

dotenv.config();

const app = express();
app.use(cors({
	origin: "*", // ⚠️ Esto permite todas las solicitudes (solo para pruebas)
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"]
}));
app.use(express.json());

// Rutas
app.use("/api/courses", courseRoutes);
app.use("/api/faqs", faqsRoutes);
app.use("/api/download", downloadRoutes);


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
	console.log(`🚀 Servidor corriendo en el puerto ${PORT}`);
});
