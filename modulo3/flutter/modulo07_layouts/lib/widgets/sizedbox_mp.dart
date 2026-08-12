import 'package:flutter/material.dart';

class SizedboxMp extends StatelessWidget {
  final double height;
  final double width;

  const SizedboxMp({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // SizedBox
            const Text(
              'SizedBox',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Recepción del vehículo'),

            const SizedBox(height: 32),

            const Text('Inicio del diagnóstico'),

            const Divider(height: 32),

            // Padding
            const Text(
              'Padding',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Container(
              color: Colors.blue.shade50,
              child: const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Vehículo ingresado al taller'),
              ),
            ),

            const Divider(height: 32),

            // Align
            const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),

            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.car_repair, color: Colors.blue),
            ),

            const Divider(height: 32),

            // Wrap
            const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Cambio de aceite',
                'Frenos',
                'Suspensión',
                'Motor',
                'Diagnóstico',
                'Alineación',
                'Balanceo',
              ].map((t) => Chip(label: Text(t))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
