export default function Learning({ dirigido, habilidades }) {
    return (
		<>
			<section className="w-full py-6 px-6 bg-[linear-gradient(to_bottom,_#e5e7eb_50%,_#f9fafb_50%)]">
				<div className="max-w-7xl mx-auto bg-gray-50 py-6 px-4 md:p-12 rounded-2xl shadow-lg shadow-sky-100 flex flex-row flex-wrap gap-12 items-start justify-evenly">
					<div className="flex flex-col gap-6">
						<div className="flex flex-row items-center gap-2 text-sky-400 font-bold text-xl">
							<i className="fa-regular fa-user"></i>
							<h3>¿A quien va dirigido?</h3>
						</div>
						<ul className="flex flex-col gap-3 ml-6">
							{dirigido.length > 0 ? (
								dirigido.map((item, index) => (
									<li key={index} className="flex flex-row gap-3 items-center text-sm">
										<i className="fa fa-check text-sky-400"></i>
										<p className="text-gray-800">{item}</p>
									</li>
								))
							) : (
								<li className="flex flex-row gap-3 items-center text-sm">
									<i className="fa fa-check text-sky-400"></i>
									<p className="text-gray-800">Público en general</p>
									{ console.log(dirigido.length >= 0) }
								</li>
							)
							}
							
						</ul>
					</div>
					<div className="flex flex-col gap-6">
						<div className="flex flex-row items-center gap-2 text-sky-400 font-bold text-xl">
							<i className="fa-regular fa-star"></i>
							<h3>¿Qué habilidades obtendré?</h3>
						</div>
						<ul className="flex flex-col gap-2 ml-6">
							{ habilidades.length > 0 ? (
								habilidades.map((item, index) => (
									<li key={index} className="flex flex-row gap-3 items-center text-sm">
										<i className="fa fa-check text-sky-400"></i>
										<p className="text-gray-800">{item}</p>
									</li>
								))
							) : (
								<li className="flex flex-row gap-3 items-center text-sm">
									<i className="fa fa-check text-sky-400"></i>
									<p className="text-gray-800">Habilidades básicas</p>
								</li>
							)
							}
						</ul>
					</div>
				</div>
			</section>
		</>
	);
}