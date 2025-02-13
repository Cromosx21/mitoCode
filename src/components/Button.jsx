export default function Button({ nameButton, classButton, onClick }) {
    return (
        <button
            onClick={onClick}
			className={`w-full py-4 bg-sky-500 text-gray-50 text-sm font font-medium rounded-lg cursor-pointer hover:bg-sky-600 transition-colors duration-500 ease-in-out self-end ${classButton}`}
		>
			{nameButton}
		</button>
	);
}