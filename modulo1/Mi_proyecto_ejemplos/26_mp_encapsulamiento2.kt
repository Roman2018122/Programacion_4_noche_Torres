class Motor(litrosAceite: Double) {

    // ENCAPSULAMIENTO: el setter valida que el motor no tenga un nivel de aceite imposible
    var litrosAceite: Double = litrosAceite
        set(value) {
            require(value >= 0.0) { "El motor no puede tener una cantidad negativa de aceite" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta el porcentaje sin preocuparse por la capacidad total (ej. 5.0L)
    val porcentajeAceite: Double
        get() = (litrosAceite / 5.0) * 100.0

    // ABSTRACCIÓN: traduce los litros a cuartos de galón (unidad común en talleres) sin que el mecánico haga el cálculo
    val cuartosAceite: Double
        get() = litrosAceite * 1.05669

    // Clasificación del estado del motor según su nivel de aceite
    val estadoAceite: String
        get() = when {
            litrosAceite == 0.0 -> "Crítico: ¡Motor seco! Riesgo de desbielar"
            litrosAceite < 3.0  -> "Bajo: Requiere rellenar aceite"
            litrosAceite <= 5.0 -> "Óptimo: Nivel adecuado para operar"
            litrosAceite < 6.0  -> "Alto: Ligero exceso de aceite"
            else                -> "Peligroso: Sobrepeso de presión, riesgo de fugas"
        }
}

fun main() {
    // Iniciamos un motor con 4.5 litros de aceite
    val miMotor = Motor(4.5)
    println("Estado inicial:")
    println("Aceite: ${miMotor.litrosAceite} L = ${String.format("%.2f", miMotor.cuartosAceite)} cuartos (${miMotor.porcentajeAceite}%)")
    println("Diagnóstico: ${miMotor.estadoAceite}") // Óptimo

    println("\n--- Simulando consumo de aceite ---")
    // El coche consume o tira aceite con el tiempo
    miMotor.litrosAceite = 2.5
    println("Aceite actual: ${miMotor.litrosAceite} L → ${miMotor.estadoAceite}") // Bajo

    // miMotor.litrosAceite = -1.0  // ¡Lanza IllegalArgumentException! (Encapsulamiento en acción)
}