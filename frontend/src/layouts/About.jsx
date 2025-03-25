import CardAbout from "../components/CardAbout";
import { useState } from "react";

export default function About() {
    const [selectCard, setSelectCard ] = useState("El Inicio");

    const handleClick = (title) => {
        setSelectCard(title);
    }

    return (
		<section className="bg-gray-100 w-full py-16 px-6 ">
			<div className="max-w-7xl mx-auto flex flex-col gap-12 items-center">
				<h2 className="text-3xl font-semibold text-sky-950">
					¿Quiénes Somos?
				</h2>
				<div className="flex flex-row flex-wrap gap-8 items-center justify-center ">
					<CardAbout
						icon="1.png"
						alt="Icono de aprendizaje"
						title="El Inicio"
						description="Nacimos con una cámara y una laptop dictando cursos para Youtube."
						onClick={() => handleClick("El Inicio")}
						selectedCard={selectCard}
					/>
					<CardAbout
						icon="nuestro-gran-equipo-1.png"
						alt="Icono de equipo"
						title="Nuestro gran equipo"
						description="Amamos la programación y generamos comunidad."
						onClick={() => handleClick("Nuestro gran equipo")}
						selectedCard={selectCard}
					/>
					<CardAbout
						icon="Aprendes-y-ayudamos.png"
						alt="Icono de ayuda en equipo"
						title="Aprendes y ayudamos"
						description="Un porcentaje de las ventas va destinado a obras sociales."
						onClick={() => handleClick("Aprendes y ayudamos")}
						selectedCard={selectCard}
					/>
				</div>
				{selectCard && (
					<div className="flex flex-col gap-4 items-start w-full">
						{selectCard == "El Inicio" && (
							<div className="flex flex-col gap-4 items-center">
								<img
									src="../src/assets/Iniciamos.png"
									alt="Imagen de inicio aspect-auto"
									loading="lazy"
								/>
							</div>
						)}
						{selectCard == "Nuestro gran equipo" && (
							<div className="flex flex-col gap-8 min-w-full">
								<h3 className="text-2xl font-semibold text-sky-950 self-start w-full">
									Nuestro Gran Equipo
								</h3>
								<div className="flex flex-row flex-wrap gap-8 items-center justify-between">
									<figure className="max-w-64">
										<img
											src="../src/assets/Nuestro-Equipo/Abraham-Salazar.png"
											alt="Foto del profesor Abraham Salazar"
											className="aspect-square"
											loading="lazy"
										/>
									</figure>
									<figure className="max-w-64">
										<img
											src="/Nuestro-Equipo/Dany-Cenas.png"
											alt="Foto del profesor Dany Cenas"
											className="aspect-square"
											loading="lazy"
										/>
									</figure>
									<figure className="max-w-64">
										<img
											src="/Nuestro-Equipo/Jaime-Medina.png"
											alt="Foto del profesor Jaime Medina"
											className="aspect-square"
											loading="lazy"
										/>
									</figure>
									<figure className="max-w-64">
										<img
											src="/Nuestro-Equipo/William-Marchan.png"
											alt="Foto del profesor William Marchan"
											className="aspect-square"
											loading="lazy"
										/>
									</figure>
								</div>
							</div>
						)}
						{selectCard == "Aprendes y ayudamos" && (
							<div className="flex flex-row gap-16 flex-wrap items-center justify-center w-full">
								<div className="flex flex-col gap-6 min-w-2xs">
									<div className="flex flex-col gap-2">
										<h3 className="text-2xl font-semibold text-gray-900">
											Aprendes y ayudamos
										</h3>
										<p className="text-sm text-sky-900">
											Con cada granito de arena hacemos un
											mundo mejor
										</p>
									</div>
									<button
										type="button"
										className="bg-gray-300 py-3 px-4 text-left text-sm font-semibold text-sky-950 flex flex-row items-center gap-2 rounded-lg cursor-pointer"
									>
										<span className="w-6 h-4 inline-block bg-red-600 rounded-sm relative before:content-[''] before:absolute before:top-1/2 before:left-1/2 before:w-1 before:h-1 before:border-l-4 before:border-l-gray-50 before:border-t-4 before:border-t-transparent before:border-b-4 before:border-b-transparent before:-translate-x-1/2 before:-translate-y-1/2"></span>
										Youtube.com/mitocode
									</button>
								</div>
								<img
									src="/Ayuda-benefica.png"
									alt="Foto de ayuda benéfica a diversos lugares."
									className="max-w-3xl w-full border-8 border-gray-50 shadow-lg aspect-auto"
									loading="lazy"
								/>
							</div>
						)}
					</div>
				)}
			</div>
		</section>
	);
}