void main() {

  // Conversiones numericas

  int kilometraje = 85000;

  double kilometrajeDecimal =
      kilometraje.toDouble();

  String kilometrajeTexto =
      kilometraje.toString();

  print(kilometrajeDecimal);
  print(kilometrajeTexto);

  // String -> numero

  int stockAceite =
      int.parse('25');

  double costoRevision =
      double.parse('49.99');

  print(stockAceite);
  print(costoRevision);

  // Conversion segura

  int? cantidadLlantas =
      int.tryParse('abc');

  double? costoBateria =
      double.tryParse('150.50');

  print(cantidadLlantas);
  print(costoBateria);

  // Verificar tipo con is

  Object servicio =
      'Cambio de aceite';

  if (servicio is String) {
    print(
      'Nombre del servicio: $servicio'
    );

    print(
      'Cantidad de caracteres: ${servicio.length}'
    );
  }

  // Cast explicito con as

  Object mecanico =
      'Carlos';

  String nombreMecanico =
      mecanico as String;

  print(nombreMecanico);

  // Nulabilidad

  String? observacion = null;

  int longitud =
      observacion?.length ?? 0;

  print(
    'Longitud observacion: $longitud'
  );

  // Numeros especiales

  print(double.infinity);

  print(double.nan);

  print(double.maxFinite);
}