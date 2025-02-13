import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function AnchorIco({ nameAnchor, icon, classAnchor }) {
	return (
		<>
			<a
				href="#"
				className={` py-4 text-md  cursor-pointer  transition-all flex items-center justify-between ${classAnchor}`}
			>
				{nameAnchor}
				<FontAwesomeIcon icon={icon} />
			</a>
		</>
	);
}
