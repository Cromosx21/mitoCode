import { useLocation } from "react-router-dom";
import { useEffect, useState, useContext } from "react";
import Navbar from "./Navbar";
import Footer from "./Footer";
import { CourseContext } from "../context/CourseContext";
import CardCourse from "../components/cardCourse";

// Función para remover acentos
const removeAccents = (str) => {
	return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
};

const formatDate = (dateString) => {
	const date = new Date(dateString);
	return date.toLocaleDateString("es-ES", {
		day: "numeric",
		month: "long",
	});
};

export default function SearchResultsCourses() {
	const location = useLocation();
	const { courses } = useContext(CourseContext);
	const [filteredCourses, setFilteredCourses] = useState([]);
	const [searchQuery, setSearchQuery] = useState("");

	useEffect(() => {
		if (!courses || courses.length === 0) return;

		const searchParams = new URLSearchParams(location.search);
		const searchValue = searchParams.get("search")?.trim() || "";
		setSearchQuery(searchValue); // Guarda la palabra original (sin eliminar acentos)

		const normalizedSearch = removeAccents(searchValue.toLowerCase());

		if (normalizedSearch) {
			const results = courses.filter((course) => {
				const courseName = removeAccents(course.nombre.toLowerCase());
				const courseCategory = removeAccents(
					course.categoria?.toLowerCase() || ""
				);

				return (
					courseName.includes(normalizedSearch) ||
					courseCategory.includes(normalizedSearch)
				);
			});

			setFilteredCourses(results);
		} else {
			setFilteredCourses([]);
		}
	}, [location.search, courses]);

	return (
		<main className="font-Montserrat">
			<Navbar />
			<section className="w-full py-10 px-6">
				<div className="max-w-7xl mx-auto">
					<h2 className="text-2xl font-bold text-sky-950 mb-6">
						Resultados de búsqueda{" "}
						<span className="text-sky-700">"{searchQuery}"</span>
					</h2>

					{filteredCourses.length > 0 ? (
						<div className="flex flex-row flex-wrap items-center justify-center gap-8">
							{filteredCourses.map((course) => (
								<CardCourse
									key={course.id}
									id={course.id}
									imgCourse={course.imagen}
									nameCourse={course.nombre}
									subtitulo={course.subtitulo}
									dateInit={formatDate(course.fecha_inicio)}
									mode={course.modalidad}
									weeks={
										course.modalidad === "En vivo"
											? `${course.duracion} semanas`
											: ""
									}
									hours={`${course.horas} horas`}
									price={course.precio}
									status={course.estado}
								/>
							))}
						</div>
					) : (
						<p className="text-center text-lg text-gray-600">
							No se encontraron cursos con ese término.
						</p>
					)}
				</div>
			</section>
			<Footer />
		</main>
	);
}
