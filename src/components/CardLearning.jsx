export default function CardLearning({ icon, alt, description}) {
    return (
		<>
			<figure className="col-span-1 flex flex-col gap-2 items-center">
				<img
					src={`../src/assets/icons/${icon}`}
					alt={alt}
					className="max-w-16 h-max-w-16"
				/>
				<figcaption>
					<p className="text-gray-50 text-center text-sm">
						{description}
					</p>
				</figcaption>
			</figure>
		</>
	);
}