enum class Estado(val descripcion: String, val estadoa: Boolean) {
    RECIBIDO  ("Esperando ", false),
    DIAGNOSTICO ("Siendo revisado",        false),
    REPARACION("En reparación",    false),
    LISTO    ("Completado",    true),
    ENTREGADO  ("Entregado exitosamente",   true);

    fun puedeTransicionarA(siguiente: Estado): Boolean = when (this) {
        RECIBIDO  -> siguiente == DIAGNOSTICO || siguiente == ENTREGADO
        DIAGNOSTICO -> siguiente == REPARACION || siguiente == LISTO
        else       -> false
    }
}

fun main() {
    val estado = Estado.ENTREGADO
    println(estado.descripcion)  // Siendo procesado
    println(estado.estadoa)   // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        Estado.RECIBIDO  -> "⏰"
        Estado.DIAGNOSTICO -> "⏳"
        Estado.REPARACION -> "🔧"
        Estado.LISTO    -> "✅"
        Estado.ENTREGADO  -> "�"
    }
    println(icono)  // ⏳

    println(estado.puedeTransicionarA(Estado.LISTO))  // true
}