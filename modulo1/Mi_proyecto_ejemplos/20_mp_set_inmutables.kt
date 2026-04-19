fun main() {
    println("set")
    println("inmutables")

    val vehiculos = setOf("Toyota", "Chevrolet", "Mazda", "Kia", "Nissan", "Toyota", "Mazda")
    println(vehiculos)

    val serviciosBasicos = setOf("Aceite", "Filtro", "Revision")
    println("servicios basicos $serviciosBasicos")

    val serviciosAvanzados = setOf("Motor", "Frenos", "Suspension")
    val serviciosEspeciales = setOf("Frenos", "Suspension", "Electrico")

    println("servicios avanzados $serviciosAvanzados")

    println("union: ${serviciosBasicos union serviciosAvanzados}")
    println("interseccion: ${serviciosBasicos intersect serviciosAvanzados}")
    println("substraccion: ${serviciosBasicos subtract serviciosAvanzados}")
    println("interseccion servicios especiales y avanzados: ${serviciosEspeciales intersect serviciosAvanzados}")
    println("substraccion avanzados y especiales: ${serviciosAvanzados subtract serviciosEspeciales}")

    println("servicios basicos $serviciosBasicos")
    println("servicios avanzados $serviciosAvanzados")

    println("set mutables")

    val repuestos = mutableSetOf("Aceite", "Filtro", "Bujias")
    println(repuestos)

    repuestos.add("Aceite")
    println(repuestos)

    repuestos.add("Bateria")
    println(repuestos)

    repuestos.remove("Filtro")
    println(repuestos)

    println("verificar si 'Aceite' existe: ${"Aceite" in repuestos}")
    println("verificar si 'Filtro' existe: ${"Filtro" in repuestos}")
}