export default function Anchor({ nameAnchor, classAnchor }) {
    return (
        <>
            <a href="#" className={` py-2 text-md  cursor-pointer  transition-all ${classAnchor}`}>{ nameAnchor}</a>
        </>
    )
}