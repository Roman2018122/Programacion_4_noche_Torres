fun main() {
    println("Funcion lambda")
    val productos_precio:(Int,Int)-> Int={a: Int, b: Int -> a+b}
    println("Productos con precio: " + productos_precio(1,2))
    //inferido
    val piezas:(Int, Int)->Int={a,b->a+b}
    println("Piezas: " + piezas(1,2))
    //parametro implicito it
    val duplicar:(Int)->Int={it*2}
    println("Duplicar: " + duplicar(2)) 
             
}

