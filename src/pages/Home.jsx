import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import Hero from "../layouts/Hero";
import Learning from "../layouts/Learning";
import About from "../layouts/About";
import Courses from "../layouts/Courses";
import Community from "../layouts/Community";
import Testimonials from "../layouts/Testimonials";
import Brands from "../layouts/Brands";
import Cta from "../layouts/Cta";

export default function Home() {
	return (
		<div className="font-Montserrat">
			<Navbar />
			<Hero />
			<Learning />
			<About />
			<Courses />
			<Community />
			<Testimonials />
			<Brands />
			<Cta />
			<Footer />
		</div>
	);
}
