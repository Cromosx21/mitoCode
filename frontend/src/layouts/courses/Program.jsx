export default function Program({ temario }) {
	return (
		<>
			<section className="w-full bg-gray-50 py-16 px-6">
				<div className="max-w-7xl mx-auto flex flex-col gap-8">
					<div className="flex flex-row items-center gap-8 justify-between flex-wrap">
						<div className="flex flex-row items-center gap-8">
							<h2 className="text-3xl font-bold text-sky-950">
								Programa
							</h2>
							<span className="py-2 px-4 bg-sky-50 text-sky-950 text-sm font-bold rounded-md">
								Temario
							</span>
						</div>
						<a 
							href="../src/syllabus/adobe-ilustrator_sistemasuni_UNI.pdf"
							className="flex flex-row items-center gap-2 py-2 px-4 bg-sky-800 rounded-lg cursor-pointer font-semibold uppercase text-gray-50 hover:shadow-md transition-all hover:shadow-gray-400 hover:-translate-y-1 hover:bg-sky-700"
							download
						>
							<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="size-5">
								<path strokeLinecap="round" strokeLinejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m.75 12 3 3m0 0 3-3m-3 3v-6m-1.5-9H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" />
							</svg>

							Descargar Temario
						</a>
					</div>
					<div className="bg-sky-50 py-12 px-6 flex flex-col gap-8 items-center">
						{Object.keys(temario).length > 0 ? (
							Object.entries(temario).map(([key, item]) => (
								<details key={key} className="max-w-3xl w-full">
									<summary className="cursor-pointer flex flex-row items-center gap-4 bg-gray-50 py-4 px-6 rounded-md font-bold shadow-xl shadow-sky-100">
										{item.nombreModulo}
									</summary>
									<ul className="flex flex-col gap-3 mt-4 ml-10">
										{item.temarios.length > 0 ? (
											item.temarios.map((tema, index) => (
												<li
													key={index}
													className="flex flex-row gap-3 items-center text-sm text-gray-800"
												>
													<i className="fa fa-check text-sky-400"></i>
													<p>{tema}</p>
												</li>
											))
											
										) : (
											<li className="text-sm text-gray-500">
												No hay temas disponibles
											</li>
										)}
										{item.temarios.length > 0 ? (
											<li
												className="flex flex-row gap-3 items-center text-sm text-gray-800"
											>
												<i className="fa fa-check text-sky-400"></i>
												<p>y otros temas ...</p>
											</li>

										): null}
									</ul>
								</details>
							))
						) : (
							<p className="text-gray-600">
								No hay temario disponible
							</p>
						)}
					</div>
				</div>
			</section>
		</>
	);
}
