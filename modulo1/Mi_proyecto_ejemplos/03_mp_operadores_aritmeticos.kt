//Operadores aritmeticos
fun main() {
    
    val costoReparacion=10
    val numeroServicios=2
    
    println("Suma")
    println("costoReparacion+numeroServicios=${costoReparacion+numeroServicios}")
    println("Resta")
    println("costoReparacion-numeroServicios= ${costoReparacion-numeroServicios}")
println("Multiplicacion")..
    println("costoReparacion*numeroServicios= ${costoReparacion*numeroServicios}")
    println("Divison")
    println("costoReparacion/numeroServicios= ${costoReparacion/numeroServicios}")
    println("Modulo")
    println("costoReparacion%numeroServicios= ${costoReparacion%numeroServicios}")
    
    println("Operadores de Asignacion Compuestas")
    
    var totalCaja=10
    totalCaja+=5
    println("totalCaja+=5 ${totalCaja}")
    totalCaja-=3
    println("totalCaja-=3 ${totalCaja}")
    totalCaja*=2
    println("totalCaja*3 ${totalCaja}")
    totalCaja/=4
    println("totalCaja/=3 ${totalCaja}")
    totalCaja%=4
    println("totalCaja%3 ${totalCaja}")
    
    // Incremento decremento 
    var contadorVehiculos= 0
    contadorVehiculos++
    println("contadorVehiculos++ ${contadorVehiculos}")
    contadorVehiculos--
    println("contadorVehiculos-- ${contadorVehiculos}")
    
    
}