fun main() {
  	println("control de flujo (son estructuras que controlan el flujo y procesamiento de los datos de un sistema, for, if while (iteraciones, condicionales))")
  	
  	
  	println("If Dos caminos")
  	println("Ingrese tipo de examen Laboratorio/imagen")
  	
  	
  	val tipoExamen = readLine()?.trim()?.lowercase() == "laboratorio"
  	
  	if(tipoExamen){
  	    
  	    println("tipo de examen: $tipoExamen el paciente debe ir en ayunas!")
  	}
  	else{
  	    println("tipo de examen: $tipoExamen no debe ir en ayunas")
  	}
}