// Clase abstracta: define lo que debe tener cualquier servicio

abstract class ServicioTaller {

  String get nombre;

  double calcularCosto();

  int calcularTiempo();

  // Metodo concreto

  void describir() {
    print(
      '$nombre - '
      'Costo: \$${calcularCosto().toStringAsFixed(2)} - '
      'Tiempo estimado: ${calcularTiempo()} horas'
    );
  }
}

// Servicio de cambio de aceite

class CambioAceite extends ServicioTaller {

  final double precioAceite;

  CambioAceite(this.precioAceite);

  @override
  String get nombre => 'Cambio de Aceite';

  @override
  double calcularCosto() => precioAceite + 15.0;

  @override
  int calcularTiempo() => 1;
}

// Servicio de alineacion

class Alineacion extends ServicioTaller {

  final int ruedas;

  Alineacion(this.ruedas);

  @override
  String get nombre => 'Alineacion';

  @override
  double calcularCosto() => ruedas * 12.5;

  @override
  int calcularTiempo() => 2;
}

void main() {

  final servicios = <ServicioTaller>[
    CambioAceite(35.0),
    Alineacion(4),
  ];

  for (final servicio in servicios) {
    servicio.describir();
  }
}