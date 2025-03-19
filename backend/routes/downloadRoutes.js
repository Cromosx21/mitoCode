import express from "express";
import { getDownload } from "../controllers/download.js";

const router = express.Router();

router.get("/", getDownload);

export default router;
