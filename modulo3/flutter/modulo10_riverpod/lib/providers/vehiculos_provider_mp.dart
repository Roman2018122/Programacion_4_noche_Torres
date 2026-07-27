import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehiculo_taller_mp.dart';

class VehiculosNotifierMp extends Notifier<List<VehiculoTallerMp>> {
  @override
  List<VehiculoTallerMp> build() => [
    VehiculoTallerMp(
      id: '1',
      placa: 'GUA-1234',
      marca: 'Toyota',
      modelo: 'Corolla',
      anio: 2020,
      activo: true,
      favorito: true,
    ),
    VehiculoTallerMp(
      id: '2',
      placa: 'GSA-5678',
      marca: 'Chevrolet',
      modelo: 'Aveo',
      anio: 2018,
      activo: true,
    ),
    VehiculoTallerMp(
      id: '3',
      placa: 'GBA-9012',
      marca: 'Kia',
      modelo: 'Rio',
      anio: 2021,
      activo: false,
    ),
  ];

  void toggleFavorito(String id) {
    state = state
        .map(
          (vehiculo) => vehiculo.id == id
              ? VehiculoTallerMp(
                  id: vehiculo.id,
                  placa: vehiculo.placa,
                  marca: vehiculo.marca,
                  modelo: vehiculo.modelo,
                  anio: vehiculo.anio,
                  activo: vehiculo.activo,
                  favorito: !vehiculo.favorito,
                )
              : vehiculo,
        )
        .toList();
  }

  void eliminar(String id) {
    state = state.where((vehiculo) => vehiculo.id != id).toList();
  }

  void agregar(VehiculoTallerMp vehiculo) {
    state = [...state, vehiculo];
  }
}

final vehiculosProviderMp =
    NotifierProvider<VehiculosNotifierMp, List<VehiculoTallerMp>>(
      VehiculosNotifierMp.new,
    );
