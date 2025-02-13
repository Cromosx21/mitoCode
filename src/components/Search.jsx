import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";

export default function Search({ onSearch }) {
	const [inputValue, setInputValue] = useState("");

	const handleSubmit = (e) => {
		e.preventDefault();
		onSearch(inputValue);
	};

	return (
		<>
			<form onSubmit={handleSubmit} className="px-6 py-6 flex items-center md:hidden">
				<input
					type="text"
                    placeholder="¿Qué quieres aprender?"
                    value={inputValue}
                    onChange={(e) => setInputValue(e.target.value)}
					className="w-full px-2 py-2 text-xs text-gray-700 font-normal placeholder-gray-500 border border-gray-200 inset-shadow-sm bg-white outline-none "
				/>
				<button className="p-2 bg-sky-400 text-gray-50 text-sm">
					<FontAwesomeIcon icon={faSearch} />
				</button>
			</form>
		</>
	);
}
