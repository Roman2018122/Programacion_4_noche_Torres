import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/vehiculo_taller_mp.dart';
import '../providers/auth_provider_mp.dart';

class PantallaVehiculosMp extends ConsumerWidget {
  const PantallaVehiculosMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProviderMp);
    final usuario = auth is AutenticadoMp ? auth.usuario : '';
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vehículos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Hola, $usuario', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: vehiculosSimuladosMp.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, i) {
          final vehiculo = vehiculosSimuladosMp[i];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: vehiculo.activo
                  ? Colors.green.shade50
                  : Colors.grey.shade100,
              child: Icon(
                Icons.directions_car,
                color: vehiculo.activo ? Colors.green.shade700 : Colors.grey,
              ),
            ),
            title: Text(
              vehiculo.placa,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('${vehiculo.marca} - ${vehiculo.anio}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push('/vehiculos/${vehiculo.id}', extra: vehiculo);
            },
          );
        },
      ),
    );
  }
}
