import Details from "../../components/Details";
import { getFaqs } from "../../services/courseServices";
import {useState, useEffect} from "react";

export default function Question() {
	const [faqs, setFaqs] = useState([]);
	const [loading, setLoading] = useState(true);

	useEffect(() => {
		const fetchFaqs = async () => {
			try {
				const data = await getFaqs();
				if (data){
					setFaqs(data);
				};
				setLoading(false);
			} catch (error) {
				console.error(error);
			} finally {
				setLoading(false);
			}
		};
		fetchFaqs();
	},[]);

	if (loading) return <p className="text-center py-10 text-lg font-bold">Cargando Preguntas Frecuentes...</p>;


	return (
		<>
			<section className="bg-gray-100 py-20 px-6 w-full">
				<div className="max-w-7xl mx-auto flex flex-row flex-wrap items-center justify-center lg:justify-between relative gap-8">
					<div className="flex flex-col gap-4 items-start w-full">
						<h2 className="text-3xl font-bold text-sky-950">
							Preguntas frecuentes
						</h2>
						<div className="w-full flex flex-col gap-3 ">
							{faqs.length > 0 ? (
								faqs.map((faq, index) => (
									<Details
										key={index}
										title={faq.pregunta}
										description={faq.respuesta}
									/>
								))
							) : (
								<p className="text-center py-10 text-lg font-bold">
									No hay preguntas frecuentes
								</p>
							)}

						</div>
					</div>
				</div>
			</section>
		</>
	);
}
