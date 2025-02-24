export default function Community() {
    return (
		<section className="bg-gray-100 w-full py-32 px-6 ">
			<div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-between gap-16">
				<div className="flex flex-col gap-4 max-w-md">
					<h2 className="text-3xl font-semibold text-sky-950">
						Nuestra Comunidad en Medios
					</h2>
					<p className="text-sm font-light text-gray-900">
						Somos más de 80 000 coders que nos gusta el mundo de la
						programación, estamos presentes en todas las redes
						sociales
					</p>
				</div>
                <div className="flex flex-row flex-wrap gap-2 sm:gap-6 text-3xl">
                    <a
                        href="https://facebook.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-facebook text-[#1877F2] text-2xl"></i>
                    </a>
                    <a
                        href="https://twitter.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-twitter text-[#1DA1F2] text-2xl"></i>
                    </a>
                    <a
                        href="https://linkedin.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-linkedin text-[#0077B5] text-2xl"></i>
                    </a>
                    <a
                        href="https://instagram.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-instagram text-[#E4405F] text-2xl"></i>
                    </a>
                    <a
                        href="https://tiktok.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-tiktok text-[#020202] text-2xl"></i>
                    </a>
                    <a
                        href="https://Youtube.com"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="px-3 py-1 rounded-md bg-gray-200 hover:shadow-md transition-all shadow-gray-400"
                    >
                        <i className="fa-brands fa-youtube text-[#f0173e] text-2xl"></i>
                    </a>
                </div>
			</div>
		</section>
	);
}