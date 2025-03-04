import { Input, Button, LinkText } from "../../components/SesionComponent";
import { useNavigate } from "react-router-dom";
import { useState } from "react";

export default function Forgot() {
    const navigate = useNavigate();
    const [email, setEmail] = useState("");
    const [send, setSend] = useState(false);

    function handleSubmit(e) {
        e.preventDefault();
        console.log(email);
        setSend(true);
    }

    return (
		<>
			<section className="w-full bg-gray-50 py-12 px-6">
				<div className="max-w-lg mx-auto bg-gray-100 px-12 py-10 rounded-lg shadow-md border border-gray-300">
					<h2 className="text-3xl font-bold text-sky-950 text-center">
						Recuperar contraseña
                    </h2>
                    <form action="" className="mt-4 flex flex-col gap-4">
                        {send ? (
                            (
                                <p className="text text-gray-800 mt-8">Se ha enviado un correo para restablecer tu contraseña al correo <strong className="text-sky-800">{ email }</strong>, revisa tu bandeja de entrada</p>
                            )
                        ) : (
                            <>
                                <p className="text font-semibold text-sky-800 mt-8">Ingresa tu correo electr&oacute;nico para recuperar tu contrase&ntilde;a </p>
                                    <Input
                                        label="Correo electr&oacute;nico"
                                        type="email"
                                        id="email"
                                        name="email"
                                        placeholder="Ejemplo: metawill@ejemplo.com"
                                        required="required"
                                        onChange={(e) => setEmail(e.target.value)}
                                        value={email}
                                    />
                                    <Button text="Enviar" type="button" onClick={handleSubmit} />
                                
                                </>
                        )}
                        <span className="text-sm text-gray-600 text-center">
                            ¿Ya tienes una cuenta?{" "}
                            <LinkText text="Iniciar sesión" onClick={() => navigate("/sesion/login")} />
                        </span>
                    </form>
					
				</div>
			</section>
		</>
	);
}