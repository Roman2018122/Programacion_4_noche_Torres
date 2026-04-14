fun main () {
    println("if con multiples condiciones")
    println("presion arterial sistolica ")
    val sistolica = readLine()?.toIntOrNull()?:0
    val clasificacion = if(sistolica <90) 
    "Hipotension"
    } else if (sistolica <= 119){
        "Normal"
    } else if(sistolica <=139) {
        "elevada"
    } else if (sistolica <=179){
        "Hipertension grado 2"
    }else{
        "Crisis Hipertensiva"
    }
    println("clasificacion: $clasificacion")
}