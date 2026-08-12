void main() {

  String estadoOrden = 'EN_PROCESO';

  switch (estadoOrden) {
    case 'RECIBIDO':
      print('Vehiculo recibido');
      break;

    case 'EN_PROCESO':
      print('Vehiculo en reparacion');
      break;

    case 'FINALIZADO':
      print('Trabajo completado');
      break;

    case 'ENTREGADO':
      print('Vehiculo entregado al cliente');
      break;

    default:
      print('Estado desconocido');
  }

  // Switch expresion

  String estado = 'FINALIZADO';

  String descripcion = switch (estado) {
    'RECIBIDO'   => 'Vehiculo ingresado al taller',
    'EN_PROCESO' => 'Vehiculo siendo reparado',
    'FINALIZADO' => 'Reparacion terminada',
    'ENTREGADO'  => 'Vehiculo entregado al cliente',
    _            => 'Estado no registrado',
  };

  print(descripcion);

  // Multiples valores con ||

  int codigoServicio = 102;

  String categoria = switch (codigoServicio) {
    101 || 102 || 103 => 'Mantenimiento',
    201 || 202 || 203 => 'Sistema de frenos',
    301 || 302 || 303 => 'Sistema electrico',
    401 || 402 || 403 => 'Llantas y suspension',
    _                 => 'Servicio desconocido',
  };

  print(categoria);

  // Guards con when

  double costoReparacion = 650.0;

  String mensaje = switch (costoReparacion) {
    double c when c >= 1000 =>
      'Servicio premium',

    double c when c >= 500 =>
      'Servicio mayor',

    double c when c >= 100 =>
      'Servicio basico',

    _ =>
      'Revision rapida',
  };

  print(mensaje);
}