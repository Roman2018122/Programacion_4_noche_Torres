// Tipo explicito del parametro funcion

List<int> filtrarKilometrajes(
  List<int> lista,
  bool Function(int) criterio
) {
  return lista.where(criterio).toList();
}

bool requiereMantenimiento(int km) =>
    km > 50000;

bool kilometrajePar(int km) =>
    km % 2 == 0;

void main() {

  final kilometrajes = [
    15000,
    25000,
    60000,
    80000,
    45000,
    120000,
    35000,
    90000
  ];

  print(
    filtrarKilometrajes(
      kilometrajes,
      requiereMantenimiento
    )
  );

  print(
    filtrarKilometrajes(
      kilometrajes,
      kilometrajePar
    )
  );

  // Lambda en linea como argumento

  print(
    filtrarKilometrajes(
      kilometrajes,
      (km) => km >= 80000
    )
  );
}