export default function Hero() {
    return (
        <section className="bg-sky-400 w-full py-4 px-6 relative overflow-hidden">
            <span className="absolute max-w-[512px] w-full h-[512px] border-[96px] rounded-full -top-32 -left-40 z-0 border-sky-500"></span>
            <span className="absolute max-w-64 w-full h-64 border-[64px] rounded-full -bottom-32 right-24 z-0 border-sky-500"></span>
            <div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-center gap-16 ">
                <div className=" flex flex-col gap-16 z-10 max-w-lg min-w-2xs">
                    <div className="max-w-xl flex flex-col gap-4 z-10">
                        <h1 className="font-bold text-4xl tracking-tighter text-gray-50 uppercase">Aprende tecnologías de alta demanda laboral</h1>
                        <p className=" font-light text-base text-gray-900">Nos dedicamos que crezcas profesionalmente y puedas aplicarlo en tu vida</p>
                    </div>
                    <button type="button" className="py-2 px-4 w-fit bg-blue-900 text-gray-50 text-lg font-semibold rounded-full cursor-pointer hover:bg-blue-800  duration-500 ease-in-out hover:-translate-y-1 transition-all hover:shadow-xl" onClick={() => { window.location.href = "/search/cursos" }} >
                        !Comienza ahora!
                    </button>
                </div>
                <div className="z-10">
                    <img src="/Hero.png" alt="Imagen referencial de un una persona aprendiendo a programar" className="max-w-2xl w-full aspect-auto" />
                </div>

            </div>
        </section>
    );
}