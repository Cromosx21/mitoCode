import axios from "axios";

// URL del backend (localmente o en Railway cuando despliegues)
const API_URL = "http://localhost:5000/api/courses";

export const getCourses = async () => {
	try {
		const response = await axios.get(API_URL);
		return response.data;
	} catch (error) {
		console.error("Error al obtener cursos", error);
		return [];
	}
};
