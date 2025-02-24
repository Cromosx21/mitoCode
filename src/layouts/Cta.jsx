export default function Cta() {
    return (
		<>
			<section className="bg-sky-200 py-20 px-6 w-full">
				<div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-center lg:justify-between relative gap-8">
					<div className="flex flex-col gap-4 items-start">
						<h2 className="text-2xl font-semibold text-gray-900">¡No postergues más tu educación!</h2>
						<button type="button" className=" py-2 px-4 bg-sky-400 rounded-lg cursor-pointer font-semibold uppercase text-gray-50 hover:shadow-md transition-all hover:shadow-gray-400 hover:-translate-y-1">
							Comienza ahora
						</button>
					</div>
                    <img
                        src="../src/assets/Despega.png"
                        alt="Imagen de Iniciar tu educación."
						className="lg:absolute lg:left-1/2 aspect-auto "
						loading="lazy"
                    />
                    <button type="button">
                        <i className="fa fa-arrow-up py-3 px-4 rounded-full bg-blue-800 text-gray-50 text-2xl cursor-pointer hover:shadow-md transition-all hover:shadow-gray-400 hover:-translate-y-1"></i>
                    </button>
				</div>
			</section>
			<section className="bg-sky-200 px-6 w-full border-t-2 border-t-gray-50">
				<div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 grid-auto-rows justify-start">
                    <article className="col-span-1 py-8 px-8 flex flex-row gap-2">
                        <i className="fa-brands fa-whatsapp text-4xl text-sky-900"></i>
                        <div>
							<h3 className="text-sky-900 font-semibold text-sm">HABLA CON NOSOTROS</h3>
							<span className=" text-gray-900 text-sm">+51 987 654 321</span>
						</div>
					</article>
                    <article className="col-span-1 py-8 lg:border-x-2 lg:border-x-gray-50 px-8 flex flex-row gap-2">
                        <i className="fa-regular fa-message text-4xl text-sky-900"></i>
						<div>
							<h3 className="text-sky-900 font-semibold text-sm">ESCRÍBENOS</h3>
							<span className=" text-gray-900 text-sm">cursos@mitocodenetwork.com</span>
						</div>
					</article>
                    <article className="col-span-1 py-8 px-8 flex flex-row gap-2">
                        <i className="fa-regular fa-question-circle text-4xl text-sky-900"></i>
						<div>
							<h3 className="text-sky-900 font-semibold text-sm">PREGUNTAS FRECUENTES</h3>
							<span className=" text-gray-900 text-sm">Te ayudamos en lo que necesites</span>
						</div>
					</article>
				</div>
			</section>
		</>
	);
}