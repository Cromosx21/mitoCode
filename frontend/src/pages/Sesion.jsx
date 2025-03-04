import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import Login from "../layouts/Sesion/Login";
import { useParams } from "react-router-dom";
import Register from "../layouts/Sesion/Register";
import Forgot from "../layouts/Sesion/Forgot";

export default function Sesion() {
    const { sesion } = useParams();
    return (
        <>
            <Navbar />
            <main className="font-Montserrat">
                { sesion === "login" ? <Login /> : sesion === "register" ? <Register /> : sesion === "forgot" ? <Forgot /> : "" }

            </main>
            <Footer />
        </>
    );
}