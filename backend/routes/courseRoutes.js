import express from "express";
import { getCourses } from "../controllers/courseController.js";
import { getInformeCourses } from "../controllers/informeCourse.js";

const router = express.Router();

router.get("/", getCourses);
router.get("/:id", getInformeCourses);


export default router;
