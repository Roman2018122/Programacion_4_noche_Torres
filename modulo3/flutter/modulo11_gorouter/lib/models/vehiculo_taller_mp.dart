class VehiculoTallerMp {
  final String id;
  final String placa;
  final String marca;
  final int anio;
  final bool activo;

  const VehiculoTallerMp({
    required this.id,
    required this.placa,
    required this.marca,
    required this.anio,
    required this.activo,
  });
}

const vehiculosSimuladosMp = [
  VehiculoTallerMp(
    id: '1',
    placa: 'GUA-1234',
    marca: 'Toyota Corolla',
    anio: 2020,
    activo: true,
  ),
  VehiculoTallerMp(
    id: '2',
    placa: 'GSA-5678',
    marca: 'Chevrolet Aveo',
    anio: 2018,
    activo: true,
  ),
  VehiculoTallerMp(
    id: '3',
    placa: 'GBA-9012',
    marca: 'Kia Rio',
    anio: 2021,
    activo: false,
  ),
];
