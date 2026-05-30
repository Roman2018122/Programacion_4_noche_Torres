class OrdenReparacion {

  final String cliente;
  double _costoTotal; // privado

  OrdenReparacion(
    this.cliente,
    double costoInicial,
  ) : _costoTotal = costoInicial;

  // Getter

  double get costoTotal => _costoTotal;

  // Los unicos caminos para modificar el costo

  void agregarServicio(double costo) {

    if (costo <= 0) {
      throw ArgumentError(
        'El costo debe ser positivo'
      );
    }

    _costoTotal += costo;

    print(
      'Servicio agregado: \$${costo.toStringAsFixed(2)}. '
      'Nuevo total: \$${_costoTotal.toStringAsFixed(2)}'
    );
  }

  void aplicarDescuento(double descuento) {

    if (descuento <= 0) {
      throw ArgumentError(
        'El descuento debe ser positivo'
      );
    }

    if (descuento > _costoTotal) {
      throw StateError(
        'El descuento supera el total'
      );
    }

    _costoTotal -= descuento;

    print(
      'Descuento aplicado: \$${descuento.toStringAsFixed(2)}. '
      'Nuevo total: \$${_costoTotal.toStringAsFixed(2)}'
    );
  }
}

void main() {

  final orden = OrdenReparacion(
    'Juan Perez',
    150.0,
  );

  orden.agregarServicio(50.0);

  orden.aplicarDescuento(25.0);

  print(
    'Total a pagar: \$${orden.costoTotal}'
  );

  // orden._costoTotal = 1000;
  // ERROR: propiedad privada
}