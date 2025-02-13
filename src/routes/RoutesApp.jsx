import { Route, Routes } from "react-router-dom";
import Home from "../pages/Home";
import Course from "../pages/Course";

const RoutesApp = () => {
    return (
		<Routes>
			<Route path="/" element={<Home />} />
			<Route path="/course/:id" element={<Course />} />
		</Routes>
	);
};

export default RoutesApp;