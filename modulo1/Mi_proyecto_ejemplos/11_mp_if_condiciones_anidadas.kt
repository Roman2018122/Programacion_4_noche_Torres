fun main() {
    println("condiciones anidadas")
    println("¿El vehiculo tiene fallas previas? (s/n)")

    val tieneFallas = readLine()?.trim()?.lowercase() == "s"

    print("Revoluciones del motor (RPM): ")
    val rpm = readLine()?.toIntOrNull() ?: 0

    if (tieneFallas) {
        println("Vehiculo con fallas previas")

        if (rpm < 700) {
            println("Motor inestable (bajas revoluciones)")
        } else if (rpm > 3000) {
            println("Motor forzado (altas revoluciones)")
        } else {
            println("Revoluciones dentro del rango")
        }

    } else {
        println("Vehiculo sin fallas previas")

        if (rpm < 800 || rpm > 2500) {
            println("Revoluciones fuera de lo normal")
        } else {
            println("Funcionamiento normal del motor")
        }
    }
}