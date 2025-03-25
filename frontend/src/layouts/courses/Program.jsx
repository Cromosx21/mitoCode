import { getDownload } from "../../services/courseServices";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";

export default function Program({ temario }) {
	const { id } = useParams();

	const [nameDownload, setNameDownload] = useState(null);
	const [fileExists, setFileExists] = useState(false);

	useEffect(() => {
        const fetchDownloadName = async () => {
            try {
                const data = await getDownload(); // Obtiene el array completo

                const cursoEncontrado = data.find(curso => curso.id === id);

                if (cursoEncontrado) {
					setNameDownload(cursoEncontrado);
					checkFileExists(cursoEncontrado.nombreCurso);
					console.log(cursoEncontrado.nombreCurso);
                } else {
                    console.warn("No se encontró el curso con el ID:", id);
                }
            } catch (error) {
                console.error("Error al obtener el nombre del archivo:", error);
            }
		};
		
		const checkFileExists = async (fileName) => {
			try {
				const response = await fetch(
					`http://localhost:5000/api/download/verificar-archivo/${encodeURIComponent(fileName)}`
				); // Reemplaza con la ruta correcta
				const result = await response.json();
				setFileExists(result.exists);
			} catch (error) {
				console.error("Error al verificar el archivo:", error);
				setFileExists(false);

			}
		};

        fetchDownloadName();
    }, [id]);



	return (
		<>
			<section className="w-full bg-gray-50 py-16 px-6">
				<div className="max-w-7xl mx-auto flex flex-col gap-8">
					<div className="flex flex-row items-center gap-8 justify-between flex-wrap">
						<div className="flex flex-row items-center gap-8">
							<h2 className="text-3xl font-bold text-sky-950">
								Programa
							</h2>
							<span className="py-2 px-4 bg-sky-50 text-sky-950 text-sm font-bold rounded-md">
								Temario
							</span>
						</div>
						{nameDownload && nameDownload.nombreCurso ? (
							<a
								href={
									fileExists
										? `/syllabus/${encodeURIComponent(nameDownload.nombreCurso)}.pdf`
										: "#"
								}
								className={`flex flex-row items-center gap-2 py-2 px-4 rounded-lg font-semibold uppercase text-gray-50 transition-all 
								${
									fileExists
										? "bg-sky-800 cursor-pointer hover:shadow-md hover:shadow-gray-400 hover:-translate-y-1 hover:bg-sky-700"
										: "bg-gray-400 cursor-not-allowed"
								}`}
								download={fileExists}
							>
								<svg
									xmlns="http://www.w3.org/2000/svg"
									fill="none"
									viewBox="0 0 24 24"
									strokeWidth={1.5}
									stroke="currentColor"
									className="size-5"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m.75 12 3 3m0 0 3-3m-3 3v-6m-1.5-9H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z"
									/>
								</svg>
								{fileExists
									? "Descargar Temario"
									: "No disponible"}
							</a>
						) : null}
					</div>
					<div className="bg-sky-50 py-12 px-6 flex flex-col gap-8 items-center">
						{Object.keys(temario).length > 0 ? (
							Object.entries(temario).map(([key, item]) => (
								<details key={key} className="max-w-3xl w-full">
									<summary className="cursor-pointer flex flex-row items-center gap-4 bg-gray-50 py-4 px-6 rounded-md font-bold shadow-xl shadow-sky-100">
										{item.nombreModulo}
									</summary>
									<ul className="flex flex-col gap-3 mt-4 ml-10">
										{item.temarios.length > 0 ? (
											item.temarios.map((tema, index) => (
												<li
													key={index}
													className="flex flex-row gap-3 items-center text-sm text-gray-800"
												>
													<i className="fa fa-check text-sky-400"></i>
													<p>{tema}</p>
												</li>
											))
										) : (
											<li className="text-sm text-gray-500">
												No hay temas disponibles
											</li>
										)}
										{item.temarios.length > 0 ? (
											<li className="flex flex-row gap-3 items-center text-sm text-gray-800">
												<i className="fa fa-check text-sky-400"></i>
												<p>y otros temas ...</p>
											</li>
										) : null}
									</ul>
								</details>
							))
						) : (
							<p className="text-gray-600">
								No hay temario disponible
							</p>
						)}
					</div>
				</div>
			</section>
		</>
	);
}
