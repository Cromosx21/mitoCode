export default function About({ acerca, nameInstructor}) {
    return (
		<>
			<section className="w-full bg-gray-200 py-12 px-6">
				<div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
					<div className="flex flex-col gap-8">
						<h2 className="text-3xl font-bold text-sky-900">
							Acerca del curso
						</h2>
						<p className="max-w-xl text-sm">
							{ acerca}
						</p>
						<figure className="flex flex-row gap-4 items-start">
							<img
								src="../src/assets/instructor/Dany-Cenas.png"
								alt="Instructor Dany Cenas"
								className="max-w-16 rounded-full aspect-square border-2 border-sky-400"
							/>
							<figcaption>
								<span className="text-sky-950 font-semibold text-sm leading-3">
									Instructor
								</span>
								<p className="text-base font-light text-sky-950 leading-4">
									{nameInstructor}
								</p>
							</figcaption>
						</figure>
					</div>
					<ul className="flex flex-col gap-2">
						<li className="flex flex-row gap-2 items-center">
							<i className="fa-regular fa-star text-sky-500"></i>
							<p className="text-gray-800 text-sm">Acceso de por vida</p>
						</li>
						<li className="flex flex-row gap-2 items-center">
							<i className="fa-regular fa-star text-sky-500"></i>
							<p className="text-gray-800 text-sm">Certificado de aprobación</p>
						</li>
						<li className="flex flex-row gap-2 items-center">
							<i className="fa-regular fa-star text-sky-500"></i>
							<p className="text-gray-800 text-sm">Acceso exclusivo a discord</p>
						</li>
						<li className="flex flex-row gap-2 items-center">
							<i className="fa-regular fa-star text-sky-500"></i>
							<p className="text-gray-800 text-sm">Soporte a dudas</p>
                        </li>
                        <input type="button" value="requisitos"  className="rounded-lg py-2 px-4 bg-sky-900 mt-8 text-gray-50 font-semibold hover:shadow-md transition-all hover:shadow-gray-400 hover:-translate-y-1 cursor-pointer w-fit hover:bg-sky-800" />
					</ul>
				</div>
			</section>
		</>
	);
}