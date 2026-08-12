fun main() {
    println("when con condiciones")
    println("Edad del paciente")
    val edad  = readLine()?.toIntOrNull()?:0
    print("tiene dolor de pecho ?: s/n")
    val tieneDolor = readLine()?.trim()?.lowercase()=="s"
    
     print("dificultad respiratoria?: s/n")
    val tieneDificultad = readLine()?.trim()?.lowercase()=="s"
    
    println("temperatura ")
  	val temperatura = readLine()?.toDoubleOrNull()?:0.0
  	
    val sintomas = when{
    !tieneDolor && tieneDificultad ->"P1 - EMERGENCIA"
    !tieneDolor-> "P2 -Urgente"
    temperatura >= 39.5 ->"P2 URGENTE!!"
    temperatura <=38.0 && temperatura >=39.4 -> "P3 - PRIORITARIO"    
    else->"CONSULTA GENERAL"

    }
    println("sientomas: $sintomas ")
}

fun main() {
    println("when con condiciones")

    println("Edad del paciente:")
    val edad = readLine()?.toIntOrNull() ?: 0

    print("¿Tiene dolor de pecho? (s/n): ")
    val tieneDolor = readLine()?.trim()?.lowercase() == "s"

    print("¿Dificultad respiratoria? (s/n): ")
    val tieneDificultad = readLine()?.trim()?.lowercase() == "s"

    println("Temperatura:")
    val temperatura = readLine()?.toDoubleOrNull() ?: 0.0

    val sintomas = when {
        tieneDolor && tieneDificultad -> "P1 - EMERGENCIA"
        temperatura >= 39.5 -> "P2 - URGENTE"
        tieneDolor || tieneDificultad -> "P2 - URGENTE"
        temperatura in 38.0..39.4 -> "P3 - PRIORITARIO"
        else -> "CONSULTA GENERAL"
    }

    println("Síntomas: $sintomas")
}
