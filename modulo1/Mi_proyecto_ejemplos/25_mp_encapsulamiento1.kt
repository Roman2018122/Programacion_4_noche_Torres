open class ordenReparacion(
    val id: int;
    val cliente: String 
    val vehiculo: String
    val servicio: String
){

    private var costoTotal: Double = 0.0

    protected open fun CalcularCostoExtra(): Double {
        return costoTotal * 0.1 //mano de obra extra
    }

    fun agregarTrabajo(descripcion: String, costo: Double) {
        require(costo > 0) { "El costo debe ser positivo" }
        costoTotal += costo
        println("Trabajo agregado: $descripcion - $${"%.2f".format(costo)}")
    }

    fun aplicarCostoExtra() {
        val extra = calcularCostoExtra()
        costoTotal += extra
        println("Costo extra aplicado: $${"%.2f".format(extra)}")
    }

    fun consultarTotal(): String {
        return "$${"%.2f".format(costoTotal)}"
    }
}

class OrdenPremium(
    id: Int,
    cliente: String,
    vehiculo: String,
    servicio: String
) : OrdenReparacion(id, cliente, vehiculo, servicio) {

    override fun calcularCostoExtra(): Double {
        return super.calcularCostoExtra() * 1.5 // servicio premium más caro
    }
}