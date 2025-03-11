export default function Hours({ inicio}) {
    return (
		<>
			<section className="w-full bg-gray-50 py-12 px-8">
				<div className="max-w-7xl mx-auto">
					<h2 className="text-3xl font-semibold text-sky-950">
						Horario
					</h2>
					<div className="flex flex-row flex-wrap items-center justify-between gap-8 mt-8">
						<div className="text-gray-800 flex flex-col text-sm">
							<p>Frecuencia:</p>
							<b className="text-sky-950">
								Tendremos clases 2 días por semana
							</b>
							<p className="text-gray-500">
								*Toda reprogramación de clase será avisada con
								un mínimo de 2 días de anticipación y/o motivos
								extraordinarios.
							</p>
						</div>
						<div className="py-3 px-4 flex flex-row items-center gap-2 bg-sky-100 rounded-sm text-sky-950 text-sm font-bold w-fit">
							<i className="fa-regular fa-calendar"></i>
							<span>Inicio: {inicio}</span>
						</div>
					</div>

					<table className=" w-full mt-8 ">
						<thead className="border-b border-b-gray-300">
							<tr className="grid grid-cols-2 justify-items-start gap-4 py-2 px-6">
								<th className="text-sky-950 text-base font-semibold flex flex-row gap-2 items-center">
									<i className="fa-regular fa-flag"></i>
									<span>País</span>
								</th>
								<th className="text-sky-950 text-base font-semibold flex flex-row gap-2 items-center">
									<i className="fa-regular fa-clock"></i>
									<span>Horario</span>
								</th>
							</tr>
						</thead>
						<tbody className="">
							<tr className="grid grid-cols-2 justify-items-start gap-4 py-4 px-6 border-b border-b-gray-300">
								<td className="flex flex-row gap-2 items-center">
                                    <span className="flag-icon flag-icon-pe text-xl"></span>
                                    <span className="text-gray-800 text-lg">Perú</span>
								</td>
								<td className="text-sm flex flex-col gap-6">
									<div className="flex flex-col items-center">
										<span className="text-sky-950 font-semibold">
											Miércoles y Viernes
										</span>
										<p className="text-gray-800">
											19:30 p.m. - 21:30 p.m.
										</p>
									</div>
									<div className="flex flex-col items-center">
										<span className="text-sky-950 font-semibold">
											Martes y Jueves
										</span>
										<p className="text-gray-800">
											19:30 p.m. - 21:30 p.m.
										</p>
									</div>
									<div className="flex flex-col items-center">
										<span className="text-sky-950 font-semibold">
											Sábados
										</span>
										<p className="text-gray-800">
											16:00 p.m. - 18:00 p.m.
										</p>
									</div>
									<div className="flex flex-col items-center">
										<span className="text-sky-950 font-semibold">
											Domingos
										</span>
										<p className="text-gray-800">
											10:00 a.m. - 12:00 p.m.
										</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
		</>
	);
}