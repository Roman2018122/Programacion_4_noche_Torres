// poo_interfaceconflicto.kt

// Interfaces del taller mecánico

interface Diagnostico {
    fun revisarVehiculo() =
        println("Revisión realizada por el área de diagnóstico")
}

interface Reparacion {
    fun revisarVehiculo() =
        println("Revisión realizada por el área de reparación")
}

// Clase que implementa ambas interfaces
class TallerMecanico : Diagnostico, Reparacion {

    // Obligatorio porque ambas interfaces
    // tienen el mismo método
    override fun revisarVehiculo() {

        super<Diagnostico>.revisarVehiculo()

        super<Reparacion>.revisarVehiculo()

        println("Vehículo revisado completamente en el taller")
    }
}

// Función principal
fun main() {

    val taller = TallerMecanico()

    taller.revisarVehiculo()
}