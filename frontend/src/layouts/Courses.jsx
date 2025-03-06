import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import CardCourse from "../components/cardCourse";
import { useNavigate } from "react-router-dom";

// Importación de Swiper
import { Swiper, SwiperSlide } from "swiper/react";
import { EffectCoverflow, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/effect-coverflow";

export default function Courses() {
	const { courses, searchTerm } = useContext(CourseContext);
	const navigate = useNavigate();

	const handleClick = () => {
		// closeSubMenu();
		navigate(`/search/cursos`);
	};

	const filteredCourses = courses.filter((course) =>
		course.nombre.toLowerCase().includes(searchTerm.toLowerCase())
	);
	const formatDate = (dateString) => {
		const date = new Date(dateString);
		return date.toLocaleDateString("es-ES", {
			day: "numeric",
			month: "long",
		});
	};

	return (
		<>
			<section className="bg-gray-800 w-full py-16 px-6">
				<div className="max-w-screen-xl mx-auto flex flex-col flex-wrap gap-12 overflow-visible">
					<h2 className="text-3xl font-bold text-gray-50">
						Nuestros Cursos
					</h2>
					<div>
						
					</div>
					<Swiper
						modules={[Autoplay, EffectCoverflow]}
						spaceBetween={30}
						slidesPerView={1}
						centeredSlides={true}
						autoplay={{ delay: 5000, disableOnInteraction: false }}
						loop={true}
						speed={800}
						effect="coverflow"
						coverflowEffect={{
							rotate: 0,
							stretch: 0,
							depth: 0,
							modifier: 1,
							slideShadows: false,
						}}
						className="w-full"
						breakpoints={{
							640: { slidesPerView: 1.2 },
							768: { slidesPerView: 2.2 },
							1024: { slidesPerView: 3.2 },
						}}
					>
						{filteredCourses.length > 0 ? (
							filteredCourses.map((course) => (
								<SwiperSlide key={course.id}>
									<CardCourse
										id={course.id}
										imgCourse={course.imagen}
										nameCourse={course.nombre}
										subtitulo={course.subtitulo}
										dateInit={formatDate(course.fecha_inicio) }
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
								</SwiperSlide>
							))
						) : (
							<p className="text-gray-50">
								No se encontraron cursos
							</p>
						)}
					</Swiper>
					<button
						type="button"
						className="py-2 px-4 w-fit bg-blue-900 text-gray-50 font-medium text-sm rounded-lg cursor-pointer hover:bg-blue-800  duration-500 ease-in-out hover:-translate-y-1 transition-all hover:shadow-xl mx-auto"
						onClick={handleClick}
					>
						Ver más cursos
					</button>
				</div>
			</section>
		</>
	);
}
