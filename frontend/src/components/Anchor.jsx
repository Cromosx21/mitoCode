export default function Anchor({ nameAnchor, classAnchor , href }) {
    return (
        <>
            <a href={ href} className={` py-2 text-md  cursor-pointer  transition-all ${classAnchor} `} >{ nameAnchor}</a>
        </>
    )
}