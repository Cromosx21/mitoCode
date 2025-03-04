import { Route, Routes } from "react-router-dom";
import Home from "../pages/Home";
import Course from "../pages/Course";
import SearchCourse from "../pages/SearchCourse";

const RoutesApp = () => {
    return (
		<Routes>
			<Route path="/" element={<Home />} />
			<Route path="/course/:id" element={<Course />} />
			<Route path="/search/:category" element={<SearchCourse />} />
		</Routes>
	);
};

export default RoutesApp;