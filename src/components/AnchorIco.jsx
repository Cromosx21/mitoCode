import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function AnchorIco({ nameAnchor, icon }) {
	return (
		<>
			<a href="#" className="">
                {nameAnchor}
                <FontAwesomeIcon icon={icon} />
			</a>
		</>
	);
}
