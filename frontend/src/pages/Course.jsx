import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import About from "../layouts/courses/About";
import Learning from "../layouts/courses/Learning";
import Program from "../layouts/courses/program";
import MethodPay from "../layouts/courses/methodPay";
import { getCourses } from "../services/courseServices";
import Question from "../layouts/courses/Question";
import Contac from "../layouts/courses/Contac";
import Hours from "../layouts/courses/Hours";

export default function Course() {
	const { id } = useParams(); // Captura el ID desde la URL
	const [course, setCourse] = useState(null);
	const [loading, setLoading] = useState(true);

	useEffect(() => {
		const fetchCourse = async () => {
			try {
				const data = await getCourses();
				const selectedCourse = data.find((course) => course.id.toString() === id);
				
				if(selectedCourse){
					setCourse(selectedCourse);
				} else {
					console.error("Curso no encontrado.");
				}


			} catch (error) {
				console.error("Error al cargar los curso:", error);
				setLoading(false);
			} finally {
				setLoading(false);
			}
		};

		fetchCourse();
	}, [id]);

	if (loading) return <p className="text-center py-10 text-lg font-bold">Cargando...</p>;
	if (!course) return (
		<p className="text-center py-10 text-lg font-bold text-red-500">
			Curso no encontrado
		</p>
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
			<Navbar />
			<main className="font-Montserrat">
				<section className="w-full bg-gray-800 py-12 px-6">
					<div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-between gap-8">
						<div className="flex flex-col gap-4">
							<div>
								<h1 className="font-bold text-3xl text-sky-400 tracking-tight uppercase">
									{course.nombre}
								</h1>
								<p className="text-base text-gray-50 ">
									{course.subtitulo}
								</p>
							</div>
							<ul className="grid grid-cols-2 gap-4 grid-auto-rows text-gray-200">
								<li className="flex flex-row items-center gap-2">
									<i className="fa-regular fa-calendar"></i>
									<span>
										Inicio:{" "}
										<span className="font-semibold">
											{formatDate(course.fecha_inicio)}
										</span>
									</span>
								</li>
								<li className="flex flex-row items-center gap-2">
									<i className="fa-regular fa-check-circle"></i>
									<span>
										Categoría:{" "}
										<span className="font-semibold">
											{course.categoria}
										</span>
									</span>
								</li>
								<li className="flex flex-row items-center gap-2">
									<i className="fa-regular fa-hourglass"></i>
									<span>
										Duración:{" "}
										<span className="font-semibold">
											{course.semanas}
										</span>
									</span>
								</li>
								<li className="flex flex-row items-center gap-2">
									<i className="fa fa-circle text-red-600"></i>
									<span>
										Modo:{" "}
										<span className="font-semibold">
											{course.modalidad}
										</span>
									</span>
								</li>
							</ul>
							<hr className="border-gray-500" />
							<div className="text-gray-200 flex flex-row flex-wrap items-center justify-between">
								<div className="flex flex-col gap-1">
									<span>Precio total</span>
									<span className="font-bold text-xl">
										PEN S/ {course.precio}
									</span>
								</div>
								<div>
									<span className="py-2 px-4 bg-green-300 text-green-800 uppercase font-bold rounded-md">
										{course.estado}
									</span>
								</div>
							</div>
							<hr className="border-gray-500" />
							<div>
								<input
									type="button"
									value="Reservar vacante"
									className="py-2 px-4 w-full bg-sky-600 text-gray-50 text-lg font-semibold rounded-lg cursor-pointer hover:bg-sky-500 duration-500 ease-in-out hover:-translate-y-1 transition-all hover:shadow-xl"
								/>
							</div>
						</div>
						<div>
							<img
								src="../src/assets/course/AWSD.png"
								alt="Imagen del curso"
							/>
						</div>
					</div>
				</section>
				<About
					acerca={course.detalles.acerca}
					nameInstructor={course.detalles.docente.nombre}
				/>
				<Learning
					dirigido={course.detalles.dirigido}
					habilidades={course.detalles.habilidades}
				/>
				<Program temario={course.detalles.temario} />
				<Hours
					inicio={formatDate(course.fecha_inicio)}
				/>
				<MethodPay pagos={course.precio} />
				<Question />
				<Contac />
			</main>
			<Footer></Footer>
		</>
	);
}
