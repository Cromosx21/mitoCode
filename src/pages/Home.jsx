import Navbar from "../loyauts/Navbar";
import Footer from "../loyauts/Footer";
import Hero from "../loyauts/Hero";
import Learning from "../loyauts/Learning";
import About from "../loyauts/About";
import Courses from "../loyauts/Courses";
import Community from "../loyauts/Community";
import Testimonials from "../loyauts/Testimonials";

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
			<Footer />
		</div>
	);
}
