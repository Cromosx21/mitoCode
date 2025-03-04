import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
	faAngleRight,
	faGlobe,
	faFlag,
} from "@fortawesome/free-solid-svg-icons";
import AnchorSubMenu from "./AnchorSubMenu";

export default function SubMenuCursos({ closeSubMenu }) {
	const [selectedCategory, setSelectedCategory] = useState("online");

	return (
		<div className="absolute top-full left-0 flex bg-gray-100 shadow-md rounded-md min-w-3xl w-fit text-gray-800 text-sm font-semibold">
			{/* Panel izquierdo: Categorías */}
			<div className="p-4 w-md ">
				{/* Cursos Online */}
				<div
					className={`flex items-center justify-between p-2 cursor-pointer rounded-md text-gray-500  ${
						selectedCategory === "online"
							? "bg-sky-100 text-gray-800"
							: "hover:bg-sky-50 hover:text-gray-800"
					}`}
					onClick={() => setSelectedCategory("online")}
				>
					<span className="flex items-center gap-2">
						<FontAwesomeIcon icon={faGlobe} />
						Cursos Online
					</span>
					<FontAwesomeIcon icon={faAngleRight} />
				</div>

				{/* Cursos Presenciales */}
				<div
					className={`flex items-center justify-between p-2 cursor-pointer rounded-md text-gray-500 ${
						selectedCategory === "presencial"
							? "bg-sky-100 text-gray-800"
							: "hover:bg-sky-50 hover:text-gray-800"
					}`}
					onClick={() => setSelectedCategory("presencial")}
				>
					<span className="flex items-center gap-2">
						<FontAwesomeIcon icon={faFlag} />
						Cursos Presenciales
					</span>
					<FontAwesomeIcon icon={faAngleRight} />
				</div>
			</div>

			{/* Panel derecho: Contenido de la categoría seleccionada */}
			<div className=" p-4 bg-gray-50 w-full">
				{selectedCategory === "online" ? (
					<ul>
						<AnchorSubMenu icon="fa-sticky-note" nameModule="Ofimática" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-palette" nameModule="Diseño Gráfico" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-laptop" nameModule="Diseño Web" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-code" nameModule="Programación" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-database" nameModule="Base de Datos" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-rocket" nameModule="Tecnologías" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-globe" nameModule="Cursos Internacionales" closeSubMenu={closeSubMenu}/>
						<AnchorSubMenu icon="fa-language" nameModule="Idiomas" closeSubMenu={closeSubMenu}/>
					</ul>
				) : (
					<>
						<p className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500">
							Backend Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500">
							Cloud e infraestructura Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500">
							DevOps Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500">
							Ver todos
						</p>
					</>
				)}
			</div>
		</div>
	);
}
