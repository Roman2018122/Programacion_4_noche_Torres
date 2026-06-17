fun main() {
  	println("conversiones")
  	val costoMantenimiento: Int = 12
  	
  	val costoDecimal: Double = costoMantenimiento.toDouble()
  	val costoLong: Long = costoMantenimiento.toLong()
  	val costoTexto: String = costoMantenimiento.toString()
  	
  	println("to Double $costoDecimal")
  	println("to Long $costoLong")
  	println("to String $costoTexto")
   
   println("String a Numerico")
   val numeroServicios = "1234".toInt()
   val precioServicio = "3.1415".toDouble()
   
   val datoInvalido = "abcd".toIntOrNull()
   println(datoInvalido)
   
}