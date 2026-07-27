import 'package:flutter/material.dart';

class PantallaContextoMp extends StatelessWidget {
  const PantallaContextoMp({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Tema del taller ──────────────────────────────────────────
    final tema = Theme.of(context);
    final colores = tema.colorScheme;

    // ── Pantalla del dispositivo ─────────────────────────────────
    final tamanio = MediaQuery.sizeOf(context);
    final esMovil = tamanio.width < 600;
    final esRetrato = MediaQuery.orientationOf(context) == Orientation.portrait;
    final paddingSuperior = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: colores.surface,
      appBar: AppBar(
        backgroundColor: colores.primaryContainer,
        foregroundColor: colores.onPrimaryContainer,
        title: Text(
          'Panel del taller · ${esMovil ? "móvil" : "tablet"} · ${esRetrato ? "retrato" : "paisaje"}',
          style: tema.textTheme.titleMedium,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Información del dispositivo ────────────────────────
          _SeccionTaller(
            titulo: 'Dispositivo del taller',
            items: [
              'Ancho: ${tamanio.width.toStringAsFixed(0)} px',
              'Alto: ${tamanio.height.toStringAsFixed(0)} px',
              'Pixel ratio: ${MediaQuery.devicePixelRatioOf(context).toStringAsFixed(1)}',
              'Orientación: ${MediaQuery.orientationOf(context).name}',
              'Padding superior: ${paddingSuperior.toStringAsFixed(0)} px',
              'Tipo de dispositivo: ${esMovil ? "Teléfono del mecánico" : "Tablet de recepción"}',
            ],
          ),
          const SizedBox(height: 16),

          // ── Colores del taller ─────────────────────────────────
          const _SeccionTaller(titulo: 'Colores del sistema', items: []),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ChipColorTaller(nombre: 'Órdenes', color: colores.primary),
              _ChipColorTaller(
                nombre: 'Recepción',
                color: colores.primaryContainer,
              ),
              _ChipColorTaller(nombre: 'Servicios', color: colores.secondary),
              _ChipColorTaller(nombre: 'Fondo', color: colores.surface),
              _ChipColorTaller(nombre: 'Urgente', color: colores.error),
            ],
          ),
          const SizedBox(height: 16),

          // ── Tipografía del taller ──────────────────────────────
          const _SeccionTaller(titulo: 'Tipografía del sistema', items: []),
          Text('Taller Mecánico Torres', style: tema.textTheme.displaySmall),
          Text('Órdenes de trabajo', style: tema.textTheme.headlineMedium),
          Text('Vehículo en reparación', style: tema.textTheme.titleLarge),
          Text(
            'Cambio de aceite y revisión general',
            style: tema.textTheme.bodyLarge,
          ),
          Text('Cliente: Carlos Mendoza', style: tema.textTheme.bodyMedium),
          Text('Estado: En reparación', style: tema.textTheme.labelSmall),
        ],
      ),
    );
  }
}

// ── Widgets auxiliares privados ─────────────────────────────────────

class _SeccionTaller extends StatelessWidget {
  final String titulo;
  final List<String> items;

  const _SeccionTaller({required this.titulo, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(item, style: Theme.of(context).textTheme.bodyMedium),
          ),
      ],
    );
  }
}

class _ChipColorTaller extends StatelessWidget {
  final String nombre;
  final Color color;

  const _ChipColorTaller({required this.nombre, required this.color});

  @override
  Widget build(BuildContext context) {
    final luminancia = color.computeLuminance();
    final textoColor = luminancia > 0.4 ? Colors.black87 : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        nombre,
        style: TextStyle(
          color: textoColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
