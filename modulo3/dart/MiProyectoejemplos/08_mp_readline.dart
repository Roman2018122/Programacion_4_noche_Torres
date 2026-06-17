import 'dart:io';

void main() {

  print('Ingrese el nombre del cliente:');
  String? cliente = stdin.readLineSync();

  print('Bienvenido al taller, $cliente');

  print('Ingrese la placa del vehiculo:');
  String? placa = stdin.readLineSync();

  print('Placa registrada: $placa');

  print('Ingrese el kilometraje actual del vehiculo:');
  int kilometraje =
      int.parse(stdin.readLineSync()!);

  print('Kilometraje registrado: $kilometraje km');

  print('Ingrese el costo del servicio:');
  double costo =
      double.parse(stdin.readLineSync()!);

  print('Costo del servicio: \$${costo.toStringAsFixed(2)}');
}