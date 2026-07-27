import 'package:flutter/material.dart';

class PantallaAppBarMp extends StatelessWidget {
  const PantallaAppBarMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar — colapsa al hacer scroll
          SliverAppBar.large(
            title: const Text('Vehículos en el taller'),
            pinned: true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip: 'Filtrar',
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                tooltip: 'Buscar',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(
                      Icons.car_repair,
                      size: 48,
                      color: cs.onPrimaryContainer,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '8 vehículos en servicio',
                      style: TextStyle(color: cs.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lista de vehículos
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  child: ListTile(
                    leading: Icon(Icons.directions_car, color: cs.primary),
                    title: Text('Vehículo ${i + 1}'),
                    subtitle: Text('GUA-${1000 + i} · En reparación'),
                    trailing: Chip(
                      label: const Text('ACTIVO'),
                      backgroundColor: cs.primaryContainer,
                      labelStyle: TextStyle(color: cs.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
