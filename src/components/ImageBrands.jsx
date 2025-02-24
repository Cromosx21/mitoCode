export default function ImageBrands({ image }) {
	return (
		<img
			src={`../src/assets/Brands/${image}`}
			alt="Logo de dilas marcas con las que trabajamos"
			className="grayscale hover:grayscale-0 transition-all max-h-12 aspect-auto"
			loading="lazy"
		/>
	);
}
