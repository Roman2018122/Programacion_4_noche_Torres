import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/vehiculo_taller_mp.dart';

class PantallaDetalleVehiculoMp extends StatelessWidget {
  final String id;
  final VehiculoTallerMp? vehiculo;

  const PantallaDetalleVehiculoMp({super.key, required this.id, this.vehiculo});

  @override
  Widget build(BuildContext context) {
    final veh =
        vehiculo ?? vehiculosSimuladosMp.where((v) => v.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle: ${veh?.placa ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: veh == null
          ? Center(child: Text('Vehículo $id no encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FilaMp('ID', veh.id),
                  _FilaMp('Placa', veh.placa),
                  _FilaMp('Marca', veh.marca),
                  _FilaMp('Año', veh.anio.toString()),
                  _FilaMp(
                    'Estado',
                    veh.activo ? 'En el taller' : 'Fuera del taller',
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Volver'),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () {
                          context.push('/vehiculos/${veh.id}/historial');
                        },
                        icon: const Icon(Icons.history),
                        label: const Text('Ver historial'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class _FilaMp extends StatelessWidget {
  final String label;
  final String valor;

  const _FilaMp(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              label,
              style: TextStyle(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          Text(valor, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
