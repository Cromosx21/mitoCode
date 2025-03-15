import { useState } from "react";

export default function Details({ title, description }) {
	const [open, setOpen] = useState(false);

	return (
		<div className="border-b border-b-gray-600 text-sky-950">
			<button
				className="cursor-pointer flex flex-row items-center justify-between gap-4 py-4 px-6 font-bold rounded-md w-full text-left"
				onClick={() => setOpen(!open)}
			>
				<span>{title}</span>
				<i
					className={`fa fa-chevron-down transition-transform duration-300 ease-in-out border border-gray-400 rounded-full p-2 ${
						open
							? "rotate-180 text-sky-50 bg-sky-300 border-sky-300"
							: "rotate-0"
					}`}
				></i>
			</button>
			<div
				className={`overflow-hidden transition-all duration-700 ease-in ${
					open ? "max-h-96 opacity-100 py-2" : "max-h-0 opacity-0"
				}`}
			>
				<p className="px-6 pb-4">{description}</p>
			</div>
		</div>
	);
}
