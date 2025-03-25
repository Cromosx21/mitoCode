export default function CardAbout({ onClick, icon, alt, title, description, selectedCard }) {
    return (
		<>
			<figure
				className={`flex flex-col gap-4 items-center max-w-sm bg-gray-50 py-8 px-8 rounded-2xl shadow-sm relative before:content-[''] before:absolute before:w-full before:h-4  before:bottom-0 before:left-0 overflow-hidden cursor-pointer hover:before:bg-sky-500 before:duration-300 before:ease-in-out ${
					selectedCard === title
						? "before:bg-sky-500"
						: "before:bg-transparent"
				} `}
				onClick={onClick}
			>
				<img
					src={`/icons/${icon}`}
					alt={alt}
					className="max-w-16 max-h-16 aspect-square"
					loading="lazy"
				/>
				<figcaption className="text-center flex flex-col gap-2">
					<h3 className="font-semibold ">{title}</h3>
					<p className="text-sm">{description}</p>
				</figcaption>
			</figure>
		</>
	);
}