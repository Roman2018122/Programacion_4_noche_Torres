class VehiculoTallerMp {
  final String id;
  final String placa;
  final String marca;
  final String modelo;
  final int anio;
  final String cliente;
  final String combustible;
  final bool activo;
  bool favorito;

  VehiculoTallerMp({
    required this.id,
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.cliente,
    required this.combustible,
    required this.activo,
    this.favorito = false,
  });
}
