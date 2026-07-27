import 'package:flutter/material.dart';

class CatalogoBotonesMp extends StatelessWidget {
  const CatalogoBotonesMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acciones del taller'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Los 5 variantes ──────────────────────────────────────
          Text(
            'Variantes — de mayor a menor énfasis',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {},
            child: const Text('Registrar orden de trabajo'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Actualizar diagnóstico'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Asignar mecánico'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Consultar vehículo'),
          ),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('Ver detalles')),

          const Divider(height: 32),

          // ── Con ícono ────────────────────────────────────────────
          Text(
            'Con ícono',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('Enviar cotización'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Descargar orden'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.car_repair),
            label: const Text('Ver historial del vehículo'),
          ),

          const Divider(height: 32),

          // ── Estados y personalización ────────────────────────────
          Text(
            'Estados y personalización',
            style: text.labelLarge?.copyWith(color: cs.primary),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: null, // null = deshabilitado
            child: const Text('Servicio no disponible'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {},
            child: const Text('Cancelar orden de trabajo'),
          ),
          const SizedBox(height: 8),

          // Fila de botones compactos
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Pausar'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Finalizar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
