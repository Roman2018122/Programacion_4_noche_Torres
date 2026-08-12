// lib/main.dart
import 'package:flutter/material.dart';
//import 'widgets/catalogo_basicos.dart';
import 'widgets/catalogo_basicos_mp.dart';
//import 'widgets/etiqueta.dart';
import 'widgets/etiqueta_mp.dart';
import 'widgets/pantalla_contexto_mp.dart';
//import 'widgets/servicio_estado.dart';
import 'widgets/servicio_estado_mp.dart';
//import 'widgets/contador_limitado.dart';
import 'widgets/contador_limitado_mp.dart';
//import 'widgets/reloj.dart';
import 'widgets/reloj_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 4;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => const Scaffold(body: Center(child: Saludo())),

      2 => const CatalogoBasicosMp(),

      3 => const Scaffold(
        body: Center(
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              EtiquetaMp(texto: 'Vehículo listo', color: Colors.green),
              EtiquetaMp(
                texto: 'En reparación',
                color: Colors.red,
                relleno: true,
              ),
              EtiquetaMp(texto: 'Esperando repuestos', color: Colors.orange),
              EtiquetaMp(
                texto: 'Diagnóstico urgente',
                color: Colors.red,
                fontSize: 16,
                relleno: true,
              ),
              EtiquetaMp(
                texto: 'Mantenimiento',
                color: Colors.blue,
                fontSize: 11,
              ),
            ],
          ),
        ),
      ),

      4 => Scaffold(
        appBar: AppBar(title: const Text('Estado de reparación')),
        body: const Center(
          child: ServicioEstadoMp(nombre: 'Chevrolet Aveo · GUA-1234'),
        ),
      ),

      5 => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContadorLimitadoMp(
                etiqueta: 'Intentos de login',
                limite: 3,
                color: Colors.red,
                onLimite: () => debugPrint('¡Cuenta bloqueada!'),
              ),
              const SizedBox(height: 40),
              ContadorLimitadoMp(
                etiqueta: 'Conexiones activas',
                limite: 10,
                color: Colors.indigo,
              ),
            ],
          ),
        ),
      ),

      6 => Scaffold(
        appBar: AppBar(title: const Text('Cronómetro del servicio')),
        body: const Center(child: RelojMp()),
      ),
      7 => const PantallaContextoMp(),

      int() => throw UnimplementedError(),
    },
  ),
);

class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) =>
      const Text('Hola Flutter', style: TextStyle(fontSize: 32));
}
