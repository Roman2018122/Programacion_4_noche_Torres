class DatosCliente(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        // Encapsulamiento en acción: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(email.contains("@")) { "Email inválido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail      = email.substringAfter("@")
    }
}

fun main() {
    val datos = DatosCliente(" Jonathan Roman  ", "romana11@kotlin.dev")
    println(datos.nombreNormalizado)  // ana garcía
    println(datos.dominioEmail)       // kotlin.dev

    // DatosCliente("", "invalido")   // IllegalArgumentException — require falla
}