fun main () {
    println("if con multiples condiciones")
    println("temperatura del motor (°C)")
    
    val temperatura = readLine()?.toIntOrNull()?:0
    
    val clasificacion = if(temperatura < 70) {
        "Motor frio"
    } else if (temperatura <= 90){
        "Temperatura normal"
    } else if(temperatura <= 110) {
        "Motor caliente"
    } else if (temperatura <= 130){
        "Sobrecalentamiento"
    } else{
        "Falla critica del motor"
    }
    
    println("clasificacion: $clasificacion")
}