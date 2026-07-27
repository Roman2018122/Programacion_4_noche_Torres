import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider_mp.dart';

class PantallaLoginMp extends ConsumerStatefulWidget {
  const PantallaLoginMp({super.key});

  @override
  ConsumerState<PantallaLoginMp> createState() => _PantallaLoginMpState();
}

class _PantallaLoginMpState extends ConsumerState<PantallaLoginMp> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlUser = TextEditingController();
  final _ctrlPass = TextEditingController();

  @override
  void dispose() {
    _ctrlUser.dispose();
    _ctrlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProviderMp);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.car_repair, size: 64, color: cs.primary),
                const SizedBox(height: 16),
                const Text(
                  'Taller Mecánico',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                TextFormField(
                  controller: _ctrlUser,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    return v == null || v.isEmpty ? 'Requerido' : null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _ctrlPass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    return v == null || v.isEmpty ? 'Requerida' : null;
                  },
                ),
                const SizedBox(height: 8),

                if (authState is ErrorAuthMp)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      authState.mensaje,
                      style: TextStyle(color: cs.error),
                    ),
                  ),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: authState is CargandoMp
                        ? null
                        : () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            ref
                                .read(authProviderMp.notifier)
                                .login(_ctrlUser.text, _ctrlPass.text);
                          },
                    child: authState is CargandoMp
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Iniciar sesión'),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pista: recepcion / taller123',
                  style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
