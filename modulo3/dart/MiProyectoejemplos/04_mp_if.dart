void main() {

  // Estado del vehiculo segun kilometraje

  int kilometraje = 85000;

  if (kilometraje > 100000) {
    print('Mantenimiento urgente');
  } else if (kilometraje > 50000) {
    print('Mantenimiento recomendado');
  } else {
    print('Vehiculo en buen estado');
  }

  // Operador ternario

  String estado =
      kilometraje > 100000
          ? 'Requiere servicio inmediato'
          : 'No requiere servicio inmediato';

  print(estado);

  // Variable nullable

  String? placa;

  String placaMostrada =
      placa != null
          ? placa.toUpperCase()
          : 'Sin placa registrada';

  print(placaMostrada);

  // Forma mas corta usando ??

  String placaMostrada2 =
      placa?.toUpperCase()
          ?? 'Sin placa registrada';

  print(placaMostrada2);
}