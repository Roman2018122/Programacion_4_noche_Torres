fun main() {
    println("when con condiciones")
    println("Año del vehiculo")
    
    val anio  = readLine()?.toIntOrNull()?:0
    
    print("¿tiene seguro?: s/n ")
    val tieneSeguro = readLine()?.trim()?.lowercase()=="s"
    
    val nivel = if (tieneSeguro){
        println("nivel del seguro (BASICO/INTERMEDIO/PREMIUM)")
        readLine()?.trim()?.uppercase()?:""
        
    }else ""
    
    val costo= when{
        !tieneSeguro && anio <2005 ->0.0
        !tieneSeguro && anio >= 2020-> 15.0
        !tieneSeguro ->45.0
        nivel== "BASICO"->20.0
        nivel== "INTERMEDIO"->10.0
        nivel== "PREMIUM"->0.0
        else->30.0
    }
    
    println("costo del servicio :$${"%.2f".format(costo)}")
}