import Logo from "../components/Logo";

export default function Footer() {
    return (
        <footer className="bg-slate-800 text-gray-50 py-6 px-4 w-full flex flex-wrap items-center justify-center gap-8  ">
            <div className=" bg-gray-50 w-fit py-3 px-4 rounded-xl">
                <Logo />
            </div>
            <div className="text-center">
                Todos los derechos reservados &copy; 2025
            </div>
        </footer>
    );
}