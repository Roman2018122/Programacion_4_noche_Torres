void main() {

  // for con indice

  for (int i = 1; i <= 5; i++) {
    print('Vehiculo atendido #$i');
  }

  // for con paso distinto

  for (int porcentaje = 0; porcentaje <= 100; porcentaje += 25) {
    print('Avance de reparacion: $porcentaje%');
  }

  // for decreciente

  for (int dias = 5; dias >= 1; dias--) {
    print('Entrega en $dias dias');
  }

  // Lista de servicios

  final servicios = [
    'Cambio de aceite',
    'Revision de frenos',
    'Alineacion',
    'Balanceo',
    'Cambio de bateria'
  ];

  // for-in

  for (final servicio in servicios) {
    print(servicio);
  }

  // forEach

  servicios.forEach(
    (s) => print(s.toUpperCase())
  );

  // Map de repuestos y stock

  final inventario = {
    'Aceite 15W40': 25,
    'Filtro de aceite': 12,
    'Pastillas de freno': 8,
    'Baterias': 5
  };

  for (final item in inventario.entries) {
    print(
      '${item.key} -> Stock: ${item.value}'
    );
  }

  // Recorrer caracteres de una placa

  for (final caracter in 'ABC1234'.split('')) {
    print(caracter);
  }
}