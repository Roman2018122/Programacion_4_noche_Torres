fun main (){
    println("listas")
    println("inmutables")
    val frutas=listOf("manzana", "banana", "cereza", "pera", "piña")
    println(frutas)
    println("size: ${frutas.size}")
    println("mostrar el elemento indice 0: $ {frutas[0]}")
    println("mostrar primer elemento : $ {frutas.first()}")
    println("mostrar ultimo elemento : $ {frutas.last()}")
    
    println("mostrar el elemento indice 2: ${frutas.get(2)}")
    println("mostrar contendido segun el indice : ${frutas.indexOf("banana")}")
    println("mostrar ultimo elemento : ${frutas.contains("piña")}")
    
    println("verificar el elemento indice 2: ${"naranja" in frutas}")
   

    println("sublista: ${frutas.subList(1,4)}")
    println("TOMAR 2 PRIMEROS ELEMENTOS  : ${frutas.take(2)}")
    println("SUPRIMIR TRES PRIMEROS ELEMENTOS : ${frutas.drop(3)}")
    println("Tomar los ultimos dos elementos: ${frutas.takeLast(2)}")
    println(frutas)
    val colores=mutableListOf("blanco", "azul","amarillo","rojo")
    println(colores)
    colores.add("verde")
    println(colores)
    colores.add(1,"morado")
    println(colores)
    colores.remove("verde")
    println(colores)
    colores[1]="gris"  
    prinltn(colores)
    
    println("array deque")
    val numeros = ArrayDeque<Int>()
    println(numeros)
    numeros.addFirst(1)
    println(numeros)
    numeros.addFirst(3)
    println(numeros)
     numeros.addLast(2)
    println(numeros)
     numeros.removeFirst()
    println(numeros)
     numeros.removeLast()
    println(numeros)
    
}