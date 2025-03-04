import { useParams } from "react-router-dom";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import FilterCourses from "../layouts/FilterCourses";
import AllCourses from "../layouts/AllCourses";

export default function SearchCourse({ }) {
	const { category } = useParams(); // Obtener categoría de la URL

	return (
		<>
			<main className="font-Montserrat">
				<Navbar />
				{ category === "cursos" ? <AllCourses /> : <FilterCourses selectedCategory={category} />}
				<Footer />
			</main>
		</>
	);
}
