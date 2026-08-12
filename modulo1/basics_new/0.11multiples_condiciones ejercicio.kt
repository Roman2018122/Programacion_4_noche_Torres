// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Tiempo de atencion")
    val atencion = readln()?.toIntOrNull() ?: 0 
    val clasificacion = if (atencion <= 10) {
        "Flujo Normal"
    } else if (atencion <=30) {
        "Espera moderada - Informar al paciente"
    } else if (atencion <= 60) { 
        "Espera prolongada ofrecer reagendamiento"
    } else {
        "Alerta de gestion notificar a coordinacion"
    }
    print("Clasificacion: $clasificacion")
}