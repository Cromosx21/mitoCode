import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCalendar, faCircle, faClock, faCameraAlt } from "@fortawesome/free-solid-svg-icons";
import Button from "./Button";
import { useNavigate } from "react-router-dom";

export default function CardCourse({ imgCourse, id, nameCourse, subtitulo, dateInit, mode, weeks, hours, price, status }) {

    const navigate = useNavigate();

    const handleCourseClick = () => {
        navigate(`/course/${id}`);
    };
    
	return (
		<>
			<figure className="rounded-xl max-w-sm w-full bg-sky-950 overflow-hidden text-gray-50 group border border-sky-200">
				<img
					src={imgCourse}
					alt={`Curso de ${nameCourse}`}
					className="cursor-pointer group-hover:scale-110 transition-normal duration-500 ease-in-out"
				/>
				<figcaption className="px-8 py-6 flex flex-col ">
					<div className="flex flex-col gap-4 sm:h-64 h-fit">
						<div className="flex flex-col gap-1">
							<a href="#" className="font-semibold text-xl">
								{nameCourse}
							</a>
							<p className="font-normal text-sm text-gray-200">
								{subtitulo}
							</p>
						</div>
						<hr className="border-gray-400" />
						<div className="flex flex-col gap-2">
							<div className="flex flex-row flex-wrap justify-between text-sm font-medium gap-2">
								{dateInit !== "No disponible" ? (
									<p>{dateInit}</p>
								) : null}
								<div className="flex flex-row gap-1 items-center min-w-24 justify-end ">
									{mode !== "En vivo" ? (
										<span className="text-sky-400 text-lg">
											<FontAwesomeIcon
												icon={faCameraAlt}
											/>
										</span>
									) : (
										<span className="text-red-500 text-xs">
											<FontAwesomeIcon icon={faCircle} />
										</span>
									)}
									{mode}
								</div>
								<div className="flex flex-row gap-1 items-center">
									{weeks !== "" ? (
										<span>
											<FontAwesomeIcon
												icon={faCalendar}
												className="text-lg text-sky-400"
											/>
										</span>
									) : null}
									{weeks}
								</div>
								<div className="flex flex-row gap-1 items-center">
									<span>
										<FontAwesomeIcon
											icon={faClock}
											className="text-lg text-sky-400"
										/>
									</span>
									{hours}
								</div>
							</div>
						</div>
						<hr className="border-gray-400" />
						<div className="flex flex-row justify-between flex-wrap pb-6 gap-2">
							<div className="text-xl font-bold">
								<span>PEN </span>
								S/{price}
							</div>
							<div
								className={`py-1 px-3 rounded-sm font-semibold ${
									status !== "CURSO INICIADO"
										? "bg-green-300 text-green-800"
										: "bg-red-700"
								}`}
							>
								{status}
							</div>
						</div>
					</div>
					<Button nameButton="Ver detalle del curso" classButton="w-full" onClick={handleCourseClick}/>
				</figcaption>
			</figure>
		</>
	);
}
