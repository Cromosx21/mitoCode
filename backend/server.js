import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import db from "./config/db.js";
import courseRoutes from "./routes/courseRoutes.js";

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

// Rutas
app.use("/api/courses", courseRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
	console.log(`🚀 Servidor corriendo en el puerto ${PORT}`);
});
