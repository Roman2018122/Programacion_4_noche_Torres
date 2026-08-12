import 'dart:io';

// async -> la funcion retorna Future<String>

Future<String> obtenerEstadoOrden() async {

  // Simula una consulta a una base de datos

  await Future.delayed(
    Duration(milliseconds: 200)
  );

  return 'Reparacion finalizada';
}

// main tambien puede ser async

void main() async {

  print(
    'Consultando estado de la orden...'
  );

  final estado =
      await obtenerEstadoOrden();

  print(
    'Estado de la orden: $estado'
  );

  print(
    'Consulta completada'
  );
}