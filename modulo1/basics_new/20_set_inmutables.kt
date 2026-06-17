fun main() {
    println("set")
    println("inmutables")

    val numeros = setOf(1, 2, 3, 4, 6, 5, 3, 4, 2, 1, 1, 3)
    println(numeros)

    val pares = setOf(2, 4, 6, 8, 10)
    println("pares $pares")

    val impares = setOf(1, 3, 5, 7, 9)
    val multiplos3 = setOf(3, 6, 9, 12)

    println("impares $impares")

    println("union: ${impares union pares}")
    println("interseccion: ${impares intersect pares}")
    println("substraccion: ${impares subtract pares}")
    println("interseccion multiplos3 y pares: ${multiplos3 intersect pares}")
    println("substraccion impares y multiplos3: ${impares subtract multiplos3}")

    println("pares $pares")
    println("impares $impares")

    println("set mutables")

    val lenguajes = mutableSetOf("kotlin", "java", "reactnative")
    println(lenguajes)

    lenguajes.add("kotlin")
    println(lenguajes)

    lenguajes.add("javascript")
    println(lenguajes)

    lenguajes.remove("java")
    println(lenguajes)

    println("verificar si 'kotlin' existe: ${"kotlin" in lenguajes}")
    println("verificar si 'java' existe: ${"java" in lenguajes}")