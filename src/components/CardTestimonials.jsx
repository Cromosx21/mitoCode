export default function CardTestimonials({ testimonial, imageUser, nameUser, jobUser }) {
    return (
		<>
			<article className="py-8 px-8 flex flex-col gap-4 shadow-2xl shadow-gray-200 max-w-sm rounded-sm">
				<p className="text-base text-sky-900">"{testimonial}"</p>
				<figure className="flex flex-row gap-4 items-start">
					<img
						src={`../src/assets/Nuestro-Equipo/${imageUser}`}
						alt={`Foto de ${nameUser}`}
						className="max-w-16 rounded-full"
					/>
					<figcaption>
						<h3 className="text-sm font-semibold text-gray-800">
							{nameUser}
						</h3>
						<span className="text-sm text-gray-600">{jobUser}</span>
					</figcaption>
				</figure>
			</article>
		</>
	);
}