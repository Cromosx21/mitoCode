// Componente reutilizable para inputs
function Input({ label, type, name, placeholder, required, onChange }) {
	return (
		<div className="flex flex-col gap-1">
			<label
				htmlFor={name}
				className="block text-sm font-medium leading-6 text-gray-700 ml-2"
			>
				{label}
			</label>
			<input
				type={type}
				name={name}
				id={name}
				autoComplete={name}
				required={required}
                placeholder={placeholder}
                onChange={onChange}
				className="block w-full rounded-sm border-0 py-1.5 px-2 text-gray-900 shadow-xs ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-1 focus:ring-inset focus:ring-sky-600 sm:text-sm sm:leading-6 focus:outline-none"
			/>
		</div>
	);
}


// Componente reutilizable para botones
function Button({ text, onClick, type = "button" }) {
	return (
		<button
			type={type}
			onClick={onClick}
			className="mt-4 w-full bg-sky-800 py-3 px-4 text-center text-sm font-semibold text-white hover:bg-sky-700 rounded-sm cursor-pointer hover:-translate-y-1 transition-all duration-500 ease-in-out hover:shadow-lg"
		>
			{text}
		</button>
	);
}

// Componente reutilizable para enlaces
function LinkText({ text, href, onClick }) {
	return (
		<a
			href={href}
			onClick={onClick}
			className="text-sky-800 font-semibold hover:text-sky-600 cursor-pointer"
		>
			{text}
		</a>
	);
}

export { Input, Button, LinkText}
