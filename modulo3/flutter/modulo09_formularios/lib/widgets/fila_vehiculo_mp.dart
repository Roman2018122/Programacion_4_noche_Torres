import 'package:flutter/material.dart';
import '../models/vehiculo_taller_mp.dart';

class FilaVehiculoMp extends StatelessWidget {
  final VehiculoTallerMp vehiculo;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaVehiculoMp({
    super.key,
    required this.vehiculo,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: vehiculo.activo
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.directions_car,
          color: vehiculo.activo ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        '${vehiculo.marca} ${vehiculo.modelo}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${vehiculo.placa} • ${vehiculo.cliente}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              vehiculo.favorito ? Icons.star : Icons.star_border,
              color: vehiculo.favorito ? Colors.amber : cs.outline,
            ),
            onPressed: onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip: vehiculo.favorito
                ? 'Quitar favorito'
                : 'Agregar a favoritos',
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: cs.error),
            onPressed: onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip: 'Eliminar vehículo',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
