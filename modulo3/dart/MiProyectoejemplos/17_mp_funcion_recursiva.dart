// Calcular costo acumulado de mantenimientos
double costoTotalMantenimientos(int cantidad, double costoUnitario) {
  if (cantidad <= 1) return costoUnitario; // caso base

  return costoUnitario +
      costoTotalMantenimientos(
        cantidad - 1,
        costoUnitario,
      );
}

// Simulacion de revisiones programadas
int revisionesProgramadas(int anio) {
  if (anio <= 1) return anio;

  return revisionesProgramadas(anio - 1) +
      revisionesProgramadas(anio - 2);
}

// Inventario de repuestos organizado por categorias
int contarRepuestos(
    Map<String, dynamic> inventario) {

  int total = 0;

  for (final entrada in inventario.entries) {

    if (entrada.value is Map) {

      total += contarRepuestos(
        entrada.value as Map<String, dynamic>,
      );

    } else {

      total++;
    }
  }

  return total;
}

void main() {

  print(
    costoTotalMantenimientos(
      6,
      50.0,
    )
  ); // 300.0

  print(
    revisionesProgramadas(10)
  ); // 55

  final inventarioTaller = {
    'Lubricacion': {
      'Aceites': {
        'Aceite 15W40': true,
        'Aceite 20W50': true,
      },
      'Filtros': {
        'Filtro de aceite': true,
      },
    },
    'Electrico': {
      'Baterias': {
        'Bateria 12V': true,
        'Bateria 24V': true,
      },
    },
    'Neumaticos': {
      'Llanta rin 15': true,
      'Llanta rin 17': true,
    }
  };

  print(
    'Total de repuestos: '
    '${contarRepuestos(inventarioTaller)}'
  );
}