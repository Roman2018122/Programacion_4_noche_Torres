fun main(){
    println("Operadores Logicos")
    val vehiculoIngresado=true
    val clienteTieneDeuda=false
    val mecanicoDisponible=true
    val servicioPagado= false
    
    println("operador And &&")
    println("$vehiculoIngresado && $clienteTieneDeuda ${vehiculoIngresado&&clienteTieneDeuda}")
    println("$vehiculoIngresado && $mecanicoDisponible ${vehiculoIngresado&&mecanicoDisponible}")
    
    println("operador or ||")
    println("$vehiculoIngresado || $clienteTieneDeuda ${vehiculoIngresado||clienteTieneDeuda}")
    println("$vehiculoIngresado || $mecanicoDisponible ${vehiculoIngresado||mecanicoDisponible}")
    println("$vehiculoIngresado || $clienteTieneDeuda ${vehiculoIngresado||clienteTieneDeuda}")
    println("$servicioPagado || $clienteTieneDeuda || $mecanicoDisponible ${servicioPagado||clienteTieneDeuda||mecanicoDisponible}")
    
    
    println("Not logico !")
    println("! $vehiculoIngresado ${!vehiculoIngresado}")
    println("! $servicioPagado ${!servicioPagado}")
    
    val texto = readLine()
    println(texto)
}