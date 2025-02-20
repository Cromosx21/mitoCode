export default function Hero() {
    return (
        <section className="bg-sky-400 w-full py-8 px-6 ">
            <div className="Max-w-7xl mx-auto flex flex-row items-center justify-between">
                <div className="flex flex-col gap-16">
                    <div className="max-w-xl flex flex-col gap-4">
                        <h1 className="font-bold text-4xl tracking-tighter text-gray-50 uppercase">Aprende tecnologías de alta demanda laboral</h1>
                        <p className=" font-light text-sm text-gray-900">Nos dedicamos que crezcas profesionalmente y puedas aplicarlo en tu vida</p>
                    </div>
                    <button className="py-2 px-4 w-fit bg-blue-900 text-gray-50 text-lg font font-semibold rounded-full cursor-pointer hover:bg-blue-800 transition-colors duration-500 ease-in-out" >
                        !Comienza ahora!
                    </button>
                </div>
                <div>
                    <img src="" alt="" />
                </div>

            </div>
        </section>
    );
}