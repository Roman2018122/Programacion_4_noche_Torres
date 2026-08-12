fun main(){
    println("Operadores Logicos")
    val esMayor=true
    val tienePermiso=false
    val estaActivo=true
    val mayorEdad= false
    
    println("operador And &&")
    println("$esMayor && $tienePermiso ${esMayor&&tienePermiso}")
    println("$esMayor && $estaActivo ${esMayor&&estaActivo}")
    
    println("operador or ||")
    println("$esMayor || $tienePermiso ${esMayor&&tienePermiso}")
    println("$esMayor || $estaActivo ${esMayor&&estaActivo}")
    println("$esMayor || $tienePermiso ${esMayor||$tienePermiso}")
    println("$mayorEdad || $tienePermiso ||$estaActivo${mayorEdad||tienePermiso||estaActivo}")
    
    
    println("Not logico !")
    println("! $esMayor ${!esMayor}")
    println("! $mayorEdad ${!mayorEdad}")
    val texto = readline()
    println(texto)
}