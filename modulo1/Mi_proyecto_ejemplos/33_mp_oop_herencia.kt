// Sin open — no se puede heredar (protección por defecto)
class Auto(val nombre: String)
// class Perro : Auto("Rex")  // ERROR — Auto es final

// Con open — la jerarquía está diseñada para ello
open class Vehiculo(val nombre: String, val marca: String) {

    open fun hacerSonido() = println("$nombre emite sonido del motor")

    open fun descripcion() = "Soy $nombre, un vehículo marca $marca"

    fun acelerar() = println("$nombre está acelerando")
}

// HERENCIA: Perro reutiliza todo de Auto y especializa hacerSonido
class Auto(nombre: String, marca: String, val puertas: Int) : Vehiculo(nombre, marca) {

    override fun hacerSonido() {
        super.hacerSonido()
        println("(sonido suave de auto)")
    }

    override fun descripcion(): String {
        return "${super.descripcion()}, tiene $puertas puertas"
    }
}

class Moto(nombre: String, marca: String, val deportiva: Boolean) : Vehiculo(nombre, marca) {

    override fun hacerSonido() {
        println("$nombre hace un sonido fuerte y agudo 🏍️")
    }

    override fun descripcion(): String {
        return "${super.descripcion()}, es ${if (deportiva) "deportiva" else "urbana"}"
    }
}

// Función principal
fun main() {
    val auto = Auto("Corolla", "Toyota", 4)
    val moto = Moto("GSX", "Suzuki", true)

    auto.hacerSonido()
    println(auto.descripcion())
    auto.acelerar()

    println("------------")

    moto.hacerSonido()
    println(moto.descripcion())
    moto.acelerar()
}