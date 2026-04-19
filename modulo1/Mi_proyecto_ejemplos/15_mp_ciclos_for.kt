// Online Kotlin compiler to run Kotlin program online

fun main() {
  println("CICLOS for")
  for (i in 1..5){
      println("Vehiculo atendido #$i")
  }
  
  println("until")
  for (i in 1 until 5){
      println("Turno de servicio #$i")
  }
  
  println("downTo")
  for (i in 10 downTo 1){
      println("Cuenta regresiva para cierre del taller: $i")
  }
  
  println("listas")
  val vehiculos = listOf("Toyota", "Chevrolet", "Mazda")
  for (vehiculo in vehiculos){
      println("Vehiculo en taller: $vehiculo")
  }
  
  println("indice valor")
  for ((index, valor) in vehiculos.withIndex()){
      println("Posicion $index, Vehiculo: $valor")
  }
  
  println("break")
  for (i in 1..5){
    if(i==3){
        break
    }
    println("Revisando vehiculo #$i")
  }
      
  println("continue")
  for (i in 1..5){
      if(i==3){
          continue
      }
      println("Vehiculo procesado #$i")
  }
}