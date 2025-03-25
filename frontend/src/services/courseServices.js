import axios from "axios";

// Obtiene la URL del backend desde las variables de entorno
const API_BASE_URL = import.meta.env.VITE_API_URL || "http://localhost:5000";

// Asegura que la URL del backend está definida
if (!API_BASE_URL) {
	console.error("⚠️ VITE_API_URL no está definida. Asegúrate de configurarla en Railway.");
}

// Define las rutas correctamente
const API_URL = `${API_BASE_URL}/api/courses`;
const API_URL_FAQS = `${API_BASE_URL}/api/faqs`;
const API_URL_DOWNLOAD = `${API_BASE_URL}/api/download`;

// Obtener todos los cursos
export const getCourses = async () => {
	try {
		console.log("📌 Haciendo petición a:", `${API_BASE_URL}/api/courses`);
		const response = await axios.get(`${API_BASE_URL}/api/courses`);
		console.log("✅ Respuesta de la API:", response.data);
		return response.data;
	} catch (error) {
		console.error("❌ Error al obtener cursos:", error.response?.status, error.message);
		return [];
	}
};

// Obtener un curso por ID con informe completo
export const getInformeCourses = async (id) => {
	try {
		const response = await axios.get(`${API_URL}/${id}`);
		return response.data;
	} catch (error) {
		console.error(`Error al obtener el curso ${id}`, error);
		return null;
	}
};

export const getFaqs = async () => {
	try {
		const response = await axios.get(API_URL_FAQS);
		return response.data;
	} catch (error) {
		console.error("Error al obtener las preguntas frecuentes", error);
		return null;
	}
};

export const getDownload = async () => {
	try {
		const response = await axios.get(API_URL_DOWNLOAD);
		return response.data;
	} catch (error) {
		console.error("Error al obtener los nombres de los cursos", error);
		return null;
	}
};
