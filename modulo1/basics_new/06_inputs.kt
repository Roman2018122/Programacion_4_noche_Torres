fun main() {
  	println("inputs")
    println("Escribe NOmbre")
    val nombre = readLine()
    println("Hola $nombre")
    
    println("Escriba su edad: ")
    val edad=readLine()?.toDoubleOrNull()?:0.00
    println("su edad es: $edad")
    
    
    val doble = edad*2
    println("El doble de edad es : ${doble}")
    println("El doble de edad es : ${edad*2}")
    
}