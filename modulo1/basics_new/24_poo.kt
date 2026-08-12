class Producto(
    val id: Int,
    val nombre: String,
    val precio:Double,
    private val stock: Int
    ){
        val precioConIva: Double
            get()=precio*1.19
        val disponible: Boolean
            get()=stock>0
    override fun toString()="$nombre ($${"%.2f".format(precio)})"
   
}

fun main() {
    println("programacion orientada a objetos")
    println("Abstraccion")
    val teclado = Producto(1, "Teclado", 88.99, 15)
    println( teclado.disponible)
    println( teclado.precioConIva)
    val monitor = Producto(1, "monitor", 500.99, 6)
    println( monitor.disponible)
    println( monitor.precioConIva)
   
   
}