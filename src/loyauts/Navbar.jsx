import { useState, useEffect } from "react";
import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import Logo from "../components/Logo";
import Anchor from "../components/Anchor";
import { faNavicon, faSearch } from "@fortawesome/free-solid-svg-icons";
import { faAngleDown } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AnchorIco from "../components/AnchorIco";
import MenuMobile from "./MenuMobile";

export default function Navbar() {
    const [isMenuOpen, setIsMenuOpen] = useState(false);
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

	return (
		<>
			<nav className="w-full bg-slate-100 px-5 shadow-md sticky top-0 z-10">
				<div className="flex flex-row items-center justify-between max-w-7xl mx-auto">
					<div className="flex flex-row items-center gap-6">
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
						<div className=" flex-row items-center gap-4 hidden lg:flex">
							<AnchorIco
								nameAnchor="Cursos"
								icon={faAngleDown}
								classAnchor="text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out gap-1"
							/>
							<Anchor
								nameAnchor="Promociones"
								classAnchor=" leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out"
							/>
							<Anchor
								nameAnchor="Mis certificados"
								classAnchor=" leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out"
							/>
						</div>
					</div>

					<div className="flex flex-row items-center gap-2 md:max-w-md md:w-full md:justify-end">
						<form
                            onSubmit={(e) => e.preventDefault() }
							className="border border-gray-200 inset-shadow-sm bg-white rounded-md items-center justify-between hidden md:flex"
						>
							<input
								type="text"
								name=""
								id=""
								placeholder="¿Que quieres aprender?"
                                className="w-full min-w-64 px-2 py-2 text-xs text-gray-800 font-regular  outline-none "
                                onChange={(e) => setSearchTerm(e.target.value)}
							/>
							<button className="px-2 py-2 text-md text-gray-800">
								<FontAwesomeIcon icon={faSearch} />
							</button>
						</form>
						{/* <span className="w-px h-6 bg-slate-300 hidden md:block"></span>
						<a
							href="#"
							className=" flex flex-row items-center gap-2 px-2 text-sm font-bold text-sky-900 hover:text-sky-400 transition-colors duration-500 ease-in-out"
						>
							<img
								src="https://flagcdn.com/w40/pe.png"
								alt="Perú"
								className=""
							/>
							PEN
							<span>
								<FontAwesomeIcon icon={faAngleDown} />
							</span>
						</a>
						<span className="w-px h-6 bg-slate-300 hidden sm:block"></span>
						<Anchor
							nameAnchor="Acceder"
							classAnchor="leading-14 text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out hidden sm:block"
						/> */}
					</div>
				</div>
			</nav>
		</>
	);
}
