void main() {

  // Lambda asignada a una variable

  final calcularCostoDoble =
      (double costo) => costo * 2;

  print(
    calcularCostoDoble(50)
  ); // 100

  // Lambda de cuerpo completo

  final calcularTotalConIva =
      (double costo, double iva) {

    final valorIva =
        costo * (iva / 100);

    return costo + valorIva;
  };

  print(
    calcularTotalConIva(100.0, 15.0)
  ); // 115.0

  // Lambda en linea

  final costosServicios = [
    50,
    120,
    80,
    200,
    90,
    150
  ];

  costosServicios.sort(
    (a, b) => b.compareTo(a)
  );

  print(costosServicios);
  // [200, 150, 120, 90, 80, 50]
}