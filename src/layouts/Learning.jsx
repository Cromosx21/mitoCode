import CardLearning from "../components/CardLearning";

export default function Learning() {
    return (
		<section className="bg-sky-950 w-full py-16 px-6 ">
			<div className="max-w-7xl mx-auto">
				<h2 className="text-3xl font-semibold text-sky-400 text-center">
					¿Cómo aprenderás{" "}
					<strong className="text-sky-200 font-semibold">
						en Mitocode?
					</strong>
				</h2>
				<div className="flex items-start flex-wrap flex-row justify-center gap-16 mt-16">
					<CardLearning
						icon="Aprendizaje.png"
						alt="Icono de aprendizaje"
						description="Aprendizaje basado en proyectos reales"
					/>
					<CardLearning
						icon="Cursos-practicos.png"
						alt="Icono de cursos"
						description="Cursos 100% prácticos con casos laborales"
					/>
					<CardLearning
						icon="Conecta-en-tiempo-real.png"
						alt="Icono de conectividad"
						description="Conecta, interactúa y aprende con docentes en tiempo real"
					/>
				</div>
			</div>
		</section>
	);
}