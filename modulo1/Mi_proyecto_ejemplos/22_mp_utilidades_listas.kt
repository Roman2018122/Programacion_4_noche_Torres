fun main() {
  println("Utilidades de listas")
  
  val costosServicios=listOf(10,20,30,40,50,60,70,80,90,100)
  println(costosServicios)
  
  val costosDuplicados=costosServicios.map{it*2}
  println(costosDuplicados)
  
  val serviciosTexto=costosServicios.map{"Servicio_$it"}
  println(serviciosTexto)
  
  println("Filter")
  
  val costosPares=costosServicios.filter{it % 2==0}
  println(costosPares)
  
  val costosMayores50=costosServicios.filter{it > 50}
  println(costosMayores50)
  
  val costosParesYMayores50=costosServicios.filter{it %2==0 && it >50}
  println(costosParesYMayores50)
  
  val costosImpares=costosServicios.filterNot{it % 2==0}
  println(costosImpares)
}