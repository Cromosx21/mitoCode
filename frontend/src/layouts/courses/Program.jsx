export default function Program({ temario }) {
	return (
		<>
			<section className="w-full bg-gray-50 py-16 px-6">
				<div className="max-w-7xl mx-auto flex flex-col gap-8">
					<div className="flex flex-row items-center gap-8">
						<h2 className="text-3xl font-bold text-sky-950">
							Programa
						</h2>
						<span className="py-2 px-4 bg-sky-50 text-sky-950 text-sm font-bold rounded-md">
							Temario
						</span>
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
