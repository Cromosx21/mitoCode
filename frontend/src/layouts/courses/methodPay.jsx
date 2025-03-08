export default function MethodPay() {
    return (
        <>
            <section className="w-full bg-gray-50 py-12 px-8">
                <div className="max-w-7xl mx-auto">
                    <h2 className="text-3xl font-bold text-sky-950">Métodos de pago</h2>
                    <div className="mt-6 max-w-lg mx-auto shadow-lg p-10 rounded-md flex flex-col gap-4 bg-gray-50 shadow-gray-200 text-gray-800">
                        <h3 className="text-sky-900">*Págalo en cuotas sin intereses en estás fechas</h3>
                        <ul className="list-disc">
                            <li className="">
                                <b className="text-sky-500">Primera Cuota: </b>
                                s/349 hasta 4 de febrero
                            </li>
                            <li className="">
                                <b className="text-sky-500">Segunda Cuota: </b>
                                s/339 hasta 12 de marzo
                            </li>
                        </ul>
                        <div>
                            <strong>Aceptamos:</strong>
                            <ul className="flex flex-row gap-4 justify-center">
                                <li>Visa</li>
                                <li>Mastercard</li>
                                <li>American Express</li>
                                <li>PayPal</li>
                            </ul>
                        </div>
                        <div>
                            <strong>Depósitos:</strong>
                            <ul className="flex flex-row gap-4 justify-center text-center">
                                <li>Transferencia bancaria</li>
                                <li>Depósito directo en la oficina</li>
                                <li>Depósito directo en la tienda</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </>
    );
}