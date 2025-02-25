import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
	faAngleRight,
	faGlobe,
	faFlag,
} from "@fortawesome/free-solid-svg-icons";

export default function SubMenuCursos() {
	const [selectedCategory, setSelectedCategory] = useState("online");

	return (
		<div className="absolute top-full left-0 flex bg-gray-100 shadow-md rounded-md min-w-3xl w-fit text-gray-800 text-sm font-semibold">
			{/* Panel izquierdo: Categorías */}
			<div className="p-4 w-md ">
				{/* Cursos Online */}
				<div
					className={`flex items-center justify-between p-2 cursor-pointer rounded-md  ${
						selectedCategory === "online"
							? "bg-gray-50"
							: "hover:bg-gray-100"
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
					className={`flex items-center justify-between p-2 cursor-pointer rounded-md ${
						selectedCategory === "presencial"
							? "bg-gray-50"
							: "hover:bg-gray-100"
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
					<>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							Backend
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							Cloud e infraestructura
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							DevOps
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer font-semibold">
							Ver todos
						</p>
					</>
				) : (
					<>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							Backend Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							Cloud e infraestructura Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer">
							DevOps Presencial
						</p>
						<p className="p-2 hover:bg-gray-100 cursor-pointer font-semibold">
							Ver todos
						</p>
					</>
				)}
			</div>
		</div>
	);
}
