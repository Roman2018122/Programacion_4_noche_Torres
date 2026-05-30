// Clase base

class Vehiculo {

  final String placa;
  final int anio;

  Vehiculo(
    this.placa,
    this.anio,
  );

  // Metodo que cada subclase especializa

  String tipoServicio() => 'Revision general';

  // Metodo comun heredado

  void presentarse() {

    print(
      'Vehiculo $placa, '
      'anio $anio, '
      'servicio: ${tipoServicio()}'
    );
  }
}

// HERENCIA

class Auto extends Vehiculo {

  Auto(
    super.placa,
    super.anio,
  );

  @override
  String tipoServicio() =>
      'Cambio de aceite';

  void revisarMotor() {

    print(
      '$placa en revision de motor'
    );
  }
}

class Moto extends Vehiculo {

  Moto(
    super.placa,
    super.anio,
  );

  @override
  String tipoServicio() =>
      'Revision de cadena';

  void revisarFrenos() {

    print(
      '$placa en revision de frenos'
    );
  }
}

void main() {

  final auto = Auto(
    'ABC123',
    2022,
  );

  final moto = Moto(
    'XYZ789',
    2021,
  );

  auto.presentarse();

  moto.presentarse();

  auto.revisarMotor();

  moto.revisarFrenos();
}