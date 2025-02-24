import ImageBrands from "../components/ImageBrands";

export default function Brands() {
    return (
		<>
			<section className="w-full bg-gray-50 px-6 py-16">
				<div className="max-w-7xl mx-auto">
					<h2 className="text-3xl font-bold text-sky-950">
						Grandes marcas que confían en nosotros
					</h2>
					<div className="flex flex-row flex-wrap items-center justify-evenly gap-8 mt-8">
						<ImageBrands image="caja-ica.png" />
						<ImageBrands image="imagen.png" />
						<ImageBrands image="logo.jpg" />
						<ImageBrands image="sintad-logo.png" />
						<ImageBrands image="BCRP.gif" />
						<ImageBrands image="Logo_f.jpg" />
					</div>
				</div>
			</section>
		</>
	);
}