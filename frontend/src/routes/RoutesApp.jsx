import { Route, Routes } from "react-router-dom";
import Home from "../pages/Home";
import Course from "../pages/Course";
import SearchResults from "../pages/SearchResults"; // Importa el componente correcto
import Sesion from "../pages/Sesion";
import SearchAllCourses from "../pages/SearchAllCourses";
import SearchCourse from "../pages/SearchCourse";
import Promotion from "../pages/Promotion";
import Certificate from "../pages/Certificate";

const RoutesApp = () => {
	return (
		<Routes>
			<Route path="/" element={<Home />} />
			<Route path="/course/:id" element={<Course />} />
			<Route path="/search" element={<SearchResults />} />{/* Agregada */}
			<Route path="/search/:category" element={<SearchCourse />} />
			<Route path="/search/cursos" element={<SearchAllCourses />} />
			<Route path="/sesion/:sesion" element={<Sesion />} />
			<Route path="/promotions" element={<Promotion />} />
			<Route path="/certificates" element={<Certificate />} />
		</Routes>
	);
};

export default RoutesApp;
