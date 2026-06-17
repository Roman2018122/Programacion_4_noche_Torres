fun main() {
    println("Condiciones con when")

    println("Ingrese el código de especialidad (1-7):")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val especialidad = when (codigo) {
        1 -> "Medicina general"
        2 -> "Pediatría"
        3 -> "Cardiología"
        4 -> "Ginecología"
        5 -> "Traumatología"
        6 -> "Neurología"
        7 -> "Dermatología"
        else -> "Especialidad no registrada"
    }

    println("Especialidad seleccionada: $especialidad")
}