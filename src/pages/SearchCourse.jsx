import { useParams } from "react-router-dom";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import FilterCourses from "../layouts/FilterCourses";

export default function SearchCourse() {
	const { category } = useParams(); // Obtener categoría de la URL

	return (
		<>
			<main className="font-Montserrat">
				<Navbar />
				<FilterCourses selectedCategory={category} />
				<Footer />
			</main>
		</>
	);
}
