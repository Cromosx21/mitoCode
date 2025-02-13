import { useNavigate } from "react-router-dom";

export default function Logo() {
    const navigate = useNavigate();

	const handleClick = () => {
		navigate(`/`);
	};
    return (
        <img src="/src/assets/logo.png" alt="Logo" onClick={(handleClick)} className="cursor-pointer" />
    );
}