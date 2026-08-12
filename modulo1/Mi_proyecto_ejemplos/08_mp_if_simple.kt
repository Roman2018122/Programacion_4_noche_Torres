fun main() {
  	println("control de flujo (son estructuras que controlan el flujo y procesamiento de los datos de un sistema, for, if while (iteraciones, condicionales))")
  	println("If simple")
  	println("Temperatura del motor en grados centig.")
  	val temperatura= readLine()?.toDoubleOrNull()?:75.0
  	if(temperatura >= 90){
  	    println("Motor caliente")
  	}
  	if(temperatura >= 110){
  	    println("Sobrecalentamiento del motor")
  	}
  	println("Temperatura registrada: $temperatura")
  	
}