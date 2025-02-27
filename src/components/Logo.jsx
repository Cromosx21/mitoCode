import { useNavigate } from "react-router-dom";

export default function Logo() {
    const navigate = useNavigate();

	const handleClick = () => {
		navigate(`/`);
	};
    return (
		<div
			className="flex flex-row items-center font-bold text-2xl text-gray-500 cursor-pointer"
			onClick={handleClick}
		>
			<img
				src="/src/assets/logo-removebg-preview.png"
				alt="Logo"
				className="max-h-8"
			/>
			<span className="text-sky-500">Meta</span>Will
		</div>
	);
}