// lib/main.dart
import 'package:flutter/material.dart';
//import 'widgets/tarjeta_log.dart';
import 'widgets/tarjeta_log_mp.dart';
//import 'widgets/fila_estado.dart';
import 'widgets/fila_estado_mp.dart';
//import 'widgets/avatar_badge.dart';
import 'widgets/avatar_badge_mp.dart';

import 'widgets/sizedbox_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaLog                                 │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado                │
// │  4  Paso 4  Stack + Positioned — AvatarBadge                   │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 2;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => _paso1(),
      2 => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              TarjetaLogMp(
                nivel: 'URGENTE',
                componente: 'Recepción',
                mensaje: 'Vehículo ingresó con falla en el sistema de frenos.',
                timestamp: DateTime.now(),
              ),

              TarjetaLogMp(
                nivel: 'PROCESO',
                componente: 'Mecánica',
                mensaje: 'Cambio de aceite y filtros en ejecución.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
              ),

              TarjetaLogMp(
                nivel: 'FINALIZADO',
                componente: 'Electricidad',
                mensaje: 'Diagnóstico electrónico completado correctamente.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
              ),

              TarjetaLogMp(
                nivel: 'RECIBIDO',
                componente: 'Recepción',
                mensaje: 'Nuevo vehículo registrado para mantenimiento.',
                timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
              ),
            ],
          ),
        ),
      ),
      3 => Scaffold(
        body: SafeArea(
          child: ListView(
            children: const [
              FilaEstadoMp(
                nombre: 'Toyota Corolla',
                detalle: 'ABC-123 · Cambio de aceite',
                activo: true,
              ),
              Divider(height: 1),

              FilaEstadoMp(
                nombre: 'Chevrolet Aveo',
                detalle: 'XYZ-456 · Revisión de frenos',
                activo: true,
              ),
              Divider(height: 1),

              FilaEstadoMp(
                nombre: 'Kia Rio',
                detalle: 'PQR-789 · Esperando repuestos',
                activo: false,
              ),
              Divider(height: 1),

              FilaEstadoMp(
                nombre: 'Mazda 3 Grand Touring Full Equipo',
                detalle: 'DEF-321 · Diagnóstico electrónico',
                activo: true,
              ),
            ],
          ),
        ),
      ),
      4 => const Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarBadgeMp(
                nombre: 'ABC-123',
                alertas: 2,
                activo: true,
                detalle: 'Toyota Corolla',
              ),
              SizedBox(width: 24),

              AvatarBadgeMp(
                nombre: 'XYZ-456',
                alertas: 0,
                activo: true,
                detalle: 'Chevrolet Aveo',
              ),
              SizedBox(width: 24),

              AvatarBadgeMp(
                nombre: 'PQR-789',
                alertas: 1,
                activo: false,
                detalle: 'Kia Rio',
              ),
              SizedBox(width: 24),

              AvatarBadgeMp(
                nombre: 'DEF-321',
                alertas: 11,
                activo: true,
                detalle: 'Mazda 3',
              ),
            ],
          ),
        ),
      ),
      5 => const SizedboxMp(height: 0, width: 0),
      _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero')),
      ),
    },
  ),
);

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(40),
        border: Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'Servidor web-01',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
);
