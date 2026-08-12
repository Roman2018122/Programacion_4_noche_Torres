import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/vehiculo_taller_mp.dart';
import '../providers/vehiculos_provider_mp.dart';

class PantallaVehiculosMp extends ConsumerWidget {
  const PantallaVehiculosMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiculos = ref.watch(vehiculosProviderMp);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehículos (${vehiculos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: vehiculos.isEmpty
          ? const Center(child: Text('Sin vehículos'))
          : ListView.separated(
              itemCount: vehiculos.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final vehiculo = vehiculos[i];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: vehiculo.activo
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(
                      Icons.directions_car,
                      color: vehiculo.activo ? Colors.green : Colors.grey,
                    ),
                  ),
                  title: Text(
                    vehiculo.placa,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${vehiculo.marca} ${vehiculo.modelo} · ${vehiculo.anio}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          vehiculo.favorito ? Icons.star : Icons.star_border,
                          color: vehiculo.favorito ? Colors.amber : null,
                        ),
                        onPressed: () {
                          ref
                              .read(vehiculosProviderMp.notifier)
                              .toggleFavorito(vehiculo.id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          ref
                              .read(vehiculosProviderMp.notifier)
                              .eliminar(vehiculo.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();

          ref
              .read(vehiculosProviderMp.notifier)
              .agregar(
                VehiculoTallerMp(
                  id: id,
                  placa: 'GUA-${vehiculos.length + 1000}',
                  marca: 'Toyota',
                  modelo: 'Corolla',
                  anio: 2020 + vehiculos.length,
                  activo: true,
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
