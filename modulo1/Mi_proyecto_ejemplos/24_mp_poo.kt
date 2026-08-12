class Producto(
    val id: Int,
    val nombre: String,
    val precio:Double,
    val tipo: String,
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
    val bujia = Producto(1, "bujia", 18.99, "iridium", 10)
    println( bujia.disponible)
    println( bujia.precioConIva)
    val pastillas = Producto(1, "pastillas", 500.99, "frenos", 6)
    println( pastillas.disponible)
    println( pastillas.precioConIva)
   
   
}