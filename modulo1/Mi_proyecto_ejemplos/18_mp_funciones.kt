fun main() {
  saludar()
  saludarConParametros("Toyota")
  
  val costoServicio=10
  val repuestos=20
  
  println("Costo total $costoServicio + $repuestos = ${sumar(costoServicio, repuestos)}")
  println("Diferencia $costoServicio - $repuestos = ${restar(costoServicio, repuestos)}")
  
  operacion()
  
  println("Multiplicar $costoServicio * $repuestos = ${multiplicar(costoServicio, repuestos)}")
}

fun saludar(){
    println("Bienvenido al taller mecanico")
}

fun saludarConParametros(vehiculo: String){
    println("Vehiculo ingresado: $vehiculo")
}

fun sumar(numero1: Int, numero2: Int): Int{
    return numero1+numero2
}

// funcion simplificada
fun restar(numero1: Int, numero2: Int)= numero1-numero2

//funcion dentro de funcion
fun operacion(){
    fun costoReparacion(x: Int)= x*x
    println("Costo estimado de reparacion: ${costoReparacion(5)}")
}

//funciones como variables
val multiplicar={a: Int, b: Int-> a*b}