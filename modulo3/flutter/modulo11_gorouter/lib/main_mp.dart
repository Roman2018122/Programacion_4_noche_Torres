import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router_mp.dart';

void main() {
  runApp(const ProviderScope(child: AppTallerMp()));
}

class AppTallerMp extends ConsumerWidget {
  const AppTallerMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterMpProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Taller Mecánico',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
