data class Categoria(val id: Int, val nombre: String)

data class Producto_taller_mecanico(
    val id:        Int,
    val nombre:    String,
    val precio:    Double,
    val stock:     Int,
    val categoria: Categoria,
    val activo:    Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta disponible sin saber la lógica
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.19

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): Producto_taller_mecanico {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

// ENCAPSULAMIENTO: el estado del catálogo es privado y mutable internamente
object CatalogoProductos {
    private val categorias = mutableListOf(
        Categoria(1, "Limpieza"),
        Categoria(2, "Lubricacion"),
        Categoria(3, "Electronico"),
        Categoria(4, "neumaticos")
    )
    private val productos   = mutableListOf<Producto_taller_mecanico>()
    private var siguienteId = 1

    fun agregarProducto(nombre: String, precio: Double, stock: Int, categoriaId: Int): Producto_taller_mecanico? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val producto  = Producto_taller_mecanico(siguienteId++, nombre, precio, stock, categoria)
        productos.add(producto)
        return producto
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<Producto_taller_mecanico>              = productos.toList()
    fun disponibles(): List<Producto_taller_mecanico>         = productos.filter { it.disponible }
    fun porCategoria(id: Int): List<Producto_taller_mecanico> = productos.filter { it.categoria.id == id }
    fun buscar(query: String): List<Producto_taller_mecanico> =
        productos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoProductos.agregarProducto("Limpiador",   89.99, 15, 1)
    CatalogoProductos.agregarProducto("jabon de auto",  29.99,  0, 1)
    CatalogoProductos.agregarProducto("Aceite 15w40",      349.99,  5, 2)
    CatalogoProductos.agregarProducto("Luces led",    149.99,  8, 3)
    CatalogoProductos.agregarProducto("Michelin rin 17", 150.00,  7,4 )

    println("=== Todos los productos ===")
    CatalogoProductos.listar().forEach { p ->
        val estado = if (p.disponible) "✅" else "❌"
        println("$estado ${p.nombre} — ${"%.2f".format(p.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 15% descuento ===")
    CatalogoProductos.disponibles()
        .map { it.aplicarDescuento(15.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.precio)}") }

    for (producto in CatalogoProductos.listar()){
        if (producto.disponible) {
        println("${producto.nombre} - ${producto.precio}")
    }
    }
}