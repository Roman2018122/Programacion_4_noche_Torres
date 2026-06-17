abstract class ComponenteRueda(val nombre: String) {
    // 1. Declaramos la propiedad abstracta AREA que usarán todas las funciones de abajo
    abstract val area: Double
    abstract fun descripcion(): String

    // Concreto — disponible en todas las subclases (reutilización)
    fun comparar(otra: ComponenteRueda): String = when {
        area > otra.area -> "$nombre ocupa más espacio que ${otra.nombre}"
        area < otra.area -> "$nombre ocupa menos espacio que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} ocupan el mismo espacio"
    }

    // Polimorfismo: toString usa area y descripcion que son polimórficas
    override fun toString() = "${descripcion()} | Área visual: ${"%.2f".format(area)} cm²"
}

// Subclase 1: Rines (Se comportan matemáticamente como un círculo)
class Rines(val radio: Double) : ComponenteRueda("Rin de Aluminio") {
    // El área de un círculo es π * r²
    override val area: Double 
        get() = Math.PI * radio * radio
        
    override fun descripcion() = "Rin circular con radio de $radio cm (Diámetro: ${radio * 2} cm)"
}

// Subclase 2: Neumaticos (Vistos de perfil o sección transversal se comportan como un rectángulo)
class Neumaticos(val ancho: Double, val alto: Double) : ComponenteRueda("Neumático de Auto") {
    // El área de un rectángulo es base * altura
    override val area: Double 
        get() = ancho * alto
        
    override fun descripcion() = "Neumático de perfil rectangular de ${ancho}x${alto} cm"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier tipo de ComponenteRueda
    val inventarioTaller: List<ComponenteRueda> = listOf(
        Rines(20.0),            // Un rin grande (radio 20cm)
        Neumaticos(20.5, 55.0), // Un neumático estándar
        Rines(15.0)             // Un rin más pequeño
    )

    // Recorremos la lista. Cada objeto usará SU propia versión de descripción y área
    inventarioTaller.forEach { println(it) }

    // Encontrar el componente que ocupa más área
    val mayor = inventarioTaller.maxByOrNull { it.area }
    println("\nComponente más grande en piso: ${mayor?.nombre}")

    // Comparación directa usando la función concreta heredada
    println(inventarioTaller[0].comparar(inventarioTaller[1]))
}