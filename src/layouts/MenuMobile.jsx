import { useContext } from "react";
import { CourseContext } from "../context/CourseContext";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faAngleDown, faX } from "@fortawesome/free-solid-svg-icons";
import Anchor from "../components/Anchor";
import AnchorIco from "../components/AnchorIco";
import Search from "../components/Search";

export default function MenuMobile({ closeMenu}) {

    const { setSearchTerm } = useContext(CourseContext);

    const handleSearch = (value) => {
        setSearchTerm(value);
        closeMenu();
    };
    return (
		<div className="bg-[#02020260] w-full h-screen fixed left-0 top-0">
			<div className="bg-gray-50 max-w-1/3 min-w-64 w-full h-full flex flex-col overflow-y-auto">
				<span
					className="absolute top-0 right-0 p-3 text-xl cursor-pointer text-gray-200 hover:text-white transition-all"
					onClick={closeMenu}
				>
					<FontAwesomeIcon icon={faX} />
				</span>
				<Search onSearch={handleSearch}/>
				<AnchorIco
					nameAnchor="Cursos"
					icon={faAngleDown}
					classAnchor={
						"leading-8 px-6 text-xs font-medium hover:bg-gray-100 hover:text-gray-800 text-gray-400"
					}
				/>
				<Anchor
					nameAnchor="Promociones"
					classAnchor="leading-8 px-6 text-xs font-medium hover:bg-gray-100 hover:text-gray-800 text-gray-400"
				/>
				<Anchor
					nameAnchor="Mis certificados"
					classAnchor="leading-8 px-6 text-xs font-medium hover:bg-gray-100 hover:text-gray-800 text-gray-400"
				/>
				<Anchor
					nameAnchor="Acceder"
					classAnchor="leading-8 px-6 text-xs font-medium hover:bg-gray-100 hover:text-gray-800 text-gray-400"
				/>
			</div>
		</div>
	);
}