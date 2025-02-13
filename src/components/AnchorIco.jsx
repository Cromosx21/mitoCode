import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function AnchorIco({ nameAnchor, icon }) {
	return (
		<>
			<a href="#" className="px-6 py-4 text-xs text-gray-400 font-bold cursor-pointer hover:bg-gray-100 hover:text-gray-800 transition-all flex items-center justify-between">
                {nameAnchor}
                <FontAwesomeIcon icon={icon} />
			</a>
		</>
	);
}
