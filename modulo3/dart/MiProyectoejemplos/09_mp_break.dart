void main() {

  final ordenesServicio = [101, 102, -1, 103, 104, -1, 105];
  //                           ↑           ↑
  //                    orden invalida  orden invalida

  // continue - ignora la orden y continua

  print('=== Procesando con continue ===');

  for (final orden in ordenesServicio) {

    if (orden < 0) {
      print('Orden invalida ignorada');
      continue;
    }

    print('Procesando orden #$orden');
  }

  // break - detiene el procesamiento

  print('\n=== Procesando con break ===');

  for (final orden in ordenesServicio) {

    if (orden < 0) {
      print('Error critico - deteniendo proceso');
      break;
    }

    print('Procesando orden #$orden');
  }
}