import 'package:flutter/material.dart';

class PantallaMetricasMp extends StatelessWidget {
  const PantallaMetricasMp({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.car_repair, size: 56),
          SizedBox(height: 8),
          Text('Métricas del taller', style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
  );
}
