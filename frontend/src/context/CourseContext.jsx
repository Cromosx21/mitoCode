import { createContext, useState, useEffect } from "react";
import { getCourses } from "../services/courseServices";

export const CourseContext = createContext();

export const CourseProvider = ({ children }) => {
	const [courses, setCourses] = useState([]);
	const [searchTerm, setSearchTerm] = useState("");

	// Obtener cursos desde la API cuando se monte el contexto
	useEffect(() => {
		const fetchCourses = async () => {
			const data = await getCourses();
			setCourses(data);
		};
		fetchCourses();
	}, []);

	return (
		<CourseContext.Provider value={{ courses, searchTerm, setSearchTerm }}>
			{children}
		</CourseContext.Provider>
	);
};
