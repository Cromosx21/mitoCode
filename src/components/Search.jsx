import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";

export default function Search() {
    return (
        <>
            <form action="" className="px-6 py-6 flex items-center">
                <input type="text" placeholder="¿Qué quieres aprender?" className="w-full px-2 py-2 text-xs text-gray-400 font-extralight border border-gray-200 inset-shadow-sm bg-white outline-none " />
                <button className="p-2 bg-sky-400 text-gray-50 text-sm">
                    <FontAwesomeIcon icon={faSearch} />
                </button>

            </form>
        </>
    )
}