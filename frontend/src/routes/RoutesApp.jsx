import { Route, Routes } from "react-router-dom";
import Home from "../pages/Home";
import Course from "../pages/Course";
import SearchCourse from "../pages/SearchCourse";
import Sesion from "../pages/Sesion";

const RoutesApp = () => {
    return (
		<Routes>
			<Route path="/" element={<Home />} />
			<Route path="/course/:id" element={<Course />} />
			<Route path="/search/:category" element={<SearchCourse />} />
			<Route path="/sesion/:sesion" element={<Sesion />} />
		</Routes>
	);
};

export default RoutesApp;