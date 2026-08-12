import 'package:flutter/material.dart';
import '../models/vehiculo_taller_mp.dart';
import '../widgets/fila_vehiculo_mp.dart';

class PantallaServidoresMp extends StatefulWidget {
  const PantallaServidoresMp({super.key});

  @override
  State<PantallaServidoresMp> createState() => _PantallaServidoresMpState();
}

class _PantallaServidoresMpState extends State<PantallaServidoresMp> {
  final _vehiculos = [
    VehiculoTallerMp(
      id: '1',
      placa: 'GUA-1234',
      marca: 'Toyota',
      modelo: 'Corolla',
      anio: 2020,
      cliente: 'Carlos Mendoza',
      combustible: 'Gasolina',
      activo: true,
      favorito: true,
    ),
    VehiculoTallerMp(
      id: '2',
      placa: 'GSA-5678',
      marca: 'Chevrolet',
      modelo: 'Aveo',
      anio: 2018,
      cliente: 'Ana Torres',
      combustible: 'Gasolina',
      activo: true,
    ),
    VehiculoTallerMp(
      id: '3',
      placa: 'GBA-9012',
      marca: 'Kia',
      modelo: 'Rio',
      anio: 2021,
      cliente: 'Luis Zambrano',
      combustible: 'Gasolina',
      activo: false,
    ),
    VehiculoTallerMp(
      id: '4',
      placa: 'PCA-3456',
      marca: 'Mazda',
      modelo: '3',
      anio: 2019,
      cliente: 'María López',
      combustible: 'Diésel',
      activo: false,
    ),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) {
    setState(() {
      _vehiculos[i].favorito = !_vehiculos[i].favorito;
    });
  }

  void _eliminar(int i) {
    setState(() {
      _vehiculos.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehículos (${_vehiculos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _modoGrid = !_modoGrid;
              });
            },
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _vehiculos.length,
              itemBuilder: (ctx, i) => _TarjetaVehiculoGridMp(
                vehiculo: _vehiculos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _vehiculos.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaVehiculoMp(
                vehiculo: _vehiculos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}

class _FilaVehiculoMp extends StatelessWidget {
  final VehiculoTallerMp vehiculo;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const _FilaVehiculoMp({
    required this.vehiculo,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        child: const Icon(Icons.directions_car),
      ),
      title: Text('${vehiculo.marca} ${vehiculo.modelo}'),
      subtitle: Text('${vehiculo.placa} · ${vehiculo.cliente}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(vehiculo.favorito ? Icons.star : Icons.star_border),
            onPressed: onFavorito,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onEliminar,
          ),
        ],
      ),
    );
  }
}

class _TarjetaVehiculoGridMp extends StatelessWidget {
  final VehiculoTallerMp vehiculo;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const _TarjetaVehiculoGridMp({
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.directions_car, color: cs.primary),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    vehiculo.favorito ? Icons.star : Icons.star_border,
                  ),
                  onPressed: onFavorito,
                ),
              ],
            ),
            Text(
              vehiculo.placa,
              style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('${vehiculo.marca} ${vehiculo.modelo}'),
            Text('Año ${vehiculo.anio}'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    vehiculo.activo ? 'En el taller' : 'Fuera del taller',
                    style: TextStyle(
                      color: vehiculo.activo ? cs.primary : cs.onSurfaceVariant,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onEliminar,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
