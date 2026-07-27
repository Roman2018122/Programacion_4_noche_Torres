import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/vehiculo_taller_mp.dart';
import '../providers/auth_provider_mp.dart';

import '../screens/pantalla_ajustes_mp.dart';
import '../screens/pantalla_detalle_vehiculo_mp.dart';
import '../screens/pantalla_inicio_mp.dart';
import '../screens/pantalla_login_mp.dart';
import '../screens/pantalla_metricas_mp.dart';
import '../screens/pantalla_vehiculos_filtro_mp.dart';
import '../screens/scaffold_con_nav_mp.dart';

final appRouterMpProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProviderMp);

  return GoRouter(
    initialLocation: '/login',
    redirect: (BuildContext context, GoRouterState state) {
      final autenticado = authState is AutenticadoMp;
      final estaEnLogin = state.matchedLocation == '/login';

      if (!autenticado && !estaEnLogin) {
        return '/login';
      }

      if (autenticado && estaEnLogin) {
        return '/vehiculos';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const PantallaLoginMp();
        },
      ),
      GoRoute(
        path: '/inicio',
        builder: (context, state) {
          return const PantallaInicioMp();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldConNavMp(child: child);
        },
        routes: [
          GoRoute(
            path: '/vehiculos',
            builder: (context, state) {
              final soloActivos =
                  state.uri.queryParameters['soloActivos'] == 'true';

              return PantallaVehiculosFiltroMp(soloActivos: soloActivos);
            },
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  final vehiculo = state.extra as VehiculoTallerMp?;

                  return PantallaDetalleVehiculoMp(id: id, vehiculo: vehiculo);
                },
              ),
              GoRoute(
                path: ':id/historial',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;

                  return Scaffold(
                    appBar: AppBar(title: const Text('Historial del vehículo')),
                    body: Center(child: Text('Historial del vehículo $id')),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/metricas',
            builder: (context, state) {
              return const PantallaMetricasMp();
            },
          ),
          GoRoute(
            path: '/ajustes',
            builder: (context, state) {
              return const PantallaAjustesMp();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ruta no encontrada')),
        body: Center(child: Text('No existe la ruta: ${state.uri}')),
      );
    },
  );
});
