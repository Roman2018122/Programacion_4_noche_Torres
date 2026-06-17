void main() {

  // while - revisar vehiculos pendientes

  int vehiculosPendientes = 4;
  int atendidos = 0;

  while (vehiculosPendientes > 0) {

    atendidos++;
    vehiculosPendientes--;

    print(
      'Vehiculo atendido #$atendidos '
      '(pendientes: $vehiculosPendientes)'
    );
  }

  // do-while - intentos de arranque

  int intentos = 0;
  bool motorEncendido = false;

  do {

    intentos++;

    print(
      'Intento de encender motor #$intentos'
    );

    // Simular que enciende en el tercer intento

    if (intentos == 3) {
      motorEncendido = true;
    }

  } while (
      !motorEncendido &&
      intentos < 5
  );

  print(
    motorEncendido
      ? 'Motor encendido tras $intentos intentos'
      : 'No fue posible encender el motor'
  );
}