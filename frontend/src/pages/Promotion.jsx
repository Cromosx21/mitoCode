import React from "react";
import Navbar from "../layouts/Navbar";
import Footer from "../layouts/Footer";



export default function Promotion() {
	return (
		<main className="font-Montserrat">
            <Navbar />
            <section className="max-w-7xl mx-auto flex flex-col gap-8 items-center">
                <h2 className="text-center font-semibold text-2xl py-10 text-sky-700">Web en construcción</h2>
                <img src="/WebConstruction.svg" alt="Web en construcción" className="max-w-xl mx-auto" />
            </section>
			<Footer />
		</main>
	);
}
