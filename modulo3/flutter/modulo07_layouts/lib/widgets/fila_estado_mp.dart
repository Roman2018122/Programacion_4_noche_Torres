import 'package:flutter/material.dart';

class FilaEstadoMp extends StatelessWidget {
  final String nombre;
  final String detalle;
  final bool activo;

  const FilaEstadoMp({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.activo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Estado del vehículo
          Icon(
            activo ? Icons.car_repair : Icons.car_crash,
            color: activo ? Colors.green : Colors.red,
            size: 20,
          ),

          const SizedBox(width: 12),

          // Expanded — ocupa el espacio restante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nombre,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  detalle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Estado del servicio
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (activo ? Colors.green : Colors.red).withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              activo ? 'En reparación' : 'Pendiente',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: activo ? Colors.green.shade700 : Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
