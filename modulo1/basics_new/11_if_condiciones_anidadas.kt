fun main() {
    println("condiciones anidadas")
    println("¿El paciente tiene antecedentes cardíacos? (s/n)")

    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"

    print("Frecuencia cardiaca lpm: ")
    val frecuencia = readLine()?.toIntOrNull() ?: 0

    if (tieneAntecedentes) {
        println("Paciente con antecedentes cardíacos")

        if (frecuencia < 50) {
            println("Bradicardia")
        } else if (frecuencia > 100) {
            println("Taquicardia")
        } else {
            println("Frecuencia dentro del rango")
        }

    } else {
        println("Paciente sin antecedentes cardíacos")

        if (frecuencia < 60 || frecuencia > 100) {
            println("Frecuencia fuera de lo normal")
        } else {
            println("Frecuencia cardíaca normal")
        }
    }
}