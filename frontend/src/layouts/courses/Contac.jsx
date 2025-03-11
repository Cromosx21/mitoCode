export default function Contac() {
    return (
		<>
			<section className="bg-sky-200 px-6 w-full border-t-2 border-t-gray-50">
				<div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 grid-auto-rows justify-start">
					<article className="col-span-1 py-8 px-8 flex flex-row gap-2">
						<i className="fa-brands fa-whatsapp text-4xl text-sky-900"></i>
						<div>
							<h3 className="text-sky-900 font-semibold text-sm">
								HABLA CON NOSOTROS
							</h3>
							<span className=" text-gray-900 text-sm">
								+51 912 258 843
							</span>
						</div>
					</article>
					<article className="col-span-1 py-8 lg:border-x-2 lg:border-x-gray-50 px-8 flex flex-row gap-2">
						<i className="fa-regular fa-message text-4xl text-sky-900"></i>
						<div>
							<h3 className="text-sky-900 font-semibold text-sm">
								ESCRÍBENOS
							</h3>
							<span className=" text-gray-900 text-sm">
								istpmetawill@gmail.com
							</span>
						</div>
					</article>
					<article className="col-span-1 py-8 px-8 flex flex-row gap-2">
						<i className="fa-regular fa-question-circle text-4xl text-sky-900"></i>
						<div>
							<h3 className="text-sky-900 font-semibold text-sm">
								PREGUNTAS FRECUENTES
							</h3>
							<span className=" text-gray-900 text-sm">
								Te ayudamos en lo que necesites
							</span>
						</div>
					</article>
				</div>
			</section>
		</>
	);
}