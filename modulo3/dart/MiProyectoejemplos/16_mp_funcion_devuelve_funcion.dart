// Fabrica de calculos para servicios

double Function(double) crearCalculadorCosto(
    double factor) {

  return (double costo) => costo * factor;
}

void main() {

  final costoDoble =
      crearCalculadorCosto(2);

  final costoTriple =
      crearCalculadorCosto(3);

  final costoConIva =
      crearCalculadorCosto(1.15);

  print(costoDoble(50));      // 100
  print(costoTriple(50));     // 150
  print(costoConIva(100));    // 115

  // Validador de costos de servicios

  bool Function(double)
      crearValidadorCosto(
          double minimo,
          double maximo) {

    return (costo) =>
        costo >= minimo &&
        costo <= maximo;
  }

  final servicioEconomico =
      crearValidadorCosto(
        0,
        50,
      );

  final servicioPremium =
      crearValidadorCosto(
        200,
        double.infinity,
      );

  print(
    servicioEconomico(35)
  ); // true

  print(
    servicioPremium(250)
  ); // true

  print(
    servicioPremium(80)
  ); // false
}