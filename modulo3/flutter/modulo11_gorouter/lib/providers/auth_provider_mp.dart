import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class AuthStateMp {
  const AuthStateMp();
}

class SinSesionMp extends AuthStateMp {
  const SinSesionMp();
}

class CargandoMp extends AuthStateMp {
  const CargandoMp();
}

class AutenticadoMp extends AuthStateMp {
  final String usuario;

  const AutenticadoMp(this.usuario);
}

class ErrorAuthMp extends AuthStateMp {
  final String mensaje;

  const ErrorAuthMp(this.mensaje);
}

class AuthNotifierMp extends Notifier<AuthStateMp> {
  @override
  AuthStateMp build() => const SinSesionMp();

  Future<void> login(String usuario, String password) async {
    state = const CargandoMp();

    await Future.delayed(const Duration(seconds: 1));

    if (usuario == 'recepcion' && password == 'taller123') {
      state = AutenticadoMp(usuario);
    } else {
      state = const ErrorAuthMp('Usuario o contraseña incorrectos');

      await Future.delayed(const Duration(seconds: 2));

      state = const SinSesionMp();
    }
  }

  void logout() {
    state = const SinSesionMp();
  }
}

final authProviderMp = NotifierProvider<AuthNotifierMp, AuthStateMp>(
  AuthNotifierMp.new,
);
