import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldConNavMp extends StatelessWidget {
  final Widget child;

  const ScaffoldConNavMp({super.key, required this.child});

  int _indiceActivo(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;

    if (loc.startsWith('/metricas')) return 1;
    if (loc.startsWith('/ajustes')) return 2;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indiceActivo(context),
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go('/vehiculos');
            case 1:
              context.go('/metricas');
            case 2:
              context.go('/ajustes');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_car_outlined),
            selectedIcon: Icon(Icons.directions_car),
            label: 'Vehículos',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Métricas',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
