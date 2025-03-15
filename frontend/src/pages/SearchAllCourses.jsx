import React from "react";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";
import AllCourses from "../layouts/AllCourses";

export default function SearchAllCourses() {
    return (
		<main className="font-Montserrat">
			<Navbar />
                <AllCourses />
			<Footer />
		</main>
	);
}
