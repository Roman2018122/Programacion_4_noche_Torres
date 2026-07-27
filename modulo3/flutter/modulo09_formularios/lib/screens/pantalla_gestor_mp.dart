import 'package:flutter/material.dart';
import '../models/vehiculo_taller_mp.dart';
import '../widgets/formulario_vehiculo_mp.dart';
import '../widgets/tarjeta_vehiculo_grid_mp.dart';
import '../widgets/fila_vehiculo_mp.dart';

class PantallaGestorMp extends StatefulWidget {
  const PantallaGestorMp({super.key});

  @override
  State<PantallaGestorMp> createState() => _PantallaGestorMpState();
}

class _PantallaGestorMpState extends State<PantallaGestorMp> {
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
  bool _mostrarForm = false;
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

  void _agregarVehiculo(Map<String, String> datos) {
    setState(() {
      _vehiculos.add(
        VehiculoTallerMp(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          placa: datos['placa']!,
          marca: datos['marca']!,
          modelo: datos['modelo']!,
          anio: int.parse(datos['anio']!),
          cliente: datos['cliente']!,
          combustible: datos['combustible']!,
          activo: datos['activo'] == 'true',
        ),
      );

      _mostrarForm = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vehículo "${datos['placa']}" agregado'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _confirmarEliminar(VehiculoTallerMp vehiculo) async {
    final confirma = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber, color: Colors.orange),
        title: const Text('Eliminar vehículo'),
        content: Text(
          '¿Eliminar "${vehiculo.marca} ${vehiculo.modelo}" '
          '(${vehiculo.placa})?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirma == true) {
      setState(() {
        _vehiculos.removeWhere((item) => item.id == vehiculo.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title: _mostrarForm
            ? const Text('Nuevo vehículo')
            : Text('Vehículos del taller (${_vehiculos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: _mostrarForm
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _mostrarForm = false;
                  });
                },
              )
            : null,
        actions: _mostrarForm
            ? []
            : [
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
      body: _mostrarForm
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: FormularioVehiculoMp(onGuardar: _agregarVehiculo),
            )
          : Column(
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
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: cs.onSurfaceVariant),
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
                          itemBuilder: (ctx, i) => TarjetaVehiculoGridMp(
                            vehiculo: filtrados[i],
                            onFavorito: () {
                              setState(() {
                                filtrados[i].favorito = !filtrados[i].favorito;
                              });
                            },
                            onEliminar: () {
                              _confirmarEliminar(filtrados[i]);
                            },
                          ),
                        )
                      : ListView.separated(
                          itemCount: filtrados.length,
                          separatorBuilder: (_, _) =>
                              const Divider(height: 1, indent: 72),
                          itemBuilder: (ctx, i) => FilaVehiculoMp(
                            vehiculo: filtrados[i],
                            onFavorito: () {
                              setState(() {
                                filtrados[i].favorito = !filtrados[i].favorito;
                              });
                            },
                            onEliminar: () {
                              _confirmarEliminar(filtrados[i]);
                            },
                          ),
                        ),
                ),
              ],
            ),
      floatingActionButton: _mostrarForm
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _mostrarForm = true;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Nuevo vehículo'),
            ),
    );
  }
}
