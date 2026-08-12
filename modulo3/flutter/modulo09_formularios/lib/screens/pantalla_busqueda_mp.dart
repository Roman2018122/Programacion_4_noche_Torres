import 'package:flutter/material.dart';
import '../models/vehiculo_taller_mp.dart';

class PantallaBusquedaMp extends StatefulWidget {
  const PantallaBusquedaMp({super.key});

  @override
  State<PantallaBusquedaMp> createState() => _PantallaBusquedaMpState();
}

class _PantallaBusquedaMpState extends State<PantallaBusquedaMp> {
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

  String _busqueda = '';
  bool _modoGrid = false;

  List<VehiculoTallerMp> get _filtrados => _vehiculos
      .where(
        (vehiculo) =>
            vehiculo.placa.toLowerCase().contains(_busqueda.toLowerCase()) ||
            vehiculo.marca.toLowerCase().contains(_busqueda.toLowerCase()) ||
            vehiculo.modelo.toLowerCase().contains(_busqueda.toLowerCase()) ||
            vehiculo.cliente.toLowerCase().contains(_busqueda.toLowerCase()),
      )
      .toList();

  void _toggleFavorito(VehiculoTallerMp vehiculo) {
    setState(() {
      vehiculo.favorito = !vehiculo.favorito;
    });
  }

  void _eliminar(VehiculoTallerMp vehiculo) {
    setState(() {
      _vehiculos.removeWhere((item) => item.id == vehiculo.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por placa, marca, modelo o cliente...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _busqueda = '';
                          });
                        },
                      ),
                    ]
                  : null,
              onChanged: (valor) {
                setState(() {
                  _busqueda = valor;
                });
              },
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} '
                  'resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 56,
                          color: cs.onSurfaceVariant,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _busqueda = '';
                            });
                          },
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                ? GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: filtrados.length,
                    itemBuilder: (context, i) {
                      final vehiculo = filtrados[i];

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
                                      vehiculo.favorito
                                          ? Icons.star
                                          : Icons.star_border,
                                    ),
                                    onPressed: () => _toggleFavorito(vehiculo),
                                  ),
                                ],
                              ),
                              Text(
                                vehiculo.placa,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${vehiculo.marca} '
                                '${vehiculo.modelo}',
                              ),
                              Text('${vehiculo.anio}'),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      vehiculo.activo
                                          ? 'En el taller'
                                          : 'Fuera del taller',
                                      style: TextStyle(
                                        color: vehiculo.activo
                                            ? cs.primary
                                            : cs.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () => _eliminar(vehiculo),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView.separated(
                    itemCount: filtrados.length,
                    separatorBuilder: (_, _) =>
                        const Divider(height: 1, indent: 72),
                    itemBuilder: (context, i) {
                      final vehiculo = filtrados[i];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.directions_car, color: cs.primary),
                        ),
                        title: Text('${vehiculo.marca} ${vehiculo.modelo}'),
                        subtitle: Text(
                          '${vehiculo.placa} · '
                          '${vehiculo.cliente}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                vehiculo.favorito
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              onPressed: () => _toggleFavorito(vehiculo),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => _eliminar(vehiculo),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
