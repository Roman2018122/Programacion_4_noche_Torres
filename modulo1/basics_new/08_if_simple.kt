fun main() {
  	println("control de flujo (son estructuras que controlan el flujo y procesamiento de los datos de un sistema, for, if while (iteraciones, condicionales))")
  	println("If simple")
  	println("Temperatura corporal del paciente grados centig.")
  	val temperatura= readLine()?.toDoubleOrNull()?:35.5
  	if(temperatura >= 38){
  	    println("fiebre detectada")
  	}
  	if(temperatura >= 40){
  	    println("Fiebre alta")
  	}
  	println("Temperatura registrada: $temperatura")
  	
   
    
}