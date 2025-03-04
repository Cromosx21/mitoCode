import { useNavigate } from "react-router-dom";
import { Input, Button, LinkText } from "../../components/SesionComponent";
export default function Register() {
    const navigate = useNavigate();
	return (
		<>
			<section className="w-full bg-gray-50 py-12 px-6">
				<div className="max-w-lg mx-auto bg-gray-100 px-12 py-10 rounded-lg shadow-md border border-gray-300">
					<h2 className="text-3xl font-bold text-sky-950 text-center">
						Registrarse
					</h2>
					<form action="" className="mt-8 flex flex-col gap-4">
						<Input
							label="Nombres"
							type="text"
							id="name"
							name="name"
							placeholder="Nombre"
							required="required"
						/>
						<Input
							label="Apellidos"
							type="text"
							id="lastname"
							name="lastname"
							placeholder="Apellido"
							required="required"
						/>
						<Input
							label="Correo electr&oacute;nico"
							type="email"
							id="email"
							name="email"
							placeholder="Correo electr&oacute;nico"
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
						<Input
							label="Repite tu contrase&ntilde;a"
							type="repeat-password"
							id="repeat-password"
							name="repeat-ppassword"
							placeholder="Confirmar contrase&ntilde;a"
							required="required"
						/>
                        <Button text="Registrarse" type="submit" />
                        <span className="text-center text-sm text-gray-600">
                            ¿Ya tienes una cuenta?{" "}
                            <LinkText
                                text="Iniciar sesión"
                                onClick={() => navigate("/sesion/login")}
                            />
                        </span>
					</form>
				</div>
			</section>
		</>
	);
}
