import { createContext, useState, useEffect } from "react";
import { getCourses } from "../services/courseServices";

export const CourseContext = createContext();

export const CourseProvider = ({ children }) => {
	const [courses, setCourses] = useState([]);
	const [searchTerm, setSearchTerm] = useState("");

	// Obtener cursos desde la API cuando se monte el contexto
	useEffect(() => {
		// console.log("📌 Se está ejecutando `useEffect` en CourseContext")
		const fetchCourses = async () => {
			try {
                // console.log("📌 Llamando a `getCourses()`...");
                const data = await getCourses();
                // console.log("📌 Datos recibidos en `CourseContext`:", data);
                setCourses(data);
            } catch (error) {
                console.error("❌ Error obteniendo cursos en CourseContext:", error);
            }
		};
		fetchCourses();
	}, []);

	return (
		<CourseContext.Provider value={{ courses, searchTerm, setSearchTerm }}>
			{children}
		</CourseContext.Provider>
	);
};
