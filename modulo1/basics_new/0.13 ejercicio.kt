fun main(){
    println("CICLOS repeat")
    println("ingresar la temperatura del paciente")
    val temperatura = 0.0
    var fiebres=0
    repeat(6){i->
        println("Medicion de temperatura ${i+1}")
        val temperatura = readLine()?.toDoubleOrNull()?:0
        temperaturas+=temperatura
        if (temperatura>38.5){
            fiebres++
            
        }
    }
    val promedio=temperaturas/6
    println("promedio: $promedio")
    if(fiebres>2){
        println("fiebre sostenida")
    }
