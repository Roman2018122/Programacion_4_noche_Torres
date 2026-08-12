fun main() {
    println("Condiciones con when")

    println("Ingrese el código de servicio (1-7):")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val servicio = when (codigo) {
        1 -> "Cambio de aceite"
        2 -> "Alineacion y balanceo"
        3 -> "Reparacion de motor"
        4 -> "Revision de frenos"
        5 -> "Sistema electrico"
        6 -> "Suspension"
        7 -> "Diagnostico general"
        else -> "Servicio no registrado"
    }

    println("Servicio seleccionado: $servicio")
}