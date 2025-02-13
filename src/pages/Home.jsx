import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import Navbar from "../loyauts/Navbar";
import Footer from "../loyauts/Footer";
import CardCourse from "../components/cardCourse";

export default function Home() {
    const { courses, searchTerm } = useContext(CourseContext);

	const filteredCourses = courses.filter((course) =>
		course.nombre.toLowerCase().includes(searchTerm.toLowerCase())
	);


	return (
		<div className="font-Montserrat">
			<Navbar />
			<section className="bg-slate-50 w-full py-8 px-6">
				<div className="max-w-7xl mx-auto flex flex-row flex-wrap gap-12 justify-center ">
					{filteredCourses.length > 0 ? (
						filteredCourses.map((course) => (
							<CardCourse
                                key={course.id}
                                id={course.id}
								imgCourse={course.imagen}
								nameCourse={course.nombre}
								subtitulo={course.subtitulo}
								dateInit={course.fecha_inicio}
								mode={course.modalidad}
								weeks={
									course.modalidad === "En vivo"
										? course.semanas
										: ""
								}
								hours={course.horas}
								price={course.precio}
								status={course.estado}
							/>
						))
					) : (
						<p>No se encontraron cursos</p>
					)}
				</div>
			</section>
			<Footer />
		</div>
	);
}
