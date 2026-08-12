void main() {

  final costosServicios = [
    29.99,
    49.50,
    15.00,
    99.99
  ];

  // map transforma cada elemento

  final costosConIva =
      costosServicios.map(
        (costo) => costo * 1.15
      );

  print(costosConIva.toList());

  // map sobre Strings

  final servicios = [
    'Cambio de aceite',
    'Revision de frenos',
    'Alineacion'
  ];

  final serviciosDisponibles =
      servicios.map(
        (servicio) => 'Servicio: $servicio'
      );

  print(serviciosDisponibles.toList());

  // where filtra elementos

  final kilometrajes = [
    15000,
    45000,
    80000,
    25000,
    120000,
    35000
  ];

  final mantenimientoRecomendado =
      kilometrajes.where(
        (km) => km > 50000
      );

  print(
    mantenimientoRecomendado.toList()
  );

  final kilometrajesNormales =
      kilometrajes.where(
        (km) => km <= 50000
      );

  print(
    kilometrajesNormales.toList()
  );
}