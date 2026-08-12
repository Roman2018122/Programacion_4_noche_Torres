fun main() {
    println("Map")
    println("inmutables")

    val capitales = mapOf(
        "espana" to "madrid",
        "francia" to "paris",
        "alemania" to "berlin",
        "italia" to "roma"
    )

    println(capitales["espana"])
    println(capitales["portugal"])

    println(capitales.getOrDefault("espana", "desconocido"))
    println(capitales.getOrDefault("portugal", "desconocido"))

    println(capitales.keys)
    println(capitales.values)
    println(capitales.entries)
    println(capitales)

    for ((pais, capital) in capitales) {
        println("pais: $pais - capital: $capital")
    }

    for ((_, capital) in capitales) {
        println("capital: $capital")
    }
    println("mutables")

    val inventario = mutableMapOf(
        "laptops" to 10,
        "impresoras" to 4,
        "teclados" to 12,
        "mouse" to 8
    )
    
    inventario["Monitores"] = 5
    println(inventario)
    
    inventario["laptops"] = 20
    println(inventario)
    
    inventario.remove("mouse")
    println(inventario)

    inventario.getOrPut("Proyector") { 15 }
    println(inventario)
    
    inventario.getOrPut("teclados") { 15 }
    println(inventario)