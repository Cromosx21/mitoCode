import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import CardCourse from "../components/cardCourse";

export default function FilterCourses({ selectedCategory }) {
	const { courses } = useContext(CourseContext);

	if (!courses || courses.length === 0) {
		return <p className="text-center py-10">Cargando cursos...</p>;
	}

	const filteredCourses = selectedCategory
		? courses.filter(
				(course) =>
					course.categoria?.toLowerCase() ===
					selectedCategory?.toLowerCase()
		)
		: [];

	const formatDate = (dateString) => {
		const date = new Date(dateString);
		return date.toLocaleDateString("es-ES", {
			day: "numeric",
			month: "long",
		});
	};

	return (
		<section className="w-full bg-gray-50 py-10 px-6">
			<div className="max-w-7xl mx-auto flex flex-col flex-wrap gap-8 overflow-visible">
				<h2 className="text-xl font-semibold text-sky-950">
					Cursos de{" "}
					{selectedCategory?.charAt(0).toUpperCase() +
						selectedCategory?.slice(1)}
				</h2>
				<div>
					<div className="flex flex-row flex-wrap items-center justify-between gap-8">
						{filteredCourses.length > 0 ? (
							filteredCourses.map((course) => (
								<CardCourse
									key={course.id} // Agrega una `key` única
									id={course.id}
									imgCourse={course.imagen}
									nameCourse={course.nombre}
									subtitulo={course.subtitulo}
									dateInit={formatDate(course.fecha_inicio)}
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
							<p>No hay cursos disponibles en esta categoría.</p>
						)}
					</div>
				</div>
			</div>
		</section>
	);
}
