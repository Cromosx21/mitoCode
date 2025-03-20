import express from "express";
import { getDownload, verificarArchivo } from "../controllers/download.js";

const router = express.Router();

router.get("/", getDownload);
router.get("/verificar-archivo/:nombre", verificarArchivo);

export default router;
