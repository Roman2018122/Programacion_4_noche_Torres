import 'package:flutter/material.dart';

class AvatarBadgeMp extends StatelessWidget {
  final String nombre;
  final int alertas;
  final bool activo;
  final String detalle;

  const AvatarBadgeMp({
    super.key,
    required this.nombre,
    required this.alertas,
    required this.activo,
    required this.detalle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Tarjeta del vehículo
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: activo ? Colors.blue.shade100 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              Icons.directions_car,
              color: activo ? Colors.blue.shade800 : Colors.grey,
              size: 30,
            ),
          ),
        ),

        // Estado del vehículo
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: activo ? Colors.green : Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),

        // Badge de servicios pendientes
        if (alertas > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                alertas > 9 ? '9+' : '$alertas',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
