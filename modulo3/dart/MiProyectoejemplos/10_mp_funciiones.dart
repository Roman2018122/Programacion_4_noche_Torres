void mostrarBienvenida() {
  print('Bienvenido al taller mecanico');
}

// Funcion con parametros sin retorno

void registrarCliente(String nombre) {
  print('Cliente registrado: $nombre');
}

// Funcion sin parametros y con retorno

int obtenerNumeroBahia() {
  return 10;
}

// Funcion con parametros y con retorno

double calcularTotal(double servicio1, double servicio2) {
  return servicio1 + servicio2;
}

// Funcion flecha (arrow function)

double calcularIva(double costo) => costo * 0.15;

// Funcion con parametros opcionales

void registrarVehiculo(
  String cliente,
  [String placa = 'Sin placa']
) {
  print('Cliente: $cliente - Placa: $placa');
}

// Funcion con parametros nombrados

void registrarOrden({
  required String cliente,
  required String vehiculo,
}) {
  print(
    'Orden registrada para $cliente - Vehiculo: $vehiculo'
  );
}

// Con tipo explicito

String formatearCosto(double costo) =>
    '\$${costo.toStringAsFixed(2)}';

// Sin tipo explicito

formatearCostoSinTipo(double costo) =>
    '\$${costo.toStringAsFixed(2)}';

void main() {

  mostrarBienvenida();

  registrarCliente('Jonathan Torres');

  int bahia = obtenerNumeroBahia();

  print('Bahia asignada: $bahia');

  print(
    'Bahia disponible: ${obtenerNumeroBahia()}'
  );

  print(
    'Total servicios: \$${calcularTotal(50, 80)}'
  );

  print(
    'IVA del servicio: \$${calcularIva(100)}'
  );

  registrarVehiculo(
    'Jonathan Torres',
    'ABC1234'
  );

  registrarVehiculo(
    'Jonathan Torres'
  );

  registrarOrden(
    cliente: 'Ana',
    vehiculo: 'Toyota Corolla'
  );

  print(formatearCosto(129.90));

  print(formatearCostoSinTipo(129.90));
}