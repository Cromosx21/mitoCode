import Anchor from "../components/Anchor"
import Logo from "../components/Logo"
import AnchorIco from "../components/AnchorIco"
import { faAngleDown } from "@fortawesome/free-solid-svg-icons"


export default function Navbar() {
    return (
        <>
            <nav className="w-full">
                <div>
                    <div>
                        <Logo />
                        <div>
                            <AnchorIco nameAnchor="Hola" icon={faAngleDown} />
                            <Anchor nameAnchor="Cursos" />
                            <Anchor nameAnchor="Promociones" />
                            <Anchor nameAnchor="Mis certificados" />
                        </div>
                    </div>

                </div>
            </nav>
        </>
    )
}
