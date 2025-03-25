export default function MethodPay({ pagos }) {
    return (
		<>
			<section className="w-full bg-gray-50 py-12 px-8">
				<div className="max-w-7xl mx-auto">
					<h2 className="text-3xl font-bold text-sky-950">
						Métodos de pago
					</h2>
					<div className="mt-6 max-w-lg mx-auto shadow-lg p-10 rounded-md flex flex-col gap-4 bg-gray-50 shadow-gray-200 text-gray-800">
						<div className="flex flex-col gap-4">
							<span className="text-sky-900 text-xl">Pago desde</span>
							<div className="flex flex-row items-center gap-2">
                                <i className="flag-icon flag-icon-pe text-6xl rounded-full"></i>
                                <span className="text-3xl font-bold text-gray-800">Perú</span>
                            </div>
						</div>
						<hr className="border-gray-400" />
						<ul className="list-disc">
							<li className="flex flex-row gap-2 text-lg">
								<b className="text-sky-500">Pago único: </b>
								<p>S/ {pagos}</p>
							</li>
						</ul>
						<div>
							<strong>Aceptamos:</strong>
							<ul className="flex flex-row gap-4 justify-between">
								<li>
									<img
										src="/PayMethod/Visa.png"
										alt="Tarjeta Visa"
                                        className="mix-blend-multiply"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/Mastercard.png"
										alt="Tarjeta Mastercard"
                                        className="mix-blend-multiply"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/DinnersClub.png"
										alt="Tarjeta Dinners Club"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/AmericanExpress.png"
										alt="Tarjeta American Express"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/6Visa.png"
										alt="Tarjeta paypal"
										className="max-h-8"
									/>
								</li>
							</ul>
						</div>
						<div>
							<strong>Depósitos:</strong>
							<ul className="flex flex-row gap-4 justify-between items-center">
								<li>
									<img
										src="/PayMethod/BCP.png"
										alt="Tarjeta BCP"
                                        className="mix-blend-multiply"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/Interbank.png"
										alt="Tarjeta Interbank"
                                        className="mix-blend-multiply"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/BBVA.png"
										alt="Tarjeta BBVA"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/Plin.png"
										alt="Transferencia Plin"
										className="max-h-8"
									/>
								</li>
								<li>
									<img
										src="/PayMethod/Yape.png"
										alt="Transferencia Yape"
										className="max-h-8"
									/>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</>
	);
}