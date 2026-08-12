import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider_mp.dart';

class PantallaAjustesMp extends ConsumerWidget {
  const PantallaAjustesMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProviderMp);
    final usuario = auth is AutenticadoMp ? auth.usuario : '—';

    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes del taller')),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(usuario),
            subtitle: const Text('Recepcionista del taller'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              ref.read(authProviderMp.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}
