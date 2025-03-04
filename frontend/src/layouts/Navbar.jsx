import { useState, useEffect } from "react";
import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import { useNavigate } from "react-router-dom";
import Logo from "../components/Logo";
import Anchor from "../components/Anchor";
import {
	faNavicon,
	faSearch,
	faAngleDown,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import MenuMobile from "./MenuMobile";
import SubMenuCursos from "../components/SubMenuCursos";

export default function Navbar() {
	const [isMenuOpen, setIsMenuOpen] = useState(false); // Menú mobile
	const [isSubMenuOpen, setIsSubMenuOpen] = useState(false); // Submenú de Cursos
	const { setSearchTerm } = useContext(CourseContext);

	useEffect(() => {
		const handleResize = () => {
			if (window.innerWidth > 1024) {
				setIsMenuOpen(false);
			}
		};

		window.addEventListener("resize", handleResize);
		return () => window.removeEventListener("resize", handleResize);
	}, []);

	const navigate = useNavigate();

	return (
		<>
			<nav className="w-full bg-slate-100 px-5 shadow-md sticky top-0 z-20">
				<div className="flex flex-row items-center justify-between max-w-7xl mx-auto">
					<div className="flex flex-row items-center gap-6">
						{/* Menú móvil */}
						<span
							className="text-2xl text-gray-900 py-5 cursor-pointer hover:text-sky-400 transition-colors duration-500 ease-in-out lg:hidden"
							onClick={() => setIsMenuOpen(!isMenuOpen)}
						>
							<FontAwesomeIcon icon={faNavicon} />
						</span>
						{isMenuOpen && (
							<MenuMobile
								closeMenu={() => setIsMenuOpen(false)}
							/>
						)}

						<Logo />

						{/* Menú de escritorio */}
						<div className="flex-row items-center gap-4 hidden lg:flex">
							{/* Cursos - Ahora con Click en vez de Hover */}
							<div className="relative">
								<button
									className="flex items-center text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out gap-1 cursor-pointer"
									onClick={() =>
										setIsSubMenuOpen(!isSubMenuOpen)
									}
								>
									Cursos
									<FontAwesomeIcon
										icon={faAngleDown}
										className={`transition-transform duration-300 ${
											isSubMenuOpen ? "rotate-180" : ""
										}`}
									/>
								</button>
								{isSubMenuOpen && (
									<SubMenuCursos
										closeSubMenu={() =>
											setIsSubMenuOpen(false)
										}
									/>
								)}
							</div>

							<Anchor
								nameAnchor="Promociones"
								classAnchor="leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out"
							/>
							<Anchor
								nameAnchor="Mis certificados"
								classAnchor="leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out"
							/>
						</div>
					</div>

					{/* Buscador */}
					<div className="flex flex-row items-center gap-2 md:max-w-md md:w-full md:justify-end">
						<form
							onSubmit={(e) => e.preventDefault()}
							className="border border-gray-200 inset-shadow-sm bg-white rounded-md items-center justify-between hidden md:flex"
						>
							<input
								type="text"
								placeholder="¿Qué quieres aprender?"
								className="w-full min-w-64 px-2 py-2 text-xs text-gray-800 font-regular outline-none"
								onChange={(e) => setSearchTerm(e.target.value)}
							/>
							<button className="px-2 py-2 text-md text-gray-800">
								<FontAwesomeIcon icon={faSearch} />
							</button>
						</form>
						<span className="w-0.5 h-6 bg-gray-300 block mx-2"></span>
						<button
							className="leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out cursor-pointer"
							onClick={() => navigate("/sesion/login")}
						>
							Iniciar sesión
						</button>
					</div>
				</div>
			</nav>
		</>
	);
}
