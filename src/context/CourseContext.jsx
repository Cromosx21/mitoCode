import { createContext, useState, useEffect } from "react";

export const CourseContext = createContext();

export const CourseProvider = ({ children }) => {
	const [courses, setCourses] = useState([]);
	const [searchTerm, setSearchTerm] = useState("");

	useEffect(() => {
		fetch("/src/context/cursos.json")
			.then((response) => response.json())
			.then((data) => setCourses(data))
			.catch((error) =>
				console.log("Error al cargar los cursos:", error)
			);
	}, []);

	return (
		<CourseContext.Provider value={{ courses, searchTerm, setSearchTerm }}>
			{children}
		</CourseContext.Provider>
	);
};
