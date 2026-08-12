import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PantallaInicioMp extends StatelessWidget {
  const PantallaInicioMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Taller Mecánico'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.car_repair, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            const Text(
              'Panel del Taller',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Gestiona los vehículos del taller',
              style: TextStyle(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/vehiculos'),
              icon: const Icon(Icons.directions_car),
              label: const Text('Ver vehículos'),
            ),
          ],
        ),
      ),
    );
  }
}
