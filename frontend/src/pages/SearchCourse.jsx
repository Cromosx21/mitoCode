import { useParams } from "react-router-dom";
import { useEffect, useState, useContext } from "react";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import FilterCourses from "../layouts/FilterCourses";
import { CourseContext } from "../context/CourseContext";

export default function SearchCourse() {
	const { category } = useParams();
	const { courses } = useContext(CourseContext);
	const [filteredCourses, setFilteredCourses] = useState([]);

	useEffect(() => {
		if (!courses || courses.length === 0) return;

		let results = [...courses];

		if (category && category !== "cursos") {
			results = results.filter(
				(course) =>
					course.categoria?.toLowerCase() === category.toLowerCase()
			);
		}

		setFilteredCourses(results);
	}, [category, courses]);

	return (
		<main className="font-Montserrat">
			<Navbar />
			{filteredCourses.length > 0 ? (
				<FilterCourses
					courses={filteredCourses}
					selectedCategory={category}
				/>
			) : (
				<section className="w-full py-10 px-6 text-center">
					<h2 className="text-xl font-semibold text-sky-950">
						No hay cursos disponibles en esta categoría.
					</h2>
				</section>
			)}
			<Footer />
		</main>
	);
}
