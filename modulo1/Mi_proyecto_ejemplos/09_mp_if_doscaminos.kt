fun main() {
  	println("control de flujo (son estructuras que controlan el flujo y procesamiento de los datos de un sistema, for, if while (iteraciones, condicionales))")
  	
  	
  	println("If Dos caminos")
  	println("Tiene seguro el auto? s/n")
  	
  	val tieneSeguro = readLine()?.trim()?.lowercase() == "s"
  	println("Costo de la revicion mecanica $")
  	val costoBase = readline()?.toDoubleOrNull()?:0.0
  	if(tieneSeguro){
  	    val cobertura= costoBase*0.80
  	    println("seguro cubre $cobertura Cliente cubre ${costoBase -cobertura}")
  	}
  	else{
  	    println("cliente cubre $costoBase")
  	}
}