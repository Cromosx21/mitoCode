import Logo from "../components/Logo";

export default function Footer() {
    return (
		<footer className="bg-sky-950 text-gray-300 pt-16 pb-6 px-6 w-full ">
			<div className="max-w-7xl mx-auto grid grid-cols-4 grid-auto-rows gap-6 pb-6">
				<div className="col-span-1 flex flex-col gap-8">
					<h2 className="text-lg font-semibold text-sky-200">
						Contáctanos
					</h2>
					<ul className=" border-l border-l-gray-500 px-6 py-2 flex flex-col gap-3">
						<li className=" flex flex-row items-center gap-2">
							<i className="fa fa-phone text-sm"></i>
							<span className="text-sm font-semibold">
								<a
									href="https://wa.me/51987654321"
									className="cursor-pointer hover:text-sky-400"
								>
									+51 987 654 321
								</a>
							</span>
						</li>
						<li className=" flex flex-row items-center gap-2">
							<i className="fa fa-envelope text-sm"></i>
							<span className="text-sm font-semibold">
								<a
									href="mailto:cursos@mitocodenetwork.com"
									className="cursor-pointer hover:text-sky-400"
								>
									cursos@mitocodenetwork.com
								</a>
							</span>
						</li>
						<li className=" flex flex-row items-center gap-2">
							<i className="fa fa-location-dot text-sm"></i>
							<span className="text-sm font-semibold">
								<a
									href="mailto:cursos@mitocodenetwork.com"
									className="cursor-pointer hover:text-sky-400"
								>
									Lima, Perú
								</a>
							</span>
						</li>
						<ul className="flex flex-row gap-4 mt-4">
							<li>
								<a
									href="https://www.facebook.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-facebook-f text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.instagram.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-instagram text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.twitter.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-twitter text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.youtube.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-youtube text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.tiktok.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-tiktok text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.linkedin.com"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-linkedin text-lg"></i>
								</a>
							</li>
							<li>
								<a
									href="https://www.twitch.tv"
									className="hover:text-sky-400"
								>
									<i className="fa-brands fa-twitch text-lg"></i>
								</a>
							</li>
						</ul>
					</ul>
				</div>
				<div className="col-span-1 flex flex-col gap-8">
					<h2 className="text-lg font-semibold text-sky-200">
						Acerca de la empresa
					</h2>
					<ul className=" border-l border-l-gray-500 px-6 py-2 flex flex-col gap-3 text-sm font-semibold">
						<li>La Empresa</li>
						<li>Ayuda Social</li>
						<li>Preguntas Frecuentes</li>
					</ul>
				</div>
				<div className="col-span-1 flex flex-col gap-8">
					<h2 className="text-lg font-semibold text-sky-200">
						Mi cuenta
					</h2>
					<ul className=" border-l border-l-gray-500 px-6 py-2 flex flex-col gap-3 text-sm font-semibold">
						<li>Ingresar</li>
						<li>Ver mis cursos</li>
						<li>Recuperar mi contraseña</li>
					</ul>
				</div>
				<div className="col-span-1 flex flex-col gap-8">
					<h2 className="text-lg font-semibold text-sky-200">
						Atención al cliente
					</h2>
					<ul className=" border-l border-l-gray-500 px-6 py-2 flex flex-col gap-3 text-sm font-semibold">
						<li>Políticas de cambio y reembolsos</li>
						<li>Términos y condiciones</li>
					</ul>
				</div>
			</div>
			<p className="text-xs text-gray-200 text-center">
				MitoCode. Todos los derechos reservados. Diseñado e implementado
				Enova Agency
			</p>
		</footer>
	);
}