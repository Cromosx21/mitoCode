import { useNavigate } from "react-router-dom"


export default function AnchorSubMenu({ nameModule, icon, closeSubMenu }) {
    const navigate = useNavigate();

    const handleClick = () => {
        closeSubMenu();
        navigate(`/search/${encodeURIComponent(nameModule.toLowerCase())}`);
    }

    return (
        <>
            <li className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500 flex items-center gap-2"
                onClick={handleClick}
            >
                <i className={`fa-solid ${icon}`}></i>
                {nameModule}
            </li>
        </>
    )
}