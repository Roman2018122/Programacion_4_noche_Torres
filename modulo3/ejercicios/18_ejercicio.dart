import 'dart:io';

void main() {

  print('Registro de kilómetros recorridos por los conductores');

  int kilometrosTotales = 0;

  for (int viaje = 1; viaje <= 5; viaje++) {

    print('\nIngrese los kilómetros del viaje $viaje:');

    int kilometros = int.parse(stdin.readLineSync()!);

    kilometrosTotales += kilometros;

    // Reglas de negocio
    if (kilometros < 50) {

      print('Ruta corta');

    } else if (kilometros >= 50 && kilometros <= 150) {

      print('Ruta media');

    } else {

      print('Ruta larga');
    }
  }

  // Cálculos finales
  double combustibleEstimado = kilometrosTotales / 12;

  double promedioKilometros = kilometrosTotales / 5;

  // Resultados
  print('\n===== RESULTADOS =====');

  print('Total de kilómetros recorridos: $kilometrosTotales km');

  print('Total de combustible estimado: '
        '${combustibleEstimado.toStringAsFixed(2)} litros');

  print('Promedio de kilómetros por viaje: '
        '${promedioKilometros.toStringAsFixed(2)} km');
}