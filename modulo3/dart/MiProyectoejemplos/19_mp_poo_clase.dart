class Vehiculo {

  // 1. Propiedades

  final String placa;
  final String cliente;
  String marca;

  bool _enReparacion = false;

  // 2. Constructor

  Vehiculo({
    required this.placa,
    required this.cliente,
    required this.marca,
  });

  // 3. Getters

  bool get enReparacion => _enReparacion;

  String get estado =>
      _enReparacion
          ? 'En reparacion'
          : 'Disponible';

  // 4. Setter

  set cambiarEstado(bool valor) {

    _enReparacion = valor;

    print(
      '$marca (${placa}) : '
      '${valor ? "En reparacion" : "Disponible"}'
    );
  }

  // 5. Metodos

  void ingresarTaller() {

    _enReparacion = true;

    print(
      '$marca con placa $placa '
      'ingreso al taller'
    );
  }

  void entregarVehiculo() {

    _enReparacion = false;

    print(
      '$marca con placa $placa '
      'fue entregado al cliente'
    );
  }

  String resumen() {

    return 'Placa: $placa | '
        'Cliente: $cliente | '
        'Marca: $marca | '
        'Estado: $estado';
  }

  // 6. toString

  @override
  String toString() {

    return 'Vehiculo('
        '$marca, '
        '$placa, '
        '$estado'
        ')';
  }
}

void main() {

  final vehiculo = Vehiculo(
    placa: 'ABC1234',
    cliente: 'Juan Perez',
    marca: 'Toyota',
  );

  vehiculo.ingresarTaller();

  print(
    vehiculo.estado
  );

  print(
    vehiculo.resumen()
  );

  print(
    vehiculo
  );

  vehiculo.cambiarEstado = false;

  print(
    vehiculo.enReparacion
  );
}