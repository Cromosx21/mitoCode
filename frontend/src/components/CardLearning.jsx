export default function CardLearning({ icon, alt, description}) {
    return (
		<>
			<figure className="col-span-1 flex flex-col gap-3 items-center min-w-2xs max-w-sm">
				<img
					src={`/icons/${icon}`}
					alt={alt}
					className="max-w-16 h-max-w-16 aspect-square"
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