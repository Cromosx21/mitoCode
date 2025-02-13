import Logo from "../components/Logo"
import Anchor from "../components/Anchor"
import { faNavicon } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"


export default function Navbar() {
    return (
        <>
            <nav className="w-full bg-slate-50 px-5">
                <div className="flex flex-row items-center justify-between">
                    <div className="flex flex-row items-center gap-2">
                        <span className="text-2xl text-gray-800 py-5 cursor-pointer hover:text-sky-400 transition-colors duration-500 ease-in-out">
                            <FontAwesomeIcon icon={faNavicon} />
                        </span>
                        <Logo />    
                    </div>

                    <div>
                        <Anchor
                            nameAnchor="Acceder"
                            classAnchor="text-sky-900 font-semibold text-sm tracking-wide hover:text-sky-400 transition-colors duration-500 ease-in-out"
                        />
                    </div>

                </div>
            </nav>
        </>
    )
}
