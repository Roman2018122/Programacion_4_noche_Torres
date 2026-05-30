double aplicarDescuento(double costo) => costo * 0.90;

double aplicarRecargo(double costo) => costo * 1.15;

void main() {

  // La variable 'calculo' tiene tipo:
  // double Function(double)

  double Function(double) calculo;

  calculo = aplicarDescuento;
  print(
    'Costo con descuento: \$${calculo(100)}'
  );

  calculo = aplicarRecargo;
  print(
    'Costo con recargo: \$${calculo(100)}'
  );

  // Lista de funciones

  final operaciones =
      <double Function(double)>[
        aplicarDescuento,
        aplicarRecargo
      ];

  for (final operacion in operaciones) {

    print(
      'Resultado: \$${operacion(200)}'
    );
  }
}