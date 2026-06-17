//Declaracion de variables 
fun main() {
    //val Inmutable
    val nombre = "Taller Mecanico Roman"
    val edad : Int = 10 
    // var mutable
    var contador = 0
    contador = contador  +1
    
    println("$nombre  tiene $edad años de servicio")
    
    //tipos de datos
    val numero1: Byte = 127
    val numero2: Short = 32_767
	val numero3: Int =  12
    val numero4: Long = 2_222_222_333_222_233 
	
    println(numero1)
    println(numero2)
    println(numero3)
    println(numero4)
    
    //Numeros Decimales
    val numero5: Float = 3.14f
	val numero6: Double = 3.14159265 
    
    val booleano: Boolean = true

    //Caracteres 
    val caracter: Char = 'M'
    val cadena: String = "reparacion"
    val inferido = "vehiculo"
    println("Tipo de inferido: ${inferido::class.simpleName}")
    val inferido1 = 12
    println("Tipo de inferido: ${inferido1::class.simpleName}")
    
    //UTILIDADES DE STRING
    //EXPRESIONS
    val primerNombre = "Juan"
    val primerApellido = "Mecanico"
    val primerNombreMayuscula=primerNombre.uppercase() 
    val primerApellidoMayuscula=primerNombre.uppercase() 
    println("Nombre Completo: ${primerNombreMayuscula} ${primerApellidoMayuscula}")
    println("Nombre Completo: ${primerNombre.uppercase()} ${primerApellido.uppercase()}")
    
   
}