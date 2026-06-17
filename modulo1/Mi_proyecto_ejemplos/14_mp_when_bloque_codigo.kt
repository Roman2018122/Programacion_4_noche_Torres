fun main() {
  println("When con bloques de codigo")
  println("Nombre del vehiculo:")
  val vehiculo = readLine()?.trim()?:""
  
  println("Nivel de falla CRITICO/URGENTE/MODERADO/LEVE:")
  val nivel = readLine()?.trim()?.uppercase()?:""
  
  when(nivel) {
      "CRITICO"->{
          println("ALERTA CRITICA - Vehiculo: $vehiculo")
          println("Accion inmediata")
          println("Registrar hora de ingreso al taller")
      }
      "URGENTE"->{
          println("URGENTE - Vehiculo: $vehiculo")
          println("Priorizar atencion en taller")
          println("Reevaluar en 15 minutos")
      }
      "MODERADO"->println("Moderado: vehiculo $vehiculo, registrar y monitorear")
      "LEVE"->println("Leve: vehiculo $vehiculo, registrar en lista normal")
      else->println("Nivel de falla no reconocido")
  }

    println("Año del vehiculo:")
    val anio = readLine()?.toIntOrNull()?:0
    
    val clasificacion = when(anio){
        in 0..2000 -> "Vehiculo antiguo"
        in 2001..2010-> "Vehiculo usado"
        in 2011..2018-> "Vehiculo semi-nuevo"
        in 2019..2024-> "Vehiculo moderno"
        else-> "Vehiculo reciente"
    }
    
    println("$anio -> $clasificacion")
}