import Details from "../../components/Details";

export default function Question() {
	return (
		<>
			<section className="bg-sky-100 py-20 px-6 w-full">
				<div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-center lg:justify-between relative gap-8">
					<div className="flex flex-col gap-4 items-start w-full">
						<h2 className="text-3xl font-bold text-gray-900">
							Preguntas frecuentes
						</h2>
						<div className="w-full flex flex-col gap-3 ">
							<Details
								title="¿Cómo son las clases y el acceso al curso?"
								description="Si el curso es ONLINE EN VIVO será desarrollado vía ZOOM y quedan grabadas para posterior repaso desde nuestro campus virtual, los videos no son descargables pero están disponibles las 24 horas del día, el código y guías si son descargables, además tendrás soporte a tus dudas en vivo en las clases o luego vía mail o discord. Si el curso es de tipo grabado podrás revisar su contenido en el campus virtual y enviar tus consultas también bajo mail o discord. El acceso al campus virtual es de por vida, es decir terminas el curso y podrás seguir accediendo a su contenido."
							/>
							<Details
								title="Si no puedo asistir a clases en vivo ¿Cómo puedo revisarlo?"
								description="Podrás revisar después desde nuestro campus virtual"
							/>
							<Details
								title="¿Se emite certificado al finalizar el curso?"
								description="Si, tras aprobar el curso podrás emitir un certificado de conclusión del curso. El certificado es digital [PDF] a nombre de la empresa MetaWill, en el cuál indica la modalidad online, cantidad de horas, fecha y hora de inicio, fin del curso y un QR con la información del curso."
                            />
                            <Details
                                title="Tengo empresa o una empresa pagará el curso, ¿Emiten factura?"
                                description="Sí, emitimos la factura con validez tributaria en Perú. Si eres de otro país deberás agregar los impuestos correspondientes."
                            />
						</div>
					</div>
				</div>
			</section>
		</>
	);
}
