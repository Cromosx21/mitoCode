import CardAbout from "../components/CardAbout";
import { useState } from "react";

export default function About() {
    const [selectCard, setSelectCard ] = useState("El inicio");

    const handleClick = (title) => {
        setSelectCard(title);
    }

    return (
		<section className="bg-gray-100 w-full py-16 px-6 ">
			<div className="max-w-7xl mx-auto flex flex-col gap-12 items-center">
				<h2 className="text-3xl font-semibold text-sky-950">
					¿Quiénes Somos?
				</h2>
				<div className="flex flex-row flex-wrap gap-8 items-center ">
					<CardAbout
						icon="1.png"
						alt="Icono de aprendizaje"
						title="El Inicio"
						description="Nacimos con una cámara y una laptop dictando cursos para Youtube."
						onClick={()=> handleClick("El inicio")}
					/>
					<CardAbout
						icon="nuestro-gran-equipo-1.png"
						alt="Icono de equipo"
						title="Nuestro gran equipo"
						description="Amamos la programación y generamos comunidad."
						onClick={()=> handleClick("Nuestro gran equipo")}
					/>
					<CardAbout
						icon="Aprendes-y-ayudamos.png"
						alt="Icono de ayuda en equipo"
						title="Aprendes y ayudamos"
						description="Un porcentaje de las ventas va destinado a obras sociales."
						onClick={()=> handleClick("Aprendes y ayudamos")}
					/>
				</div>
                {selectCard && (
                    <div className="flex flex-col gap-4 items-center">
                        { selectCard == "El inicio" && (
                            <div className="flex flex-col gap-4 items-center">
                                <h3 className="text-3xl font-semibold text-sky-950">
                                    El inicio
                                </h3>
                                <p>
                                    Nacimos con una cámara y una laptop dictando cursos para Youtube.
                                </p>
                            </div>
                        )}
                        { selectCard == "Nuestro gran equipo" && (
                            <div className="flex flex-col gap-4 items-center">
                                <h3 className="text-3xl font-semibold text-sky-950">
                                    Nuestro gran equipo
                                </h3>
                                <p>
                                    Amamos la programación y generamos comunidad.
                                </p>
                            </div>
                        )}
                        { selectCard == "Aprendes y ayudamos" && (
                            <div className="flex flex-col gap-4 items-center">
                                <h3 className="text-3xl font-semibold text-sky-950">
                                    Aprendes y ayudamos
                                </h3>
                                <p>
                                    Un porcentaje de las ventas va destinado a obras sociales.
                                </p>
                            </div>
                        )}
                    </div>
                )}
			</div>
		</section>
	);
}