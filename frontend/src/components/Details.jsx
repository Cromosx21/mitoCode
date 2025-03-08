import { useState } from "react";

export default function Details({ title, description}) {
    const [open, setOpen] = useState(false);

    return (
		<>
			<details className="border-b border-b-gray-600 text-gray-800">
                <summary className=" cursor-pointer flex flex-row items-center gap-4 py-4 p-6 font-bold shadow-xl shadow-sky-100"
                    onClick={open ? () => setOpen(false) : () => setOpen(true)}
                >
                    <span>{ title}</span>
                    <i className={ open ? `fa fa-chevron-up` : `fa fa-chevron-down`}></i>
				</summary>
				<p className="px-6 pb-4">
                    { description}
				</p>
			</details>
		</>
	);
}