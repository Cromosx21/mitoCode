import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import Navbar from "../loyauts/Navbar";
import Footer from "../loyauts/Footer";
import CardCourse from "../components/cardCourse";

export default function Course() {
	const { id } = useParams(); // Captura el ID desde la URL
	const [course, setCourse] = useState(null);
	const [loading, setLoading] = useState(true);

	useEffect(() => {
		fetch("/src/context/cursos.json")
			.then((response) => response.json())
			.then((data) => {
				const selectedCourse = data.find((course) => course.id === id);
				setCourse(selectedCourse);
				setLoading(false);
			})
			.catch((error) => {
				console.log("Error al cargar el curso:", error);
				setLoading(false);
			});
	}, [id]);

	if (loading) return <p>Cargando...</p>;
	if (!course) return <p>Curso no encontrado</p>;

    return (
        <>
            <section className="w-full bg-gray-50">
                <Navbar />
                <div className="max-w-7xl mx-auto py-8">
                    <CardCourse
                        imgCourse={course.imagen}
                        id={course.id}
                        nameCourse={course.nombre}
                        subtitulo={course.subtitulo}
                        dateInit={course.fecha_inicio}
                        mode={course.modalidad}
                        weeks={course.semanas}
                        hours={course.horas}
                        price={course.precio}
                        status={course.estado}
                    />
                </div>
                <Footer></Footer>
            </section>
        </>
	);
}
