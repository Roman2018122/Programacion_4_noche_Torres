// lib/main.dart
import 'package:flutter/material.dart';
//import 'screens/pantalla_tema.dart';
import 'screens/pantalla_tema_mp.dart';
//import 'screens/pantalla_appbar.dart';
import 'screens/pantalla_appbar_mp.dart';
//import 'widgets/catalogo_botones.dart';
import 'widgets/catalogo_botones_mp.dart';
//import 'screens/pantalla_navegacion.dart';
import 'screens/pantalla_navegacion_mp.dart';
//import 'screens/pantalla_dialogs.dart';
import 'screens/pantalla_dialogs_mp.dart';

import 'screens/pantalla_ajustes_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  ThemeData + Scaffold básico                         │
// │  2  Paso 2  Modo oscuro — ThemeMode dinámico                    │
// │  3  Paso 3  AppBar variantes y SliverAppBar                     │
// │  4  Paso 4  Botones Material 3                                  │
// │  5  Paso 5  NavigationBar con 4 pestañas                        │
// │  6  Paso 6  SnackBar y AlertDialog                              │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 2;

void main() => runApp(const AppMonitoreo());

class AppMonitoreo extends StatefulWidget {
  const AppMonitoreo({super.key});
  @override
  State<AppMonitoreo> createState() => _AppMonitoreoState();
}

class _AppMonitoreoState extends State<AppMonitoreo> {
  ThemeMode _themeMode = ThemeMode.system;

  Color _seedColor = const Color(0xFF1565C0);

  final List<({String nombre, Color color})> _paletas = [
    (nombre: 'Azul', color: Color(0xFF1565C0)),
    (nombre: 'Verde', color: Color(0xFF2E7D32)),
    (nombre: 'Naranja', color: Color(0xFFEF6C00)),
    (nombre: 'Rojo', color: Color(0xFFC62828)),
    (nombre: 'Morado', color: Color(0xFF6A1B9A)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTemaMp(
          themeMode: _themeMode,
          onToggle: (mode) => setState(() => _themeMode = mode),
        ),
        3 => const PantallaAppBarMp(),
        4 => const CatalogoBotonesMp(),
        5 => const PantallaNavegacionMp(),
        6 => const PantallaDialogsMp(),
        7 => PantallaAjustesMp(
          themeMode: _themeMode,
          seedColor: _seedColor,
          onThemeMode: (mode) {
            setState(() => _themeMode = mode);
          },
          onSeedColor: (color) {
            setState(() => _seedColor = color);
          },
          paletas: _paletas,
        ),
        _ => Scaffold(
          body: Center(child: Text('Paso $paso: crea el widget primero')),
        ),
      },
    );
  }
}

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Monitoreo'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dns, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Servidor web-01',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '10.0.2.10 · Ubuntu 24.04',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              label: const Text('Conectar SSH'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
