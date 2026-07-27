import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/vehiculo_taller_mp.dart';

class PantallaVehiculosFiltroMp extends StatelessWidget {
  final bool soloActivos;

  const PantallaVehiculosFiltroMp({super.key, this.soloActivos = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloActivos
        ? vehiculosSimuladosMp.where((v) => v.activo).toList()
        : vehiculosSimuladosMp;

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehículos${soloActivos ? ' (Activos)' : ''}'),
        actions: [
          IconButton(
            icon: Icon(soloActivos ? Icons.directions_car : Icons.car_repair),
            tooltip: soloActivos ? 'Ver todos' : 'Solo activos',
            onPressed: () => soloActivos
                ? context.go('/vehiculos')
                : context.go('/vehiculos?soloActivos=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filtrados.length,
        itemBuilder: (context, i) {
          final vehiculo = filtrados[i];

          return ListTile(
            leading: Icon(
              Icons.directions_car,
              color: vehiculo.activo ? Colors.green : Colors.grey,
            ),
            title: Text(vehiculo.placa),
            subtitle: Text(vehiculo.marca),
            onTap: () {
              context.push('/vehiculos/${vehiculo.id}', extra: vehiculo);
            },
          );
        },
      ),
    );
  }
}
