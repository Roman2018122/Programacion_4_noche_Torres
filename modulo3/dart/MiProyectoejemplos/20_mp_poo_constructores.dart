class Vehiculo {
  final String placa;
  final String cliente;
  final String servicio;
  final bool urgente;

  // Constructor principal
  Vehiculo({
    required this.placa,
    required this.cliente,
    required this.servicio,
    this.urgente = false,
  });
  // Constructor nombrado
  Vehiculo.revisionRapida()
      : placa = 'SIN-PLACA',
        cliente = 'Cliente temporal',
        servicio = 'Revision general',
        urgente = false;

  // Constructor nombrado
  Vehiculo.urgente({
    required this.placa,
    required this.cliente,
  })  : servicio = 'Reparacion urgente',
        urgente = true;

  // Constructor factory
  factory Vehiculo.desdeRegistro(String registro) {

    final datos = registro.split(',');

    return Vehiculo(
      placa: datos[0],
      cliente: datos[1],
      servicio: datos[2],
      urgente: datos[3].toLowerCase() == 'true',
    );
  }

  @override
  String toString() {

    return 'Vehiculo('
        'placa: $placa, '
        'cliente: $cliente, '
        'servicio: $servicio, '
        'urgente: $urgente'
        ')';
  }
}

void main() {

  final v1 = Vehiculo(
    placa: 'ABC123',
    cliente: 'Juan Perez',
    servicio: 'Cambio de aceite',
  );

  final v2 = Vehiculo.revisionRapida();

  final v3 = Vehiculo.urgente(
    placa: 'XYZ789',
    cliente: 'Maria Lopez',
  );

  final v4 = Vehiculo.desdeRegistro(
    'DEF456,Carlos Ruiz,Alineacion y balanceo,true'
  );

  print(v1);
  print(v2);
  print(v3);
  print(v4);
}