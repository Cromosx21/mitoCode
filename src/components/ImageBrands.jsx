export default function ImageBrands({ image }) {
    return (
        <img src={`../src/assets/Brands/${image}`} alt="Logo" className="grayscale hover:grayscale-0 transition-all max-h-12" />
    );
}