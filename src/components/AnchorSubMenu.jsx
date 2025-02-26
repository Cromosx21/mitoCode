export default function AnchorSubMenu({nameModule, icon}){
    return (
        <>
            <li className="p-2 hover:bg-gray-100 cursor-pointer hover:text-sky-500 flex items-center gap-2">
                <i className={`fa-solid ${icon}`}></i>
                {nameModule}
            </li>
        </>
    )
}