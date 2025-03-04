import { useNavigate } from "react-router-dom";
import { Input, Button, LinkText } from "../../components/SesionComponent";

export default function Login() {
    const navigate = useNavigate();
	return (
		<>
			<section className="w-full bg-gray-50 py-12 px-6">
				<div className="max-w-lg mx-auto bg-gray-100 px-12 py-10 rounded-lg shadow-md border border-gray-300">
					<h2 className="text-3xl font-bold text-sky-950 text-center">
						Iniciar sesión
                    </h2>
					<form action="" className="mt-8 flex flex-col gap-4">
                        <Input
                            label="Correo electr&oacute;nico"
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Ejemplo: metawill@ejemplo.com"
                            required="required"
                        />
                        <Input
                            label="Contrase&ntilde;a"
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Contrase&ntilde;a"
                            required="required"
                        />
                        <span className="text-sm text-gray-600">
                            ¿Olvidaste tu contrase&ntilde;a?{" "}
                            <LinkText text="Recuperar contrase&ntilde;a" onClick={() => navigate("/sesion/forgot")} />
                        </span>
                        <Button text="Iniciar sesión" type="submit" />
						<span className="text-sm text-gray-600 text-center">
							¿No tienes una cuenta?{" "}
                            <LinkText text="Regístrate" onClick={() => navigate("/sesion/register")} />
						</span>
					</form>
				</div>
			</section>
		</>
	);
}
