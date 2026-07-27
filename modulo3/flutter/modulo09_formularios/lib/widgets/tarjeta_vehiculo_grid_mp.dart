import 'package:flutter/material.dart';
import '../models/vehiculo_taller_mp.dart';

class TarjetaVehiculoGridMp extends StatelessWidget {
  final VehiculoTallerMp vehiculo;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaVehiculoGridMp({
    super.key,
    required this.vehiculo,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.directions_car,
                  color: vehiculo.activo ? cs.primary : cs.outline,
                  size: 18,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onFavorito,
                  child: Icon(
                    vehiculo.favorito ? Icons.star : Icons.star_border,
                    color: vehiculo.favorito ? Colors.amber : cs.outline,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              vehiculo.placa,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${vehiculo.marca} ${vehiculo.modelo}',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const Spacer(),
            Row(
              children: [
                if (vehiculo.activo)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(Icons.build, size: 12, color: cs.primary),
                  ),
                Expanded(
                  child: Text(
                    vehiculo.cliente,
                    style: text.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: onEliminar,
                  child: Icon(Icons.delete_outline, size: 16, color: cs.error),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
