export default function Anchor({ nameAnchor, classAnchor }) {
    return (
        <>
            <a href="#" className={`px-6 py-4 text-md  cursor-pointer  transition-all ${classAnchor}`}>{ nameAnchor}</a>
        </>
    )
}