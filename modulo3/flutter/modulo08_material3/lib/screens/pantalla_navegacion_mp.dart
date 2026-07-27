import 'package:flutter/material.dart';

class PantallaNavegacionMp extends StatefulWidget {
  const PantallaNavegacionMp({super.key});

  @override
  State<PantallaNavegacionMp> createState() => _PantallaNavegacionMpState();
}

class _PantallaNavegacionMpState extends State<PantallaNavegacionMp> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema del Taller'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboardMp(),
          _PantallaVehiculosMp(),
          _PantallaAlertasMp(),
          _PantallaAjustesMp(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Resumen',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_car_outlined),
            selectedIcon: Icon(Icons.directions_car),
            label: 'Vehículos',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined),
            ),
            selectedIcon: Badge(
              label: Text('3'),
              child: Icon(Icons.notifications),
            ),
            label: 'Alertas',
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

// ─── Pantallas de cada pestaña ───────────────────────────────────────

class _PantallaDashboardMp extends StatelessWidget {
  const _PantallaDashboardMp();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen del taller', style: text.headlineSmall),
        const SizedBox(height: 16),

        // Tarjetas de métricas
        Row(
          children: [
            Expanded(
              child: _TarjetaMetricaMp(
                titulo: 'Vehículos',
                valor: '8',
                icono: Icons.directions_car,
                color: cs.primaryContainer,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _TarjetaMetricaMp(
                titulo: 'Alertas',
                valor: '3',
                icono: Icons.notifications,
                color: cs.errorContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _TarjetaMetricaMp(
                titulo: 'Órdenes listas',
                valor: '5',
                icono: Icons.check_circle,
                color: cs.tertiaryContainer,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _TarjetaMetricaMp(
                titulo: 'En reparación',
                valor: '4',
                icono: Icons.car_repair,
                color: cs.secondaryContainer,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TarjetaMetricaMp extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color color;

  const _TarjetaMetricaMp({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(
              valor,
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaVehiculosMp extends StatelessWidget {
  const _PantallaVehiculosMp();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading: Icon(Icons.directions_car, color: cs.primary),
          title: Text('Vehículo ${i + 1}'),
          subtitle: Text('GUA-${1000 + i} · En reparación'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaAlertasMp extends StatelessWidget {
  const _PantallaAlertasMp();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      (
        vehiculo: 'Toyota Corolla',
        mensaje: 'Falla crítica en el sistema de frenos',
        nivel: 'CRÍTICO',
      ),
      (
        vehiculo: 'Chevrolet Aveo',
        mensaje: 'Cambio de aceite pendiente',
        nivel: 'AVISO',
      ),
      (
        vehiculo: 'Kia Rio',
        mensaje: 'Temperatura del motor elevada',
        nivel: 'CRÍTICO',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esCritico = alerta.nivel == 'CRÍTICO';

        return Card(
          color: esCritico ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esCritico ? Icons.error : Icons.warning,
              color: esCritico ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(
              alerta.vehiculo,
              style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(alerta.mensaje),
            trailing: Chip(
              label: Text(alerta.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCritico ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esCritico ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustesMp extends StatelessWidget {
  const _PantallaAjustesMp();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title: Text('Notificaciones del taller'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title: Text('Seguridad'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('Acerca del taller'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
