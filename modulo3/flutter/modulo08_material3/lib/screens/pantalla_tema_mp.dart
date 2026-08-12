import 'package:flutter/material.dart';

class PantallaTemaMp extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode) onToggle;

  const PantallaTemaMp({
    super.key,
    required this.themeMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema del taller'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        children: [
          // ── Sección: Selección de tema ────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Apariencia del sistema',
              style: text.labelLarge?.copyWith(color: cs.primary),
            ),
          ),
          ...[
            (
              label: 'Sistema',
              mode: ThemeMode.system,
              icon: Icons.brightness_auto,
            ),
            (label: 'Claro', mode: ThemeMode.light, icon: Icons.light_mode),
            (label: 'Oscuro', mode: ThemeMode.dark, icon: Icons.dark_mode),
          ].map(
            (opcion) => RadioListTile<ThemeMode>(
              title: Text(opcion.label),
              secondary: Icon(opcion.icon),
              value: opcion.mode,
              groupValue: themeMode,
              onChanged: (v) => onToggle(v!),
            ),
          ),

          const Divider(),

          // ── Sección: Vista previa de la paleta activa ─────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vista previa del taller',
                      style: text.labelLarge?.copyWith(color: cs.primary),
                    ),
                    const SizedBox(height: 12),

                    // Paleta activa
                    Row(
                      children: [
                        _CirculoPreviewMp(color: cs.primary, label: 'P'),
                        _CirculoPreviewMp(color: cs.secondary, label: 'S'),
                        _CirculoPreviewMp(color: cs.tertiary, label: 'T'),
                        _CirculoPreviewMp(color: cs.error, label: 'E'),
                        _CirculoPreviewMp(
                          color: cs.surfaceContainerHighest,
                          label: 'Sf',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Ejemplo de componentes con el tema actual
                    Row(
                      children: [
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.car_repair, size: 16),
                          label: const Text('Reparar'),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Historial'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CirculoPreviewMp extends StatelessWidget {
  final Color color;
  final String label;

  const _CirculoPreviewMp({required this.color, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: CircleAvatar(
      radius: 16,
      backgroundColor: color,
      child: Text(
        label,
        style: TextStyle(
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
