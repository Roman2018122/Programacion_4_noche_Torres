import 'dart:io';

void main() {

  print('Registro de ventas semanales');

  int total_ventas = 0;

  for (int dia = 1; dia <= 7; dia++) {
    print('Ingrese ventas del dia $dia');
    int ventas =
        int.parse(stdin.readLineSync()!);

    total_ventas += ventas;
  }

  double promedio_ventas =
      total_ventas / 7;


  print('Total de ventas: $total_ventas');

  print('Promedio de ventas: '
        '$promedio_ventas');

  if (promedio_ventas < 10) {

    print('Bajo rendimiento');

  } else if (promedio_ventas >= 10 &&
             promedio_ventas <= 25) {

    print('Rendimiento normal');

  } else {

    print('Alto rendimiento');
  }

}