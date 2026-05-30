void main() {

  // var - tipo inferido
  var cliente = 'Juan Perez';      // String
  var kilometraje = 85000;         // int
  var costoRevision = 89.99;       // double
  var reparado = true;             // bool

  // Tipo explicito
  String vehiculo = 'Toyota Corolla';
  int stockAceite = 100;
  double iva = 0.15;
  bool disponible = true;

  // final - no se puede reasignar
  final taller = 'Taller Mecanico Torres';

  // taller = 'Otro Taller'; // ERROR

  // const - constante de compilacion
  const costoDiagnostico = 25.0;
  const porcentajeDescuento = 0.10;

  // Diferencia entre final y const
  final fechaIngreso = DateTime.now();

  // const fechaIngreso = DateTime.now(); // ERROR

  print('Cliente: $cliente');
  print('Vehiculo: $vehiculo');
  print('Kilometraje: $kilometraje km');
  print('Taller: $taller');

  // var - mutable
  var vehiculosAtendidos = 0;

  vehiculosAtendidos = 1;

  print('Vehiculos atendidos: $vehiculosAtendidos');

  // final - referencia fija
  final servicios = [
    'Cambio de aceite',
    'Revision de frenos',
    'Alineacion'
  ];

  servicios.add('Cambio de bateria');

  print(servicios);

  // const - completamente inmutable
  const categorias = [
    'Lubricantes',
    'Frenos',
    'Llantas'
  ];

  print(categorias);

  print('Fecha de ingreso: $fechaIngreso');
  print('Costo diagnostico: \$$costoDiagnostico');
}