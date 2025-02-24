import CardTestimonials from "../components/CardTestimonials";

export default function Testimonials() {
	return (
		<section className="bg-gray-50 w-full py-16 px-6 ">
			<div className="max-w-7xl mx-auto relative">
				<div className="mt-32 flex flex-col gap-8">
					<img
						src="../src/assets/Medios.png"
						alt="Imagen de medios de comunicación de los testimonios."
						className="max-w-xs absolute left-1/2 -translate-x-1/2 -top-64 sm:-top-36 xl:-top-1/2 sm:-translate-y-1/2 aspect-auto"
						loading="lazy"
					/>
					<h2 className="text-2xl font-bold text-sky-950 text-center">
						Testimonios
					</h2>
					<div className="flex flex-row flex-wrap items-start justify-around gap-8">
						<CardTestimonials
							testimonial="Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, quia? elit. Ab, quia? Lorem ipsum dolor sit amet"
							imageUser="Abraham-Salazar.png"
							nameUser="Abraham Salazar"
							jobUser="Programador Frontend"
						/>
						<CardTestimonials
							testimonial="Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, quia? Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, quia? adipisicing elit. Ab, quia? Lorem ipsum dolor s"
							imageUser="Dany-Cenas.png"
							nameUser="Dany Cenas"
							jobUser="Desarrollador Backend"
						/>
						<CardTestimonials
							testimonial="Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, quia? lorem ipsum dolor sat amet consectetur adipisicing elit. Ab, quia? Ab, quia? lorem ipsum dolor sat"
							imageUser="Jaime-Medina.png"
							nameUser="Jaime Medina"
							jobUser="Programador Fullstack"
						/>
					</div>
				</div>
			</div>
		</section>
	);
}
