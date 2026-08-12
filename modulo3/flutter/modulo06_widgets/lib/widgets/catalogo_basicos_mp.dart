import 'package:flutter/material.dart';

class CatalogoBasicosMp extends StatelessWidget {
  const CatalogoBasicosMp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo del taller mecánico')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ─────────────────────────────────────────────
          Text(
            'Elevador hidráulico: Disponible',
            style: TextStyle(
              shadows: const [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.combine([
                TextDecoration.underline,
                TextDecoration.lineThrough,
              ]),
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ─────────────────────────────
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Vehículo Chevrolet Aveo con placa GUA-1234 pendiente de diagnóstico general y revisión completa del sistema de frenos',
              softWrap: false,
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich ────────────────────────────────────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado de la orden: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'URGENTE',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — revisión registrada hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText ───────────────────────────────────────────
          const SelectableText(
            'Orden de trabajo: OT-2026-000001',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // ── Iconos ───────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Tooltip(
                message: 'Vehículo reparado',
                child: Icon(
                  Icons.check_circle,
                  size: 24,
                  color: Colors.green,
                  semanticLabel: 'Reparado',
                ),
              ),
              Icon(
                Icons.car_repair,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Icon(Icons.cancel, size: 40, color: Colors.red),
              const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              const Icon(Icons.build, size: 40, color: Colors.indigo),
              const Icon(Icons.car_crash, size: 80, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),

          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración del servicio',
          ),
          const Divider(height: 32),

          // ── Cuatro variantes de botones ──────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Registrar vehículo'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Crear orden')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Ver servicios'),
              ),
              TextButton(onPressed: () {}, child: const Text('Ver cliente')),
              ElevatedButton(
                onPressed: null,
                child: const Text('Servicio no disponible'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes con iconos ─────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar orden'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener servicio'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info_outline, size: 18),
                label: const Text('Información'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Abrir historial'),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Configurar orden de trabajo',
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ───────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            child: const Text(
              'Cancelar orden de trabajo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 12,
            ),
            child: const Text(
              'Eliminar registro del vehículo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          // ── ListTile dentro de Card ──────────────────────────────────
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              isThreeLine: true,
              leading: const Icon(Icons.car_repair, color: Colors.indigo),
              title: const Text('Chevrolet Aveo · GUA-1234'),
              subtitle: const Text('Cambio de aceite y revisión de frenos'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {},
            ),
          ),

          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.car_crash, color: Colors.red, size: 20),
              ),
              title: const Text('Toyota Corolla · PBA-5678'),
              subtitle: const Text('Vehículo detenido · falla del motor'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),

          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Vehículo en mantenimiento'),
            ),
          ),

          const Divider(height: 32),

          // ── Chips ─────────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('Cambio de aceite')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Diagnóstico aprobado'),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Servicio urgente'),
                selected: false,
                onSelected: (_) {},
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
              ),
              ActionChip(
                label: const Text('Ver historial'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
                padding: const EdgeInsets.all(8),
                backgroundColor: Colors.green,
              ),
            ],
          ),

          const Divider(height: 32),

          // ── Indicadores circulares ───────────────────────────────────
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.7,
                  color: Colors.green,
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Indicadores lineales ─────────────────────────────────────
          const Text(
            'Progreso de la reparación',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          const LinearProgressIndicator(),
          const SizedBox(height: 8),

          const LinearProgressIndicator(value: 0.6, color: Colors.indigo),
          const SizedBox(height: 8),

          const LinearProgressIndicator(
            value: null,
            color: Colors.green,
            minHeight: 6,
          ),

          const Divider(height: 32),
        ],
      ),
    );
  }
}
