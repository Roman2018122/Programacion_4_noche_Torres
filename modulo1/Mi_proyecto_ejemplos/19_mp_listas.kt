fun main (){
    println("listas")
    println("inmutables")
    
    val vehiculos=listOf("Toyota", "Chevrolet", "Mazda", "Kia", "Nissan")
    println(vehiculos)
    println("size: ${vehiculos.size}")
    println("mostrar el elemento indice 0: ${vehiculos[0]}")
    println("mostrar primer elemento : ${vehiculos.first()}")
    println("mostrar ultimo elemento : ${vehiculos.last()}")
    
    println("mostrar el elemento indice 2: ${vehiculos.get(2)}")
    println("mostrar contendido segun el indice : ${vehiculos.indexOf("Chevrolet")}")
    println("verificar si existe Nissan : ${vehiculos.contains("Nissan")}")
    
    println("verificar si existe Ford: ${"Ford" in vehiculos}")
   
    println("sublista: ${vehiculos.subList(1,4)}")
    println("TOMAR 2 PRIMEROS ELEMENTOS  : ${vehiculos.take(2)}")
    println("SUPRIMIR TRES PRIMEROS ELEMENTOS : ${vehiculos.drop(3)}")
    println("Tomar los ultimos dos elementos: ${vehiculos.takeLast(2)}")
    
    println(vehiculos)
    
    val repuestos=mutableListOf("Aceite", "Filtro", "Bujias", "Frenos")
    println(repuestos)
    
    repuestos.add("Bateria")
    println(repuestos)
    
    repuestos.add(1,"Radiador")
    println(repuestos)
    
    repuestos.remove("Bateria")
    println(repuestos)
    
    repuestos[1]="Correa"  
    println(repuestos)
    
    println("array deque")
    val servicios = ArrayDeque<Int>()
    println(servicios)
    
    servicios.addFirst(1)
    println(servicios)
    
    servicios.addFirst(3)
    println(servicios)
    
    servicios.addLast(2)
    println(servicios)
    
    servicios.removeFirst()
    println(servicios)
    
    servicios.removeLast()
    println(servicios)
}